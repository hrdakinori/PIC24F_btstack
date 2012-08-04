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
 * usb_bt_driver.c
 */

#include <stdlib.h>
#include <string.h>
#include <stdint.h>

#include "Compiler.h"
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

static USBBT_DEVICE g_usbbt;

static BYTE bulk_buf[MAX_DATA_PACKET_LENGTH];
static BYTE int_buf[MAX_DATA_PACKET_LENGTH];

BOOL USBHostUSBBTInit( BYTE address, DWORD flags, BYTE clientDriverID )
{
	int i = 0;
	BYTE   *descriptor;

	UART2PrintString( "USBBT init\r\n" );

	descriptor = USBHostGetCurrentConfigurationDescriptor( address );

	// Find the next interface descriptor.
	while (i < ((USB_CONFIGURATION_DESCRIPTOR *)descriptor)->wTotalLength)
	{
		// See if we are pointing to an interface descriptor.
		if (descriptor[i+1] == USB_DESCRIPTOR_INTERFACE)
		{
			g_usbbt.endpointCtrl = 0;
			g_usbbt.endpointInt = 0;
			g_usbbt.endpointBulkIN = 0;
			g_usbbt.endpointBulkOUT = 0;

			// Scan for endpoint descriptors.
			i += descriptor[i];
			while (descriptor[i+1] == USB_DESCRIPTOR_ENDPOINT)
			{
				if (descriptor[i+3] == 0x02) // Bulk
				{
					if (((descriptor[i+2] & 0x80) == 0x80) && (g_usbbt.endpointBulkIN == 0))
					{
						g_usbbt.endpointBulkIN = descriptor[i+2];
					}
					if (((descriptor[i+2] & 0x80) == 0x00) && (g_usbbt.endpointBulkOUT == 0))
					{
						g_usbbt.endpointBulkOUT = descriptor[i+2];
					}
				}else if(descriptor[i+3] == 0x03) // Interrupt
				{
					g_usbbt.endpointInt = descriptor[i+2];
				}else if(descriptor[i+3] == 0x00) // Control
				{
					g_usbbt.endpointCtrl = descriptor[i+2];
				}
				i += descriptor[i];
			}

			if ((g_usbbt.endpointInt != 0) && (g_usbbt.endpointBulkIN != 0) && (g_usbbt.endpointBulkOUT != 0))
			{
				g_usbbt.initialized = 1;
				g_usbbt.deviceAddress = address;
				g_usbbt.clientDriverID = clientDriverID;
/*				if(g_usbbt.endpointBulkIN_Busy == 0)
				{
					USBHostBlukRead(address,bulk_buf,MAX_DATA_PACKET_LENGTH);
				}
				if(g_usbbt.endpointInt_Busy == 0)
				{
					USBHostIntRead(address,int_buf,MAX_DATA_PACKET_LENGTH);
				}*/
				UART2PrintString( " Control endpoint : " );
				UART2PutHex( g_usbbt.endpointCtrl );
				UART2PrintString( " Interrupt endpoint IN: " );
				UART2PutHex( g_usbbt.endpointInt );
				UART2PrintString( " Bulk endpoint IN: " );
				UART2PutHex( g_usbbt.endpointBulkIN );
				UART2PrintString( " Bulk endpoint OUT: " );
				UART2PutHex( g_usbbt.endpointBulkOUT );
				UART2PrintString( "\r\n" );
				usb_bt_init();
				return TRUE;
			}
		}
		// Jump to the next descriptor in this configuration.
		i += descriptor[i];
	}
	return FALSE;
}

void USBHostUSBBTTask()
{
	if(g_usbbt.initialized != 1)
	{
		return;
	}
}


