/*
 * usb_bt_driver.h
 */

#ifndef _USB_BT_DRIVER_H__
#define _USB_BT_DRIVER_H__

#define MAX_DATA_PACKET_LENGTH  64

#define USB_BT_EVENT_INTERRUPT_READ	1
#define USB_BT_EVENT_BULK_READ		2

typedef struct _USBBT_DEVICE
{
	BYTE initialized;
	BYTE deviceAddress;
	BYTE clientDriverID;
	BYTE endpointCtrl;
	BYTE endpointInt;
	BYTE endpointBulkIN;
	BYTE endpointBulkOUT;
	
	BYTE endpointCtrl_Busy;
	BYTE endpointInt_Busy;
	BYTE endpointBulkIN_Busy;
	BYTE endpointBulkOUT_Busy;

} USBBT_DEVICE;

BOOL USBHostUSBBTInit( BYTE address, DWORD flags, BYTE clientDriverID );

void USBHostUSBBTTask();
BOOL USBHostUSBBTEventHandler( BYTE address, USB_EVENT event, void *data, DWORD size );

BYTE USBHostIntRead( BYTE deviceAddress, void *buffer, DWORD length );
BYTE USBHostBlukRead( BYTE deviceAddress, void *buffer, DWORD length );
BYTE USBHostBlukWrite( BYTE deviceAddress, void *buffer, DWORD length );
BYTE USBHostCtrlWrite( BYTE deviceAddress, void *buffer, DWORD length );

void usb_bt_init();
int usb_bt_control_write(uint8_t *packet, int size);
int usb_bt_bulk_write(uint8_t *packet, int size);
int usb_bt_can_write_control_now();
int usb_bt_can_write_bulk_now();

void usb_bt_register_packet_handler(void (*handler)(uint8_t packet_type, uint8_t *packet, uint16_t size));
void usb_bt_call_handler(uint8_t packet_type, uint8_t *packet, uint16_t size);

#endif	/* _USB_BT_DRIVER_H__ */
