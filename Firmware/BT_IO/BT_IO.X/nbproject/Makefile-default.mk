#
# Generated Makefile - do not edit!
#
# Edit the Makefile in the project folder instead (../Makefile). Each target
# has a -pre and a -post target defined where you can add customized code.
#
# This makefile implements configuration specific macros and targets.


# Include project Makefile
ifeq "${IGNORE_LOCAL}" "TRUE"
# do not include local makefile. User is passing all local related variables already
else
include Makefile
# Include makefile containing local settings
ifeq "$(wildcard nbproject/Makefile-local-default.mk)" "nbproject/Makefile-local-default.mk"
include nbproject/Makefile-local-default.mk
endif
endif

# Environment
MKDIR=gnumkdir -p
RM=rm -f 
MV=mv 
CP=cp 

# Macros
CND_CONF=default
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
IMAGE_TYPE=debug
OUTPUT_SUFFIX=elf
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=dist/${CND_CONF}/${IMAGE_TYPE}/BT_IO.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
else
IMAGE_TYPE=production
OUTPUT_SUFFIX=hex
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=dist/${CND_CONF}/${IMAGE_TYPE}/BT_IO.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
endif

# Object Directory
OBJECTDIR=build/${CND_CONF}/${IMAGE_TYPE}

# Distribution Directory
DISTDIR=dist/${CND_CONF}/${IMAGE_TYPE}

# Object Files Quoted if spaced
OBJECTFILES_QUOTED_IF_SPACED=${OBJECTDIR}/_ext/222049284/btstack_memory.o ${OBJECTDIR}/_ext/222049284/hci.o ${OBJECTDIR}/_ext/222049284/hci_cmds.o ${OBJECTDIR}/_ext/222049284/hci_dump.o ${OBJECTDIR}/_ext/222049284/l2cap.o ${OBJECTDIR}/_ext/222049284/l2cap_signaling.o ${OBJECTDIR}/_ext/222049284/linked_list.o ${OBJECTDIR}/_ext/222049284/memory_pool.o ${OBJECTDIR}/_ext/222049284/remote_device_db_memory.o ${OBJECTDIR}/_ext/222049284/rfcomm.o ${OBJECTDIR}/_ext/222049284/run_loop.o ${OBJECTDIR}/_ext/222049284/run_loop_embedded.o ${OBJECTDIR}/_ext/222049284/sdp.o ${OBJECTDIR}/_ext/222049284/sdp_util.o ${OBJECTDIR}/_ext/222049284/utils.o ${OBJECTDIR}/_ext/222049284/hci_transport_pic24usb.o ${OBJECTDIR}/_ext/2108356922/uart2.o ${OBJECTDIR}/_ext/1360907413/usb_host.o ${OBJECTDIR}/_ext/1360907413/usb_hal_pic24.o ${OBJECTDIR}/_ext/1472/main.o ${OBJECTDIR}/_ext/1472/Delay.o ${OBJECTDIR}/_ext/1472/usb_config.o ${OBJECTDIR}/_ext/222060373/bt_pic24_hal.o ${OBJECTDIR}/_ext/1472/usb_bt_driver.o ${OBJECTDIR}/_ext/1472/bt_spp.o
POSSIBLE_DEPFILES=${OBJECTDIR}/_ext/222049284/btstack_memory.o.d ${OBJECTDIR}/_ext/222049284/hci.o.d ${OBJECTDIR}/_ext/222049284/hci_cmds.o.d ${OBJECTDIR}/_ext/222049284/hci_dump.o.d ${OBJECTDIR}/_ext/222049284/l2cap.o.d ${OBJECTDIR}/_ext/222049284/l2cap_signaling.o.d ${OBJECTDIR}/_ext/222049284/linked_list.o.d ${OBJECTDIR}/_ext/222049284/memory_pool.o.d ${OBJECTDIR}/_ext/222049284/remote_device_db_memory.o.d ${OBJECTDIR}/_ext/222049284/rfcomm.o.d ${OBJECTDIR}/_ext/222049284/run_loop.o.d ${OBJECTDIR}/_ext/222049284/run_loop_embedded.o.d ${OBJECTDIR}/_ext/222049284/sdp.o.d ${OBJECTDIR}/_ext/222049284/sdp_util.o.d ${OBJECTDIR}/_ext/222049284/utils.o.d ${OBJECTDIR}/_ext/222049284/hci_transport_pic24usb.o.d ${OBJECTDIR}/_ext/2108356922/uart2.o.d ${OBJECTDIR}/_ext/1360907413/usb_host.o.d ${OBJECTDIR}/_ext/1360907413/usb_hal_pic24.o.d ${OBJECTDIR}/_ext/1472/main.o.d ${OBJECTDIR}/_ext/1472/Delay.o.d ${OBJECTDIR}/_ext/1472/usb_config.o.d ${OBJECTDIR}/_ext/222060373/bt_pic24_hal.o.d ${OBJECTDIR}/_ext/1472/usb_bt_driver.o.d ${OBJECTDIR}/_ext/1472/bt_spp.o.d