BOOL USBHostUSBBTEventHandler( BYTE address, USB_EVENT event, void *data, DWORD size )
{
	switch (event)
	{
		case EVENT_NONE:			 // No event occured (NULL event)
			return TRUE;
			break;

		case EVENT_DETACH:			 // USB cable has been detached (data: BYTE, address of device)
			g_usbbt.initialized = 0;
			g_usbbt.deviceAddress = 0;
			UART2PrintString( "USBBT detach \r\n" );
			return TRUE;
			break;

		case EVENT_TRANSFER:		 // A USB transfer has completed - optional
			#if defined( USB_ENABLE_TRANSFER_EVENT )
			if ( (data != NULL) && (size == sizeof(HOST_TRANSFER_DATA)) )
			{
				DWORD i;
				DWORD dataCount = ((HOST_TRANSFER_DATA *)data)->dataCount;
			    BYTE *userData = ((HOST_TRANSFER_DATA *)data)->pUserData;
			    BYTE errorCode = ((HOST_TRANSFER_DATA *)data)->bErrorCode;

				if ( ((HOST_TRANSFER_DATA *)data)->bEndpointAddress == g_usbbt.endpointBulkIN )
				{
					g_usbbt.endpointBulkIN_Busy = 0;
					if(dataCount != 0)
					{
						UART2PrintString( "BulkIN  " );
						for(i = 0; i < dataCount;i++)
						{
							UART2PutHex(userData[i]);
						}
						UART2PrintString( "\r\n" );
						// bt event
						usb_bt_call_handler(USB_BT_EVENT_BULK_READ,userData,dataCount);
					}
				}
				else if ( ((HOST_TRANSFER_DATA *)data)->bEndpointAddress == g_usbbt.endpointBulkOUT )
				{
					UART2PrintString( "BulkOUT \r\n" );
					g_usbbt.endpointBulkOUT_Busy = 0;
			        uint8_t dummy_event = DAEMON_EVENT_HCI_PACKET_SENT;
			        packet_handler(HCI_EVENT_PACKET, &dummy_event, 1);
				}
				else if ( ((HOST_TRANSFER_DATA *)data)->bEndpointAddress == g_usbbt.endpointCtrl )
				{
					UART2PrintString( "Ctrl    \r\n" );
					g_usbbt.endpointCtrl_Busy = 0;
			        uint8_t dummy_event = DAEMON_EVENT_HCI_PACKET_SENT;
			        packet_handler(HCI_EVENT_PACKET, &dummy_event, 1);
				}
				else if ( ((HOST_TRANSFER_DATA *)data)->bEndpointAddress == g_usbbt.endpointInt )
				{
					g_usbbt.endpointInt_Busy = 0;
					if(dataCount != 0)
					{
						UART2PrintString( "Int     " );
						for(i = 0; i < dataCount;i++)
						{
							UART2PutHex(userData[i]);
						}
						UART2PrintString( "\r\n" );
						// bt event
						usb_bt_call_handler(USB_BT_EVENT_INTERRUPT_READ,userData,dataCount);
					}
				}
				else
				{
					return FALSE;
				}

				if(!g_usbbt.endpointCtrl_Busy && !g_usbbt.endpointBulkOUT_Busy)
				{
					if(g_usbbt.endpointBulkIN_Busy == 0)
					{
						USBHostBlukRead(g_usbbt.deviceAddress,bulk_buf,MAX_DATA_PACKET_LENGTH);
					}
					if(g_usbbt.endpointInt_Busy == 0)
					{
						USBHostIntRead(g_usbbt.deviceAddress,int_buf,MAX_DATA_PACKET_LENGTH);
					}
				}
				return TRUE;
			}
			else
				return FALSE;
			#endif

		case EVENT_SOF:				 // Start of frame - NOT NEEDED
		case EVENT_RESUME:			 // Device-mode resume received
		case EVENT_SUSPEND:			 // Device-mode suspend/idle event received
		case EVENT_RESET:			 // Device-mode bus reset received
		case EVENT_STALL:			 // A stall has occured
		case EVENT_BUS_ERROR:
		default:
			break;
	}

	return FALSE;
}

BYTE USBHostIntRead( BYTE deviceAddress, void *buffer, DWORD length )
{
	BYTE RetVal;

	// Validate the call
	if ((g_usbbt.initialized != 1) || 
		(g_usbbt.deviceAddress != deviceAddress)) return USB_INVALID_STATE;
	if (g_usbbt.endpointInt_Busy)	return USB_BUSY;

	// Set the busy flag, clear the count and start a new IN transfer.
	g_usbbt.endpointInt_Busy = 1;
	RetVal = USBHostRead( deviceAddress, g_usbbt.endpointInt, (BYTE *)buffer, length );
	if (RetVal != USB_SUCCESS)
	{
		g_usbbt.endpointInt_Busy = 0;	 // Clear flag to allow re-try
	}

	return RetVal;

}

