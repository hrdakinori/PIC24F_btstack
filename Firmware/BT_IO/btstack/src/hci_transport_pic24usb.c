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
 * hci_transport_pic24usb.c
 * HCI Transport API implementation for PIC24F USB HOST
 */

#include <stdio.h>
#include <string.h>

#include "GenericTypeDefs.h"
#include "USB/usb.h"

#include "config.h"

#include "debug.h"
#include "hci.h"
#include "hci_transport.h"
#include "hci_dump.h"

#include "usb_bt_driver.h"

// prototypes
static void dummy_handler(uint8_t packet_type, uint8_t *packet, uint16_t size); 

static  void (*packet_handler)(uint8_t packet_type, uint8_t *packet, uint16_t size) = dummy_handler;

void usb_bt_callback(uint8_t event_type, uint8_t *data, uint16_t size)
{
	switch(event_type)
	{
		case USB_BT_EVENT_INTERRUPT_READ:
            hci_dump_packet( HCI_EVENT_PACKET, 1, data, size);
			packet_handler(HCI_EVENT_PACKET,data,size);
		break;
		case USB_BT_EVENT_BULK_READ:
            hci_dump_packet( HCI_ACL_DATA_PACKET, 1, data, size);
			packet_handler(HCI_ACL_DATA_PACKET,data,size);
		break;
		default:
		break;
	}
}

static int usb_open(void *transport_config){

	usb_bt_register_packet_handler(&usb_bt_callback);
    return 0;
}
static int usb_close(void *transport_config){

    return 0;
}

static int usb_send_cmd_packet(uint8_t *packet, int size){
    int r;
   
    hci_dump_packet( HCI_COMMAND_DATA_PACKET, 0, packet, size);
    
    // Use synchronous call to sent out command
    r = usb_bt_control_write(packet, size);

    if (r < 0 || r !=size ) {
        log_error("Error submitting control transfer %d\n", r);
        return r;
    }
    
    return 0;
}

static int usb_send_acl_packet(uint8_t *packet, int size){
    int r;
    
    hci_dump_packet( HCI_ACL_DATA_PACKET, 0, packet, size);
    
    // Use synchronous call to sent out data
    r = usb_bt_bulk_write(packet, size);
    if(r < 0){
        log_error("Error submitting data transfer");
    }

    return 0;
}

static int usb_send_packet(uint8_t packet_type, uint8_t * packet, int size){
    switch (packet_type){
        case HCI_COMMAND_DATA_PACKET:
            return usb_send_cmd_packet(packet, size);
        case HCI_ACL_DATA_PACKET:
            return usb_send_acl_packet(packet, size);
        default:
            return -1;
    }
}

static void usb_register_packet_handler(void (*handler)(uint8_t packet_type, uint8_t *packet, uint16_t size)){
    log_info("registering packet handler\n");
    packet_handler = handler;
}

static int usb_can_send_packet_now(uint8_t packet_type)
{
    switch (packet_type){
        case HCI_COMMAND_DATA_PACKET:
            return usb_bt_can_write_control_now();
        case HCI_ACL_DATA_PACKET:
            return usb_bt_can_write_bulk_now();
        default:
            return -1;
    }
}

static const char * usb_get_transport_name(void){
    return "PIC24USB";
}

static void dummy_handler(uint8_t packet_type, uint8_t *packet, uint16_t size){
}

// single instance
static const hci_transport_t hci_transport_usb = 
{
	.open                          = usb_open,
    .close                         = usb_close,
    .send_packet                   = usb_send_packet,
    .register_packet_handler       = usb_register_packet_handler,
    .get_transport_name            = usb_get_transport_name,
    .set_baudrate                  = NULL,
    .can_send_packet_now           = usb_can_send_packet_now
};

// get usb singleton
hci_transport_t * hci_transport_usb_instance()
{
    return (hci_transport_t *) &hci_transport_usb;
}