# Object Files
OBJECTFILES=${OBJECTDIR}/_ext/222049284/btstack_memory.o ${OBJECTDIR}/_ext/222049284/hci.o ${OBJECTDIR}/_ext/222049284/hci_cmds.o ${OBJECTDIR}/_ext/222049284/hci_dump.o ${OBJECTDIR}/_ext/222049284/l2cap.o ${OBJECTDIR}/_ext/222049284/l2cap_signaling.o ${OBJECTDIR}/_ext/222049284/linked_list.o ${OBJECTDIR}/_ext/222049284/memory_pool.o ${OBJECTDIR}/_ext/222049284/remote_device_db_memory.o ${OBJECTDIR}/_ext/222049284/rfcomm.o ${OBJECTDIR}/_ext/222049284/run_loop.o ${OBJECTDIR}/_ext/222049284/run_loop_embedded.o ${OBJECTDIR}/_ext/222049284/sdp.o ${OBJECTDIR}/_ext/222049284/sdp_util.o ${OBJECTDIR}/_ext/222049284/utils.o ${OBJECTDIR}/_ext/222049284/hci_transport_pic24usb.o ${OBJECTDIR}/_ext/2108356922/uart2.o ${OBJECTDIR}/_ext/1360907413/usb_host.o ${OBJECTDIR}/_ext/1360907413/usb_hal_pic24.o ${OBJECTDIR}/_ext/1472/main.o ${OBJECTDIR}/_ext/1472/Delay.o ${OBJECTDIR}/_ext/1472/usb_config.o ${OBJECTDIR}/_ext/222060373/bt_pic24_hal.o ${OBJECTDIR}/_ext/1472/usb_bt_driver.o ${OBJECTDIR}/_ext/1472/bt_spp.o


CFLAGS=
ASFLAGS=
LDLIBSOPTIONS=

############# Tool locations ##########################################
# If you copy a project from one host to another, the path where the  #
# compiler is installed may be different.                             #
# If you open this project with MPLAB X in the new host, this         #
# makefile will be regenerated and the paths will be corrected.       #
#######################################################################
# fixDeps replaces a bunch of sed/cat/printf statements that slow down the build
FIXDEPS=fixDeps

.build-conf:  ${BUILD_SUBPROJECTS}
	${MAKE} ${MAKE_OPTIONS} -f nbproject/Makefile-default.mk dist/${CND_CONF}/${IMAGE_TYPE}/BT_IO.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}

