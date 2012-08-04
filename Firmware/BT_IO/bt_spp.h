/*
 * bt_spp.h
 */

#ifndef _BT_SPP_H__
#define _BT_SPP_H__

void bt_packet_handler (void * connection, uint8_t packet_type, uint16_t channel, uint8_t *packet, uint16_t size);

int bt_spp_recive_callback(uint16_t channel, uint8_t *packet, uint16_t size);
int bt_spp_send(uint8_t *packet, uint16_t size);

#endif	/* _BT_SPP_H_ */
