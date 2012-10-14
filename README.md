PIC24F_btstack
==============

PIC24FのUSB HOSTを使用してUSB Bluetooth ドングルでSPP通信ができるようにします


##動作確認環境
 ターゲットマイコン
 PIC24FJ64GB002

 ドングル
 BT-MicroEDR1X PLANEX

 接続先
 Android 2.3.6

##手順

btstackをダウンロード
btstack - A Portable User-Space Bluetooth Stack - Google Project Hosting 
<http://code.google.com/p/btstack/>

USB Frameworkをダウンロード
Microchip Application Libraries
<http://www.microchip.com/stellent/idcplg?IdcService=SS_GET_PAGE&nodeId=2680&dDocName=en547784>


このリポジトリのファイルとbtstackとUSB Frameworkのファイルを以下のフォルダ構成にします
(btstack, Microchip Libraries of Applicationsのバージョンによってはファイル構成が異なる可能性があります)
<pre>
┬─BT_IO.mcp
│  BT_IO.mcs
│  BT_IO.mcw
│  bt_spp.c
│  bt_spp.h
│  Delay.c
│  Delay.h
│  HardwareProfile.h
│  main.c
│  usb_bt_driver.c
│  usb_bt_driver.h
│  usb_config.c
│  usb_config.h
│  
├─btstack
│  ├─hal
│  │      bt_pic24_hal.c
│  │      
│  ├─include
│  │  │  config.h
│  │  │  inttypes.h
│  │  │  
│  │  └─btstack
│  │          btstack.h
│  │          hal_cpu.h
│  │          hal_tick.h
│  │          hal_uart_dma.h
│  │          hci_cmds.h
│  │          linked_list.h
│  │          memory_pool.h
│  │          run_loop.h
│  │          sdp_util.h
│  │          utils.h
│  │          
│  └─src
│          btstack_memory.c
│          btstack_memory.h
│          bt_control.h
│          debug.h
│          hci.c
│          hci.h
│          hci_cmds.c
│          hci_dump.c
│          hci_dump.h
│          hci_transport.h
│          hci_transport_pic24usb.c
│          l2cap.c
│          l2cap.h
│          l2cap_signaling.c
│          l2cap_signaling.h
│          linked_list.c
│          memory_pool.c
│          remote_device_db.h
│          remote_device_db_memory.c
│          rfcomm.c
│          rfcomm.h
│          run_loop.c
│          run_loop_embedded.c
│          run_loop_private.h
│          sdp.c
│          sdp.h
│          sdp_util.c
│          utils.c
│          
├─Common
│      uart2.c
│      
├─Include
│  │  Compiler.h
│  │  debug.h
│  │  GenericTypeDefs.h
│  │  struct_queue.h
│  │  uart2.h
│  │  
│  └─USB
│          usb.h
│          usb_ch9.h
│          usb_common.h
│          usb_hal.h
│          usb_hal_pic24.h
│          usb_host.h
│          
└─USB
        usb_hal_local.h
        usb_hal_pic24.c
        usb_host.c
        usb_host_local.h
</pre>


##SPP通信の詳細

bt_spp.c

bt_spp_recive_callback
接続中のSPPから受信した場合に呼ばれます


bt_spp_send
接続中のSPPに送信します

packet_handler
ペアリングの番号や装置名を設定しています