MP_PROCESSOR_OPTION=24FJ64GB002
MP_LINKER_FILE_OPTION=,--script=p24FJ64GB002.gld
# ------------------------------------------------------------------------------------
# Rules for buildStep: compile
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${OBJECTDIR}/_ext/222049284/btstack_memory.o: ../btstack/src/btstack_memory.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/222049284 
	@${RM} ${OBJECTDIR}/_ext/222049284/btstack_memory.o.d 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../btstack/src/btstack_memory.c  -o ${OBJECTDIR}/_ext/222049284/btstack_memory.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/222049284/btstack_memory.o.d"        -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -omf=elf -mlarge-code -mlarge-data -O1 -I"../btstack/include" -I"../btstack" -I"../include" -I"../USB" -I"../common" -I".." -I"../btstack/include/btstack" -I"../Include" -I"../Include/USB" -I"../btstack/src" -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/_ext/222049284/btstack_memory.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/222049284/hci.o: ../btstack/src/hci.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/222049284 
	@${RM} ${OBJECTDIR}/_ext/222049284/hci.o.d 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../btstack/src/hci.c  -o ${OBJECTDIR}/_ext/222049284/hci.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/222049284/hci.o.d"        -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -omf=elf -mlarge-code -mlarge-data -O1 -I"../btstack/include" -I"../btstack" -I"../include" -I"../USB" -I"../common" -I".." -I"../btstack/include/btstack" -I"../Include" -I"../Include/USB" -I"../btstack/src" -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/_ext/222049284/hci.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/222049284/hci_cmds.o: ../btstack/src/hci_cmds.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/222049284 
	@${RM} ${OBJECTDIR}/_ext/222049284/hci_cmds.o.d 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../btstack/src/hci_cmds.c  -o ${OBJECTDIR}/_ext/222049284/hci_cmds.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/222049284/hci_cmds.o.d"        -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -omf=elf -mlarge-code -mlarge-data -O1 -I"../btstack/include" -I"../btstack" -I"../include" -I"../USB" -I"../common" -I".." -I"../btstack/include/btstack" -I"../Include" -I"../Include/USB" -I"../btstack/src" -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/_ext/222049284/hci_cmds.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/222049284/hci_dump.o: ../btstack/src/hci_dump.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/222049284 
	@${RM} ${OBJECTDIR}/_ext/222049284/hci_dump.o.d 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../btstack/src/hci_dump.c  -o ${OBJECTDIR}/_ext/222049284/hci_dump.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/222049284/hci_dump.o.d"        -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -omf=elf -mlarge-code -mlarge-data -O1 -I"../btstack/include" -I"../btstack" -I"../include" -I"../USB" -I"../common" -I".." -I"../btstack/include/btstack" -I"../Include" -I"../Include/USB" -I"../btstack/src" -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/_ext/222049284/hci_dump.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/222049284/l2cap.o: ../btstack/src/l2cap.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/222049284 
	@${RM} ${OBJECTDIR}/_ext/222049284/l2cap.o.d 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../btstack/src/l2cap.c  -o ${OBJECTDIR}/_ext/222049284/l2cap.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/222049284/l2cap.o.d"        -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -omf=elf -mlarge-code -mlarge-data -O1 -I"../btstack/include" -I"../btstack" -I"../include" -I"../USB" -I"../common" -I".." -I"../btstack/include/btstack" -I"../Include" -I"../Include/USB" -I"../btstack/src" -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/_ext/222049284/l2cap.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/222049284/l2cap_signaling.o: ../btstack/src/l2cap_signaling.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/222049284 
	@${RM} ${OBJECTDIR}/_ext/222049284/l2cap_signaling.o.d 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../btstack/src/l2cap_signaling.c  -o ${OBJECTDIR}/_ext/222049284/l2cap_signaling.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/222049284/l2cap_signaling.o.d"        -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -omf=elf -mlarge-code -mlarge-data -O1 -I"../btstack/include" -I"../btstack" -I"../include" -I"../USB" -I"../common" -I".." -I"../btstack/include/btstack" -I"../Include" -I"../Include/USB" -I"../btstack/src" -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/_ext/222049284/l2cap_signaling.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/222049284/linked_list.o: ../btstack/src/linked_list.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/222049284 
	@${RM} ${OBJECTDIR}/_ext/222049284/linked_list.o.d 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../btstack/src/linked_list.c  -o ${OBJECTDIR}/_ext/222049284/linked_list.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/222049284/linked_list.o.d"        -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -omf=elf -mlarge-code -mlarge-data -O1 -I"../btstack/include" -I"../btstack" -I"../include" -I"../USB" -I"../common" -I".." -I"../btstack/include/btstack" -I"../Include" -I"../Include/USB" -I"../btstack/src" -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/_ext/222049284/linked_list.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/222049284/memory_pool.o: ../btstack/src/memory_pool.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/222049284 
	@${RM} ${OBJECTDIR}/_ext/222049284/memory_pool.o.d 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../btstack/src/memory_pool.c  -o ${OBJECTDIR}/_ext/222049284/memory_pool.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/222049284/memory_pool.o.d"        -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -omf=elf -mlarge-code -mlarge-data -O1 -I"../btstack/include" -I"../btstack" -I"../include" -I"../USB" -I"../common" -I".." -I"../btstack/include/btstack" -I"../Include" -I"../Include/USB" -I"../btstack/src" -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/_ext/222049284/memory_pool.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/222049284/remote_device_db_memory.o: ../btstack/src/remote_device_db_memory.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/222049284 
	@${RM} ${OBJECTDIR}/_ext/222049284/remote_device_db_memory.o.d 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../btstack/src/remote_device_db_memory.c  -o ${OBJECTDIR}/_ext/222049284/remote_device_db_memory.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/222049284/remote_device_db_memory.o.d"        -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -omf=elf -mlarge-code -mlarge-data -O1 -I"../btstack/include" -I"../btstack" -I"../include" -I"../USB" -I"../common" -I".." -I"../btstack/include/btstack" -I"../Include" -I"../Include/USB" -I"../btstack/src" -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/_ext/222049284/remote_device_db_memory.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/222049284/rfcomm.o: ../btstack/src/rfcomm.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/222049284 
	@${RM} ${OBJECTDIR}/_ext/222049284/rfcomm.o.d 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../btstack/src/rfcomm.c  -o ${OBJECTDIR}/_ext/222049284/rfcomm.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/222049284/rfcomm.o.d"        -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -omf=elf -mlarge-code -mlarge-data -O1 -I"../btstack/include" -I"../btstack" -I"../include" -I"../USB" -I"../common" -I".." -I"../btstack/include/btstack" -I"../Include" -I"../Include/USB" -I"../btstack/src" -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/_ext/222049284/rfcomm.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/222049284/run_loop.o: ../btstack/src/run_loop.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/222049284 
	@${RM} ${OBJECTDIR}/_ext/222049284/run_loop.o.d 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../btstack/src/run_loop.c  -o ${OBJECTDIR}/_ext/222049284/run_loop.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/222049284/run_loop.o.d"        -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -omf=elf -mlarge-code -mlarge-data -O1 -I"../btstack/include" -I"../btstack" -I"../include" -I"../USB" -I"../common" -I".." -I"../btstack/include/btstack" -I"../Include" -I"../Include/USB" -I"../btstack/src" -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/_ext/222049284/run_loop.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/222049284/run_loop_embedded.o: ../btstack/src/run_loop_embedded.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/222049284 
	@${RM} ${OBJECTDIR}/_ext/222049284/run_loop_embedded.o.d 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../btstack/src/run_loop_embedded.c  -o ${OBJECTDIR}/_ext/222049284/run_loop_embedded.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/222049284/run_loop_embedded.o.d"        -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -omf=elf -mlarge-code -mlarge-data -O1 -I"../btstack/include" -I"../btstack" -I"../include" -I"../USB" -I"../common" -I".." -I"../btstack/include/btstack" -I"../Include" -I"../Include/USB" -I"../btstack/src" -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/_ext/222049284/run_loop_embedded.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/222049284/sdp.o: ../btstack/src/sdp.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/222049284 
	@${RM} ${OBJECTDIR}/_ext/222049284/sdp.o.d 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../btstack/src/sdp.c  -o ${OBJECTDIR}/_ext/222049284/sdp.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/222049284/sdp.o.d"        -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -omf=elf -mlarge-code -mlarge-data -O1 -I"../btstack/include" -I"../btstack" -I"../include" -I"../USB" -I"../common" -I".." -I"../btstack/include/btstack" -I"../Include" -I"../Include/USB" -I"../btstack/src" -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/_ext/222049284/sdp.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/222049284/sdp_util.o: ../btstack/src/sdp_util.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/222049284 
	@${RM} ${OBJECTDIR}/_ext/222049284/sdp_util.o.d 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../btstack/src/sdp_util.c  -o ${OBJECTDIR}/_ext/222049284/sdp_util.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/222049284/sdp_util.o.d"        -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -omf=elf -mlarge-code -mlarge-data -O1 -I"../btstack/include" -I"../btstack" -I"../include" -I"../USB" -I"../common" -I".." -I"../btstack/include/btstack" -I"../Include" -I"../Include/USB" -I"../btstack/src" -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/_ext/222049284/sdp_util.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/222049284/utils.o: ../btstack/src/utils.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/222049284 
	@${RM} ${OBJECTDIR}/_ext/222049284/utils.o.d 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../btstack/src/utils.c  -o ${OBJECTDIR}/_ext/222049284/utils.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/222049284/utils.o.d"        -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -omf=elf -mlarge-code -mlarge-data -O1 -I"../btstack/include" -I"../btstack" -I"../include" -I"../USB" -I"../common" -I".." -I"../btstack/include/btstack" -I"../Include" -I"../Include/USB" -I"../btstack/src" -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/_ext/222049284/utils.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/222049284/hci_transport_pic24usb.o: ../btstack/src/hci_transport_pic24usb.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/222049284 
	@${RM} ${OBJECTDIR}/_ext/222049284/hci_transport_pic24usb.o.d 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../btstack/src/hci_transport_pic24usb.c  -o ${OBJECTDIR}/_ext/222049284/hci_transport_pic24usb.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/222049284/hci_transport_pic24usb.o.d"        -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -omf=elf -mlarge-code -mlarge-data -O1 -I"../btstack/include" -I"../btstack" -I"../include" -I"../USB" -I"../common" -I".." -I"../btstack/include/btstack" -I"../Include" -I"../Include/USB" -I"../btstack/src" -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/_ext/222049284/hci_transport_pic24usb.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/2108356922/uart2.o: ../Common/uart2.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/2108356922 
	@${RM} ${OBJECTDIR}/_ext/2108356922/uart2.o.d 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../Common/uart2.c  -o ${OBJECTDIR}/_ext/2108356922/uart2.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/2108356922/uart2.o.d"        -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -omf=elf -mlarge-code -mlarge-data -O1 -I"../btstack/include" -I"../btstack" -I"../include" -I"../USB" -I"../common" -I".." -I"../btstack/include/btstack" -I"../Include" -I"../Include/USB" -I"../btstack/src" -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/_ext/2108356922/uart2.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1360907413/usb_host.o: ../USB/usb_host.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1360907413 
	@${RM} ${OBJECTDIR}/_ext/1360907413/usb_host.o.d 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../USB/usb_host.c  -o ${OBJECTDIR}/_ext/1360907413/usb_host.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1360907413/usb_host.o.d"        -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -omf=elf -mlarge-code -mlarge-data -O1 -I"../btstack/include" -I"../btstack" -I"../include" -I"../USB" -I"../common" -I".." -I"../btstack/include/btstack" -I"../Include" -I"../Include/USB" -I"../btstack/src" -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/_ext/1360907413/usb_host.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1360907413/usb_hal_pic24.o: ../USB/usb_hal_pic24.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1360907413 
	@${RM} ${OBJECTDIR}/_ext/1360907413/usb_hal_pic24.o.d 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../USB/usb_hal_pic24.c  -o ${OBJECTDIR}/_ext/1360907413/usb_hal_pic24.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1360907413/usb_hal_pic24.o.d"        -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -omf=elf -mlarge-code -mlarge-data -O1 -I"../btstack/include" -I"../btstack" -I"../include" -I"../USB" -I"../common" -I".." -I"../btstack/include/btstack" -I"../Include" -I"../Include/USB" -I"../btstack/src" -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/_ext/1360907413/usb_hal_pic24.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1472/main.o: ../main.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1472 
	@${RM} ${OBJECTDIR}/_ext/1472/main.o.d 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../main.c  -o ${OBJECTDIR}/_ext/1472/main.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1472/main.o.d"        -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -omf=elf -mlarge-code -mlarge-data -O1 -I"../btstack/include" -I"../btstack" -I"../include" -I"../USB" -I"../common" -I".." -I"../btstack/include/btstack" -I"../Include" -I"../Include/USB" -I"../btstack/src" -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/_ext/1472/main.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1472/Delay.o: ../Delay.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1472 
	@${RM} ${OBJECTDIR}/_ext/1472/Delay.o.d 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../Delay.c  -o ${OBJECTDIR}/_ext/1472/Delay.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1472/Delay.o.d"        -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -omf=elf -mlarge-code -mlarge-data -O1 -I"../btstack/include" -I"../btstack" -I"../include" -I"../USB" -I"../common" -I".." -I"../btstack/include/btstack" -I"../Include" -I"../Include/USB" -I"../btstack/src" -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/_ext/1472/Delay.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1472/usb_config.o: ../usb_config.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1472 
	@${RM} ${OBJECTDIR}/_ext/1472/usb_config.o.d 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../usb_config.c  -o ${OBJECTDIR}/_ext/1472/usb_config.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1472/usb_config.o.d"        -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -omf=elf -mlarge-code -mlarge-data -O1 -I"../btstack/include" -I"../btstack" -I"../include" -I"../USB" -I"../common" -I".." -I"../btstack/include/btstack" -I"../Include" -I"../Include/USB" -I"../btstack/src" -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/_ext/1472/usb_config.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/222060373/bt_pic24_hal.o: ../btstack/hal/bt_pic24_hal.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/222060373 
	@${RM} ${OBJECTDIR}/_ext/222060373/bt_pic24_hal.o.d 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../btstack/hal/bt_pic24_hal.c  -o ${OBJECTDIR}/_ext/222060373/bt_pic24_hal.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/222060373/bt_pic24_hal.o.d"        -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -omf=elf -mlarge-code -mlarge-data -O1 -I"../btstack/include" -I"../btstack" -I"../include" -I"../USB" -I"../common" -I".." -I"../btstack/include/btstack" -I"../Include" -I"../Include/USB" -I"../btstack/src" -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/_ext/222060373/bt_pic24_hal.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1472/usb_bt_driver.o: ../usb_bt_driver.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1472 
	@${RM} ${OBJECTDIR}/_ext/1472/usb_bt_driver.o.d 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../usb_bt_driver.c  -o ${OBJECTDIR}/_ext/1472/usb_bt_driver.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1472/usb_bt_driver.o.d"        -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -omf=elf -mlarge-code -mlarge-data -O1 -I"../btstack/include" -I"../btstack" -I"../include" -I"../USB" -I"../common" -I".." -I"../btstack/include/btstack" -I"../Include" -I"../Include/USB" -I"../btstack/src" -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/_ext/1472/usb_bt_driver.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1472/bt_spp.o: ../bt_spp.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1472 
	@${RM} ${OBJECTDIR}/_ext/1472/bt_spp.o.d 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../bt_spp.c  -o ${OBJECTDIR}/_ext/1472/bt_spp.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1472/bt_spp.o.d"        -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -omf=elf -mlarge-code -mlarge-data -O1 -I"../btstack/include" -I"../btstack" -I"../include" -I"../USB" -I"../common" -I".." -I"../btstack/include/btstack" -I"../Include" -I"../Include/USB" -I"../btstack/src" -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/_ext/1472/bt_spp.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
