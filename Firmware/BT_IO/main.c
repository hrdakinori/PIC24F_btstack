/*
Copyright (c) 2012, Akinori Harada
All rights reserved.

Redistribution and use in source and binary forms, with or without
modification, are permitted provided that the following conditions are
met:

  * Redistributions of source code must retain the above copyright
    notice, this list of conditions and the following disclaimer.
  * Redistributions in binary form must reproduce the above
    copyright notice, this list of conditions and the following disclaimer
    in the documentation and/or other materials provided with the
    distribution.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
"AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
(INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
*/

/*
 * main.c
 */

#include <stdlib.h>
#include <stdint.h>

#include "GenericTypeDefs.h"
#include "HardwareProfile.h"
#include "USB/usb.h"
#include "usb_bt_driver.h"

#include <btstack/run_loop.h>
#include <btstack/sdp_util.h>
#include "btstack/src/hci.h"
#include "btstack/src/l2cap.h"
#include "btstack/src/btstack_memory.h"
#include "btstack/src/rfcomm.h"
#include "btstack/src/sdp.h"
#include "btstack/include/config.h"

#include "bt_spp.h"

#include<ports.h>
#include<timer.h>

/* Configuration Bits */

#if defined(__PIC24FJ256GB106__)
    _CONFIG1( JTAGEN_OFF & GCP_OFF & GWRP_OFF & COE_OFF & FWDTEN_OFF & ICS_PGx1) 
    _CONFIG2( PLL_96MHZ_ON & IESO_OFF & FCKSM_CSDCMD & OSCIOFNC_OFF & POSCMOD_HS & FNOSC_PRIPLL & PLLDIV_DIV4 & IOL1WAY_ON)
#elif defined(__PIC24FJ64GB002__)
	_CONFIG1(WDTPS_PS1 & FWPSA_PR32 & WINDIS_OFF & FWDTEN_OFF & ICS_PGx1 & GWRP_OFF & GCP_OFF & JTAGEN_OFF)
	_CONFIG2(POSCMOD_NONE & I2C1SEL_PRI & IOL1WAY_OFF & OSCIOFNC_ON & FCKSM_CSDCMD & FNOSC_FRCPLL & PLL96MHZ_ON & PLLDIV_DIV2 & IESO_OFF)
	_CONFIG3(WPFP_WPFP0 & SOSCSEL_IO & WUTSEL_LEG & WPDIS_WPDIS & WPCFG_WPCFGDIS & WPEND_WPENDMEM)
	_CONFIG4(DSWDTPS_DSWDTPS3 & DSWDTOSC_LPRC & RTCOSC_SOSC & DSBOREN_OFF & DSWDTEN_OFF)
#endif

BYTE deviceAddress = 0;

static uint8_t   rfcomm_channel_nr = 1;
static uint8_t   spp_service_buffer[120];


// USB Event
BOOL USB_ApplicationEventHandler ( BYTE address, USB_EVENT event, void *data, DWORD size )
{
    // Handle specific events.
    switch ( (INT)event )
    {
        case EVENT_VBUS_REQUEST_POWER:
            // We'll let anything attach.
            return TRUE;

        case EVENT_VBUS_RELEASE_POWER:
            // We aren't keeping track of power.
            return TRUE;

        case EVENT_HUB_ATTACH:
            return TRUE;
            break;

        case EVENT_UNSUPPORTED_DEVICE:
            return TRUE;
            break;

        case EVENT_CANNOT_ENUMERATE:
            return TRUE;
            break;

        case EVENT_CLIENT_INIT_ERROR:
            return TRUE;
            break;

        case EVENT_OUT_OF_MEMORY:
            return TRUE;
            break;

        case EVENT_UNSPECIFIED_ERROR:   // This should never be generated.
            return TRUE;
            break;

        case EVENT_SUSPEND:
        case EVENT_DETACH:
        case EVENT_RESUME:
        case EVENT_BUS_ERROR:
            return TRUE;
            break;

        default:
            break;
    }

    return FALSE;

} // USB_ApplicationEventHandler

// USBTask
static int usbhost_process(struct data_source *ds)
{
	// Maintain USB Host State
	USBHostTasks();

	USBHostUSBBTTask();
	return 0;
} 

// SWTask
static int sw_process(struct data_source *ds)
{
	static short swcount;
	static short lastsw;
	if(swcount == 0)
	{
		short sw = mPORTBReadBit(0x4000);
		if(sw != lastsw)
		{
			if(sw == 0x4000)
			{
				bt_spp_send((uint8_t*)"S0",2);
			}else{
				bt_spp_send((uint8_t*)"S1",2);
			}
			swcount = 1500;
			lastsw = sw;
		}
	}
	if(swcount != 0)
	{
		swcount--;
	}
	return 0;
} 

// main
int main ( void )
{
	// Initialize the processor and peripherals.

	// Init Clock
	// CPU 32MHz
	// Peripheral 8MHz
    CLKDIV = 0x0000;
	unsigned int pll_startup_counter = 600;
	CLKDIVbits.PLLEN = 1;
	while(pll_startup_counter--);

	// Configure U2RX - put on pin 17 (RP8)
	RPINR19bits.U2RXR = 8;
	// Configure U2TX - put on pin 16 (RP7)
	RPOR3bits.RP7R = 5;

	// Analog IN Disable
	AD1PCFG = 0xffff;

	EnablePullUpCN12;
	// Port output setup
	mPORTBOutputConfig(0x8000);

	// Init UART
	UART2Init();

	// Init USB
	if ( USBHostInit(0) != TRUE )
    {
        UART2PrintString( "ERR USBHostInit\r\n" );
        while (1);
    }

	/// GET STARTED with BTstack ///
	btstack_memory_init();
    run_loop_init(RUN_LOOP_EMBEDDED);
	
    // init HCI
	hci_transport_t    * transport = hci_transport_usb_instance();
	bt_control_t       * control   = NULL;
    hci_uart_config_t  * config    = NULL;
    remote_device_db_t * remote_db = NULL;//(remote_device_db_t *) &remote_device_db_memory;
	hci_init(transport, config, control, remote_db);
    
    // init L2CAP
    l2cap_init();
    l2cap_register_packet_handler(bt_packet_handler);
    
    // init RFCOMM
    rfcomm_init();
    rfcomm_register_packet_handler(bt_packet_handler);
    rfcomm_register_service_internal(NULL, rfcomm_channel_nr, 100);  // reserved channel, mtu=100

    // init SDP, create record for SPP and register with SDP
    sdp_init();
	memset(spp_service_buffer, 0, sizeof(spp_service_buffer));
    service_record_item_t * service_record_item = (service_record_item_t *) spp_service_buffer;
    sdp_create_spp_service( (uint8_t*) &service_record_item->service_record, 1, "SPP");
//    printf("SDP service buffer size: %u\n\r", (uint16_t) (sizeof(service_record_item_t) + de_get_len((uint8_t*) &service_record_item->service_record)));
    sdp_register_service_internal(NULL, service_record_item);

	// usbhost 
	data_source_t usbhost;
	usbhost.process = &usbhost_process;
	run_loop_add_data_source(&usbhost);

	data_source_t swtask;
	swtask.process = &sw_process;
	run_loop_add_data_source(&swtask);

    // go!
    run_loop_execute();	

    return 0;
} // main
