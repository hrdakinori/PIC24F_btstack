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
 * bt_spp.c
 */

#include <string.h>
#include <stdio.h>

#include <btstack/hci_cmds.h>
#include <btstack/run_loop.h>
#include <btstack/sdp_util.h>

#include "btstack/src/hci.h"
#include "btstack/src/l2cap.h"
#include "btstack/src/btstack_memory.h"
#include "btstack/src/remote_device_db.h"
#include "btstack/src/rfcomm.h"
#include "btstack/src/sdp.h"
#include "btstack/include/config.h"

#include "bt_spp.h"

#define USE_AND_OR /* To enable AND_OR mask setting */
#include<ports.h>

static uint16_t  rfcomm_channel_id;

uint16_t bt_localid;
char bt_localname[10] = {'P','I','C','B','T','0','0','0','0',0x00};
char send_buf[17];

/* SPP RECIVE DATA  */
int bt_spp_recive_callback(uint16_t channel, uint8_t *packet, uint16_t size)
{
	packet[size] = 0;
	switch(*(packet+0))
	{
		case 'l':
		case 'L':
			if(*(packet+1) == '1')
			{
				mPORTBSetBits(0x8000);
			}else{
				mPORTBClearBits(0x8000);
			}
			break;
	}
	return 0;
}

/* SPP SEND DATA  */
int bt_spp_send(uint8_t *packet, uint16_t size)
{
	if(rfcomm_channel_id != 0)
	{
		rfcomm_send_internal(rfcomm_channel_id, packet, size);
	}
	return 0;
}


// Bluetooth logic
void bt_packet_handler (void * connection, uint8_t packet_type, uint16_t channel, uint8_t *packet, uint16_t size)
{
    bd_addr_t event_addr;
    uint8_t   rfcomm_channel_nr;
    uint16_t  mtu;
    
	switch (packet_type) {
		case HCI_EVENT_PACKET:
			switch (packet[0]) {
					
				case BTSTACK_EVENT_STATE:
					// bt stack activated, get started - set local name
					if (packet[2] == HCI_STATE_WORKING) {
						if(bt_localid != 0)
						{
				        	hci_send_cmd(&hci_write_authentication_enable, 0);
						}else{
							hci_send_cmd(&hci_read_bd_addr);
						}
					}
					break;
				
				case HCI_EVENT_COMMAND_COMPLETE:
					// use pairing yes/no
					if ( COMMAND_COMPLETE_EVENT(packet, hci_write_authentication_enable) ) {
    				    hci_send_cmd(&hci_write_class_of_device, 0x810100);
					}
					if ( COMMAND_COMPLETE_EVENT(packet, hci_write_class_of_device) ) {
						sprintf(bt_localname,"PICBT%04x",bt_localid);
                        hci_send_cmd(&hci_write_local_name, bt_localname);
					}
					if (COMMAND_COMPLETE_EVENT(packet, hci_read_bd_addr)){
                        bt_flip_addr(event_addr, &packet[6]);
						bt_localid = ((event_addr[4] << 8) | event_addr[5]);
//                        printf("BD-ADDR: %s\n\r", bd_addr_to_str(event_addr));
                        break;
                    }
					if (COMMAND_COMPLETE_EVENT(packet, hci_write_local_name)){
                        hci_discoverable_control(1);
                        break;
                    }
                    break;

				case HCI_EVENT_LINK_KEY_REQUEST:
					// deny link key request
//                    printf("Link key request\n\r");
                    bt_flip_addr(event_addr, &packet[2]);
					hci_send_cmd(&hci_link_key_request_negative_reply, &event_addr);
					break;
					
				case HCI_EVENT_PIN_CODE_REQUEST:
					// inform about pin code request
//                    printf("Pin code request - using '0000'\n\r");
                    bt_flip_addr(event_addr, &packet[2]);
					hci_send_cmd(&hci_pin_code_request_reply, &event_addr, 4, "0000");
					break;
                
                case RFCOMM_EVENT_INCOMING_CONNECTION:
					// data: event (8), len(8), address(48), channel (8), rfcomm_cid (16)
					bt_flip_addr(event_addr, &packet[2]); 
					rfcomm_channel_nr = packet[8];
					rfcomm_channel_id = READ_BT_16(packet, 9);
//					printf("RFCOMM channel %u requested for %s\n\r", rfcomm_channel_nr, bd_addr_to_str(event_addr));
                    rfcomm_accept_connection_internal(rfcomm_channel_id);
					break;
					
				case RFCOMM_EVENT_OPEN_CHANNEL_COMPLETE:
					// data: event(8), len(8), status (8), address (48), server channel(8), rfcomm_cid(16), max frame size(16)
					if (packet[2]) {
//						printf("RFCOMM channel open failed, status %u\n\r", packet[2]);
					} else {
						rfcomm_channel_id = READ_BT_16(packet, 12);
						mtu = READ_BT_16(packet, 14);
//						printf("\n\rRFCOMM channel open succeeded. New RFCOMM Channel ID %u, max frame size %u\n\r", rfcomm_channel_id, mtu);
					}
					break;
                    
                case RFCOMM_EVENT_CHANNEL_CLOSED:
                    rfcomm_channel_id = 0;
                    break;
                
                default:
                    break;
			}
            break;
            
        case RFCOMM_DATA_PACKET:
            // hack: truncate data (we know that the packet is at least on byte bigger
			bt_spp_recive_callback(rfcomm_channel_id, packet, size);
	        rfcomm_grant_credits(rfcomm_channel_id, 1);
        default:
            break;
	}
}