else
${OBJECTDIR}/_ext/222049284/btstack_memory.o: ../btstack/src/btstack_memory.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/222049284 
	@${RM} ${OBJECTDIR}/_ext/222049284/btstack_memory.o.d 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../btstack/src/btstack_memory.c  -o ${OBJECTDIR}/_ext/222049284/btstack_memory.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/222049284/btstack_memory.o.d"        -g -omf=elf -mlarge-code -mlarge-data -O1 -I"../btstack/include" -I"../btstack" -I"../include" -I"../USB" -I"../common" -I".." -I"../btstack/include/btstack" -I"../Include" -I"../Include/USB" -I"../btstack/src" -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/_ext/222049284/btstack_memory.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/222049284/hci.o: ../btstack/src/hci.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/222049284 
	@${RM} ${OBJECTDIR}/_ext/222049284/hci.o.d 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../btstack/src/hci.c  -o ${OBJECTDIR}/_ext/222049284/hci.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/222049284/hci.o.d"        -g -omf=elf -mlarge-code -mlarge-data -O1 -I"../btstack/include" -I"../btstack" -I"../include" -I"../USB" -I"../common" -I".." -I"../btstack/include/btstack" -I"../Include" -I"../Include/USB" -I"../btstack/src" -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/_ext/222049284/hci.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/222049284/hci_cmds.o: ../btstack/src/hci_cmds.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/222049284 
	@${RM} ${OBJECTDIR}/_ext/222049284/hci_cmds.o.d 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../btstack/src/hci_cmds.c  -o ${OBJECTDIR}/_ext/222049284/hci_cmds.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/222049284/hci_cmds.o.d"        -g -omf=elf -mlarge-code -mlarge-data -O1 -I"../btstack/include" -I"../btstack" -I"../include" -I"../USB" -I"../common" -I".." -I"../btstack/include/btstack" -I"../Include" -I"../Include/USB" -I"../btstack/src" -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/_ext/222049284/hci_cmds.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/222049284/hci_dump.o: ../btstack/src/hci_dump.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/222049284 
	@${RM} ${OBJECTDIR}/_ext/222049284/hci_dump.o.d 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../btstack/src/hci_dump.c  -o ${OBJECTDIR}/_ext/222049284/hci_dump.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/222049284/hci_dump.o.d"        -g -omf=elf -mlarge-code -mlarge-data -O1 -I"../btstack/include" -I"../btstack" -I"../include" -I"../USB" -I"../common" -I".." -I"../btstack/include/btstack" -I"../Include" -I"../Include/USB" -I"../btstack/src" -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/_ext/222049284/hci_dump.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/222049284/l2cap.o: ../btstack/src/l2cap.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/222049284 
	@${RM} ${OBJECTDIR}/_ext/222049284/l2cap.o.d 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../btstack/src/l2cap.c  -o ${OBJECTDIR}/_ext/222049284/l2cap.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/222049284/l2cap.o.d"        -g -omf=elf -mlarge-code -mlarge-data -O1 -I"../btstack/include" -I"../btstack" -I"../include" -I"../USB" -I"../common" -I".." -I"../btstack/include/btstack" -I"../Include" -I"../Include/USB" -I"../btstack/src" -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/_ext/222049284/l2cap.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/222049284/l2cap_signaling.o: ../btstack/src/l2cap_signaling.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/222049284 
	@${RM} ${OBJECTDIR}/_ext/222049284/l2cap_signaling.o.d 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../btstack/src/l2cap_signaling.c  -o ${OBJECTDIR}/_ext/222049284/l2cap_signaling.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/222049284/l2cap_signaling.o.d"        -g -omf=elf -mlarge-code -mlarge-data -O1 -I"../btstack/include" -I"../btstack" -I"../include" -I"../USB" -I"../common" -I".." -I"../btstack/include/btstack" -I"../Include" -I"../Include/USB" -I"../btstack/src" -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/_ext/222049284/l2cap_signaling.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/222049284/linked_list.o: ../btstack/src/linked_list.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/222049284 
	@${RM} ${OBJECTDIR}/_ext/222049284/linked_list.o.d 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../btstack/src/linked_list.c  -o ${OBJECTDIR}/_ext/222049284/linked_list.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/222049284/linked_list.o.d"        -g -omf=elf -mlarge-code -mlarge-data -O1 -I"../btstack/include" -I"../btstack" -I"../include" -I"../USB" -I"../common" -I".." -I"../btstack/include/btstack" -I"../Include" -I"../Include/USB" -I"../btstack/src" -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/_ext/222049284/linked_list.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/222049284/memory_pool.o: ../btstack/src/memory_pool.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/222049284 
	@${RM} ${OBJECTDIR}/_ext/222049284/memory_pool.o.d 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../btstack/src/memory_pool.c  -o ${OBJECTDIR}/_ext/222049284/memory_pool.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/222049284/memory_pool.o.d"        -g -omf=elf -mlarge-code -mlarge-data -O1 -I"../btstack/include" -I"../btstack" -I"../include" -I"../USB" -I"../common" -I".." -I"../btstack/include/btstack" -I"../Include" -I"../Include/USB" -I"../btstack/src" -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/_ext/222049284/memory_pool.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/222049284/remote_device_db_memory.o: ../btstack/src/remote_device_db_memory.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/222049284 
	@${RM} ${OBJECTDIR}/_ext/222049284/remote_device_db_memory.o.d 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../btstack/src/remote_device_db_memory.c  -o ${OBJECTDIR}/_ext/222049284/remote_device_db_memory.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/222049284/remote_device_db_memory.o.d"        -g -omf=elf -mlarge-code -mlarge-data -O1 -I"../btstack/include" -I"../btstack" -I"../include" -I"../USB" -I"../common" -I".." -I"../btstack/include/btstack" -I"../Include" -I"../Include/USB" -I"../btstack/src" -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/_ext/222049284/remote_device_db_memory.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/222049284/rfcomm.o: ../btstack/src/rfcomm.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/222049284 
	@${RM} ${OBJECTDIR}/_ext/222049284/rfcomm.o.d 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../btstack/src/rfcomm.c  -o ${OBJECTDIR}/_ext/222049284/rfcomm.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/222049284/rfcomm.o.d"        -g -omf=elf -mlarge-code -mlarge-data -O1 -I"../btstack/include" -I"../btstack" -I"../include" -I"../USB" -I"../common" -I".." -I"../btstack/include/btstack" -I"../Include" -I"../Include/USB" -I"../btstack/src" -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/_ext/222049284/rfcomm.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/222049284/run_loop.o: ../btstack/src/run_loop.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/222049284 
	@${RM} ${OBJECTDIR}/_ext/222049284/run_loop.o.d 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../btstack/src/run_loop.c  -o ${OBJECTDIR}/_ext/222049284/run_loop.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/222049284/run_loop.o.d"        -g -omf=elf -mlarge-code -mlarge-data -O1 -I"../btstack/include" -I"../btstack" -I"../include" -I"../USB" -I"../common" -I".." -I"../btstack/include/btstack" -I"../Include" -I"../Include/USB" -I"../btstack/src" -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/_ext/222049284/run_loop.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/222049284/run_loop_embedded.o: ../btstack/src/run_loop_embedded.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/222049284 
	@${RM} ${OBJECTDIR}/_ext/222049284/run_loop_embedded.o.d 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../btstack/src/run_loop_embedded.c  -o ${OBJECTDIR}/_ext/222049284/run_loop_embedded.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/222049284/run_loop_embedded.o.d"        -g -omf=elf -mlarge-code -mlarge-data -O1 -I"../btstack/include" -I"../btstack" -I"../include" -I"../USB" -I"../common" -I".." -I"../btstack/include/btstack" -I"../Include" -I"../Include/USB" -I"../btstack/src" -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/_ext/222049284/run_loop_embedded.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/222049284/sdp.o: ../btstack/src/sdp.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/222049284 
	@${RM} ${OBJECTDIR}/_ext/222049284/sdp.o.d 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../btstack/src/sdp.c  -o ${OBJECTDIR}/_ext/222049284/sdp.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/222049284/sdp.o.d"        -g -omf=elf -mlarge-code -mlarge-data -O1 -I"../btstack/include" -I"../btstack" -I"../include" -I"../USB" -I"../common" -I".." -I"../btstack/include/btstack" -I"../Include" -I"../Include/USB" -I"../btstack/src" -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/_ext/222049284/sdp.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/222049284/sdp_util.o: ../btstack/src/sdp_util.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/222049284 
	@${RM} ${OBJECTDIR}/_ext/222049284/sdp_util.o.d 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../btstack/src/sdp_util.c  -o ${OBJECTDIR}/_ext/222049284/sdp_util.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/222049284/sdp_util.o.d"        -g -omf=elf -mlarge-code -mlarge-data -O1 -I"../btstack/include" -I"../btstack" -I"../include" -I"../USB" -I"../common" -I".." -I"../btstack/include/btstack" -I"../Include" -I"../Include/USB" -I"../btstack/src" -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/_ext/222049284/sdp_util.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/222049284/utils.o: ../btstack/src/utils.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/222049284 
	@${RM} ${OBJECTDIR}/_ext/222049284/utils.o.d 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../btstack/src/utils.c  -o ${OBJECTDIR}/_ext/222049284/utils.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/222049284/utils.o.d"        -g -omf=elf -mlarge-code -mlarge-data -O1 -I"../btstack/include" -I"../btstack" -I"../include" -I"../USB" -I"../common" -I".." -I"../btstack/include/btstack" -I"../Include" -I"../Include/USB" -I"../btstack/src" -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/_ext/222049284/utils.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/222049284/hci_transport_pic24usb.o: ../btstack/src/hci_transport_pic24usb.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/222049284 
	@${RM} ${OBJECTDIR}/_ext/222049284/hci_transport_pic24usb.o.d 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../btstack/src/hci_transport_pic24usb.c  -o ${OBJECTDIR}/_ext/222049284/hci_transport_pic24usb.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/222049284/hci_transport_pic24usb.o.d"        -g -omf=elf -mlarge-code -mlarge-data -O1 -I"../btstack/include" -I"../btstack" -I"../include" -I"../USB" -I"../common" -I".." -I"../btstack/include/btstack" -I"../Include" -I"../Include/USB" -I"../btstack/src" -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/_ext/222049284/hci_transport_pic24usb.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/2108356922/uart2.o: ../Common/uart2.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/2108356922 
	@${RM} ${OBJECTDIR}/_ext/2108356922/uart2.o.d 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../Common/uart2.c  -o ${OBJECTDIR}/_ext/2108356922/uart2.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/2108356922/uart2.o.d"        -g -omf=elf -mlarge-code -mlarge-data -O1 -I"../btstack/include" -I"../btstack" -I"../include" -I"../USB" -I"../common" -I".." -I"../btstack/include/btstack" -I"../Include" -I"../Include/USB" -I"../btstack/src" -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/_ext/2108356922/uart2.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1360907413/usb_host.o: ../USB/usb_host.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1360907413 
	@${RM} ${OBJECTDIR}/_ext/1360907413/usb_host.o.d 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../USB/usb_host.c  -o ${OBJECTDIR}/_ext/1360907413/usb_host.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1360907413/usb_host.o.d"        -g -omf=elf -mlarge-code -mlarge-data -O1 -I"../btstack/include" -I"../btstack" -I"../include" -I"../USB" -I"../common" -I".." -I"../btstack/include/btstack" -I"../Include" -I"../Include/USB" -I"../btstack/src" -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/_ext/1360907413/usb_host.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1360907413/usb_hal_pic24.o: ../USB/usb_hal_pic24.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1360907413 
	@${RM} ${OBJECTDIR}/_ext/1360907413/usb_hal_pic24.o.d 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../USB/usb_hal_pic24.c  -o ${OBJECTDIR}/_ext/1360907413/usb_hal_pic24.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1360907413/usb_hal_pic24.o.d"        -g -omf=elf -mlarge-code -mlarge-data -O1 -I"../btstack/include" -I"../btstack" -I"../include" -I"../USB" -I"../common" -I".." -I"../btstack/include/btstack" -I"../Include" -I"../Include/USB" -I"../btstack/src" -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/_ext/1360907413/usb_hal_pic24.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1472/main.o: ../main.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1472 
	@${RM} ${OBJECTDIR}/_ext/1472/main.o.d 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../main.c  -o ${OBJECTDIR}/_ext/1472/main.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1472/main.o.d"        -g -omf=elf -mlarge-code -mlarge-data -O1 -I"../btstack/include" -I"../btstack" -I"../include" -I"../USB" -I"../common" -I".." -I"../btstack/include/btstack" -I"../Include" -I"../Include/USB" -I"../btstack/src" -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/_ext/1472/main.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1472/Delay.o: ../Delay.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1472 
	@${RM} ${OBJECTDIR}/_ext/1472/Delay.o.d 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../Delay.c  -o ${OBJECTDIR}/_ext/1472/Delay.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1472/Delay.o.d"        -g -omf=elf -mlarge-code -mlarge-data -O1 -I"../btstack/include" -I"../btstack" -I"../include" -I"../USB" -I"../common" -I".." -I"../btstack/include/btstack" -I"../Include" -I"../Include/USB" -I"../btstack/src" -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/_ext/1472/Delay.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1472/usb_config.o: ../usb_config.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1472 
	@${RM} ${OBJECTDIR}/_ext/1472/usb_config.o.d 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../usb_config.c  -o ${OBJECTDIR}/_ext/1472/usb_config.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1472/usb_config.o.d"        -g -omf=elf -mlarge-code -mlarge-data -O1 -I"../btstack/include" -I"../btstack" -I"../include" -I"../USB" -I"../common" -I".." -I"../btstack/include/btstack" -I"../Include" -I"../Include/USB" -I"../btstack/src" -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/_ext/1472/usb_config.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/222060373/bt_pic24_hal.o: ../btstack/hal/bt_pic24_hal.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/222060373 
	@${RM} ${OBJECTDIR}/_ext/222060373/bt_pic24_hal.o.d 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../btstack/hal/bt_pic24_hal.c  -o ${OBJECTDIR}/_ext/222060373/bt_pic24_hal.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/222060373/bt_pic24_hal.o.d"        -g -omf=elf -mlarge-code -mlarge-data -O1 -I"../btstack/include" -I"../btstack" -I"../include" -I"../USB" -I"../common" -I".." -I"../btstack/include/btstack" -I"../Include" -I"../Include/USB" -I"../btstack/src" -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/_ext/222060373/bt_pic24_hal.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1472/usb_bt_driver.o: ../usb_bt_driver.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1472 
	@${RM} ${OBJECTDIR}/_ext/1472/usb_bt_driver.o.d 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../usb_bt_driver.c  -o ${OBJECTDIR}/_ext/1472/usb_bt_driver.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1472/usb_bt_driver.o.d"        -g -omf=elf -mlarge-code -mlarge-data -O1 -I"../btstack/include" -I"../btstack" -I"../include" -I"../USB" -I"../common" -I".." -I"../btstack/include/btstack" -I"../Include" -I"../Include/USB" -I"../btstack/src" -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/_ext/1472/usb_bt_driver.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1472/bt_spp.o: ../bt_spp.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1472 
	@${RM} ${OBJECTDIR}/_ext/1472/bt_spp.o.d 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../bt_spp.c  -o ${OBJECTDIR}/_ext/1472/bt_spp.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1472/bt_spp.o.d"        -g -omf=elf -mlarge-code -mlarge-data -O1 -I"../btstack/include" -I"../btstack" -I"../include" -I"../USB" -I"../common" -I".." -I"../btstack/include/btstack" -I"../Include" -I"../Include/USB" -I"../btstack/src" -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/_ext/1472/bt_spp.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: assemble
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: assemblePreproc
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: link
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
dist/${CND_CONF}/${IMAGE_TYPE}/BT_IO.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk    
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_CC} $(MP_EXTRA_LD_PRE)  -o dist/${CND_CONF}/${IMAGE_TYPE}/BT_IO.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}  ${OBJECTFILES_QUOTED_IF_SPACED}      -mcpu=$(MP_PROCESSOR_OPTION)        -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -omf=elf -Wl,--defsym=__MPLAB_BUILD=1,--defsym=__ICD2RAM=1,--defsym=__MPLAB_DEBUG=1,--defsym=__DEBUG=1,--defsym=__MPLAB_DEBUGGER_PK3=1,$(MP_LINKER_FILE_OPTION),--heap=3000,--stack=16,--check-sections,--data-init,--pack-data,--handles,--isr,--no-gc-sections,--fill-upper=0,--stackguard=16,--library-path="..",--no-force-link,--smart-io,-Map="${DISTDIR}/BT_IO.X.${IMAGE_TYPE}.map",--report-mem$(MP_EXTRA_LD_POST) 
	