BYTE USBHostBlukRead( BYTE deviceAddress, void *buffer, DWORD length )
{
	BYTE RetVal;

	// Validate the call
	if ((g_usbbt.initialized != 1) || 
		(g_usbbt.deviceAddress != deviceAddress)) return USB_INVALID_STATE;
	if (g_usbbt.endpointBulkIN_Busy)   return USB_BUSY;

	// Set the busy flag, clear the count and start a new IN transfer.
	g_usbbt.endpointBulkIN_Busy = 1;
	RetVal = USBHostRead( deviceAddress, g_usbbt.endpointBulkIN, (BYTE *)buffer, length );
	if (RetVal != USB_SUCCESS)
	{
		g_usbbt.endpointBulkIN_Busy = 0;	// Clear flag to allow re-try
	}

	return RetVal;

}

BYTE USBHostBlukWrite( BYTE deviceAddress, void *buffer, DWORD length )
{
	BYTE RetVal;
	DWORD i;

	// Validate the call
	if ((g_usbbt.initialized != 1) || 
		(g_usbbt.deviceAddress != deviceAddress)) return USB_INVALID_STATE;
	if (g_usbbt.endpointBulkOUT_Busy)	return USB_BUSY;

	UART2PrintString( "USBHostBlukWrite\r\n" );
	for(i = 0; i < length;i++)
	{
		UART2PutHex(*((char*)buffer+i));
	}
	UART2PrintString( "\r\n" );
	// Set the busy flag and start a new OUT transfer.
	g_usbbt.endpointBulkOUT_Busy = 1;
	RetVal = USBHostWrite( deviceAddress, g_usbbt.endpointBulkOUT, (BYTE *)buffer, length );
	if (RetVal != USB_SUCCESS)
	{
		g_usbbt.endpointBulkOUT_Busy = 0;	 // Clear flag to allow re-try
	}

	return RetVal;

}

BYTE USBHostCtrlWrite( BYTE deviceAddress, void *buffer, DWORD length )
{
	BYTE RetVal;
	DWORD i;

	// Validate the call
	if ((g_usbbt.initialized != 1) || 
		(g_usbbt.deviceAddress != deviceAddress)) return USB_INVALID_STATE;
	if (g_usbbt.endpointCtrl_Busy)	 return USB_BUSY;

	UART2PrintString( "USBHostCtrlWrite\r\n" );
	for(i = 0; i < length;i++)
	{
		UART2PutHex(*((char*)buffer+i));
	}
	UART2PrintString( "\r\n" );
	g_usbbt.endpointCtrl_Busy = 1;
	RetVal = USBHostIssueDeviceRequest( deviceAddress,
										USB_SETUP_HOST_TO_DEVICE|USB_SETUP_TYPE_CLASS,
										0, 0, 0,
										length, buffer,
										USB_DEVICE_REQUEST_SET,
										g_usbbt.clientDriverID);
	if (RetVal != USB_SUCCESS)
	{
		g_usbbt.endpointCtrl_Busy = 0;
	}

	return RetVal;
}

static void (*usb_bt_event_handler)(uint8_t packet_type, uint8_t *packet, uint16_t size) = NULL;

void usb_bt_init()
{
 	// turn on!
	hci_power_control(HCI_POWER_ON);
}

int usb_bt_control_write(uint8_t *packet, int size)
{
	USBHostCtrlWrite(g_usbbt.deviceAddress,packet,size);
	return 0;
}

int usb_bt_can_write_control_now()
{
	return !g_usbbt.endpointCtrl_Busy;
}

int usb_bt_bulk_write(uint8_t *packet, int size)
{
	USBHostBlukWrite(g_usbbt.deviceAddress,packet,size);
	return 0;
}

int usb_bt_can_write_bulk_now()
{
	return !g_usbbt.endpointBulkOUT_Busy;
}

void usb_bt_call_handler(uint8_t packet_type, uint8_t *packet, uint16_t size)
{
	usb_bt_event_handler(packet_type, packet, size);
}

void usb_bt_register_packet_handler(void (*handler)(uint8_t packet_type, uint8_t *packet, uint16_t size))
{
	usb_bt_event_handler = handler;
}