else
dist/${CND_CONF}/${IMAGE_TYPE}/BT_IO.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk   
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_CC} $(MP_EXTRA_LD_PRE)  -o dist/${CND_CONF}/${IMAGE_TYPE}/BT_IO.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX}  ${OBJECTFILES_QUOTED_IF_SPACED}      -mcpu=$(MP_PROCESSOR_OPTION)        -omf=elf -Wl,--defsym=__MPLAB_BUILD=1,$(MP_LINKER_FILE_OPTION),--heap=3000,--stack=16,--check-sections,--data-init,--pack-data,--handles,--isr,--no-gc-sections,--fill-upper=0,--stackguard=16,--library-path="..",--no-force-link,--smart-io,-Map="${DISTDIR}/BT_IO.X.${IMAGE_TYPE}.map",--report-mem$(MP_EXTRA_LD_POST) 
	${MP_CC_DIR}\\xc16-bin2hex dist/${CND_CONF}/${IMAGE_TYPE}/BT_IO.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX} -a  -omf=elf 
	
endif


# Subprojects
.build-subprojects:


# Subprojects
.clean-subprojects:

# Clean Targets
.clean-conf: ${CLEAN_SUBPROJECTS}
	${RM} -r build/default
	${RM} -r dist/default

# Enable dependency checking
.dep.inc: .depcheck-impl

DEPFILES=$(shell mplabwildcard ${POSSIBLE_DEPFILES})
ifneq (${DEPFILES},)
include ${DEPFILES}
endif
