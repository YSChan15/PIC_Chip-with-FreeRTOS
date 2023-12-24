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
FINAL_IMAGE=${DISTDIR}/rtos_template.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
else
IMAGE_TYPE=production
OUTPUT_SUFFIX=hex
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=${DISTDIR}/rtos_template.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
endif

ifeq ($(COMPARE_BUILD), true)
COMPARISON_BUILD=-mafrlcsj
else
COMPARISON_BUILD=
endif

# Object Directory
OBJECTDIR=build/${CND_CONF}/${IMAGE_TYPE}

# Distribution Directory
DISTDIR=dist/${CND_CONF}/${IMAGE_TYPE}

# Source Files Quoted if spaced
SOURCEFILES_QUOTED_IF_SPACED=src/app/taskSerial.c src/app/taskDAC.c src/MCP4901.c src/taskButton.c src/taskADC.c FreeRTOS/Source/croutine.c FreeRTOS/Source/event_groups.c FreeRTOS/Source/list.c FreeRTOS/Source/queue.c FreeRTOS/Source/stream_buffer.c FreeRTOS/Source/tasks.c FreeRTOS/Source/timers.c FreeRTOS/Source/portable/GCC/MemMang/heap_4.c FreeRTOS/Source/portable/MPLAB/PIC24_dsPIC/port.c FreeRTOS/Source/portable/MPLAB/PIC24_dsPIC/portasm_PIC24.S FreeRTOS/Source/portable/MPLAB/PIC24_dsPIC/portasm_dsPIC.S mcc_generated_files/system.c mcc_generated_files/traps.c mcc_generated_files/mcc.c mcc_generated_files/interrupt_manager.c mcc_generated_files/pin_manager.c mcc_generated_files/clock.c mcc_generated_files/delay.c mcc_generated_files/uart1.c mcc_generated_files/adc1.c mcc_generated_files/oc2.c mcc_generated_files/oc1.c mcc_generated_files/oc3.c mcc_generated_files/tmr2.c src/main.c src/rtos_hooks.c src/rgb_led.c

# Object Files Quoted if spaced
OBJECTFILES_QUOTED_IF_SPACED=${OBJECTDIR}/src/app/taskSerial.o ${OBJECTDIR}/src/app/taskDAC.o ${OBJECTDIR}/src/MCP4901.o ${OBJECTDIR}/src/taskButton.o ${OBJECTDIR}/src/taskADC.o ${OBJECTDIR}/FreeRTOS/Source/croutine.o ${OBJECTDIR}/FreeRTOS/Source/event_groups.o ${OBJECTDIR}/FreeRTOS/Source/list.o ${OBJECTDIR}/FreeRTOS/Source/queue.o ${OBJECTDIR}/FreeRTOS/Source/stream_buffer.o ${OBJECTDIR}/FreeRTOS/Source/tasks.o ${OBJECTDIR}/FreeRTOS/Source/timers.o ${OBJECTDIR}/FreeRTOS/Source/portable/GCC/MemMang/heap_4.o ${OBJECTDIR}/FreeRTOS/Source/portable/MPLAB/PIC24_dsPIC/port.o ${OBJECTDIR}/FreeRTOS/Source/portable/MPLAB/PIC24_dsPIC/portasm_PIC24.o ${OBJECTDIR}/FreeRTOS/Source/portable/MPLAB/PIC24_dsPIC/portasm_dsPIC.o ${OBJECTDIR}/mcc_generated_files/system.o ${OBJECTDIR}/mcc_generated_files/traps.o ${OBJECTDIR}/mcc_generated_files/mcc.o ${OBJECTDIR}/mcc_generated_files/interrupt_manager.o ${OBJECTDIR}/mcc_generated_files/pin_manager.o ${OBJECTDIR}/mcc_generated_files/clock.o ${OBJECTDIR}/mcc_generated_files/delay.o ${OBJECTDIR}/mcc_generated_files/uart1.o ${OBJECTDIR}/mcc_generated_files/adc1.o ${OBJECTDIR}/mcc_generated_files/oc2.o ${OBJECTDIR}/mcc_generated_files/oc1.o ${OBJECTDIR}/mcc_generated_files/oc3.o ${OBJECTDIR}/mcc_generated_files/tmr2.o ${OBJECTDIR}/src/main.o ${OBJECTDIR}/src/rtos_hooks.o ${OBJECTDIR}/src/rgb_led.o
POSSIBLE_DEPFILES=${OBJECTDIR}/src/app/taskSerial.o.d ${OBJECTDIR}/src/app/taskDAC.o.d ${OBJECTDIR}/src/MCP4901.o.d ${OBJECTDIR}/src/taskButton.o.d ${OBJECTDIR}/src/taskADC.o.d ${OBJECTDIR}/FreeRTOS/Source/croutine.o.d ${OBJECTDIR}/FreeRTOS/Source/event_groups.o.d ${OBJECTDIR}/FreeRTOS/Source/list.o.d ${OBJECTDIR}/FreeRTOS/Source/queue.o.d ${OBJECTDIR}/FreeRTOS/Source/stream_buffer.o.d ${OBJECTDIR}/FreeRTOS/Source/tasks.o.d ${OBJECTDIR}/FreeRTOS/Source/timers.o.d ${OBJECTDIR}/FreeRTOS/Source/portable/GCC/MemMang/heap_4.o.d ${OBJECTDIR}/FreeRTOS/Source/portable/MPLAB/PIC24_dsPIC/port.o.d ${OBJECTDIR}/FreeRTOS/Source/portable/MPLAB/PIC24_dsPIC/portasm_PIC24.o.d ${OBJECTDIR}/FreeRTOS/Source/portable/MPLAB/PIC24_dsPIC/portasm_dsPIC.o.d ${OBJECTDIR}/mcc_generated_files/system.o.d ${OBJECTDIR}/mcc_generated_files/traps.o.d ${OBJECTDIR}/mcc_generated_files/mcc.o.d ${OBJECTDIR}/mcc_generated_files/interrupt_manager.o.d ${OBJECTDIR}/mcc_generated_files/pin_manager.o.d ${OBJECTDIR}/mcc_generated_files/clock.o.d ${OBJECTDIR}/mcc_generated_files/delay.o.d ${OBJECTDIR}/mcc_generated_files/uart1.o.d ${OBJECTDIR}/mcc_generated_files/adc1.o.d ${OBJECTDIR}/mcc_generated_files/oc2.o.d ${OBJECTDIR}/mcc_generated_files/oc1.o.d ${OBJECTDIR}/mcc_generated_files/oc3.o.d ${OBJECTDIR}/mcc_generated_files/tmr2.o.d ${OBJECTDIR}/src/main.o.d ${OBJECTDIR}/src/rtos_hooks.o.d ${OBJECTDIR}/src/rgb_led.o.d

# Object Files
OBJECTFILES=${OBJECTDIR}/src/app/taskSerial.o ${OBJECTDIR}/src/app/taskDAC.o ${OBJECTDIR}/src/MCP4901.o ${OBJECTDIR}/src/taskButton.o ${OBJECTDIR}/src/taskADC.o ${OBJECTDIR}/FreeRTOS/Source/croutine.o ${OBJECTDIR}/FreeRTOS/Source/event_groups.o ${OBJECTDIR}/FreeRTOS/Source/list.o ${OBJECTDIR}/FreeRTOS/Source/queue.o ${OBJECTDIR}/FreeRTOS/Source/stream_buffer.o ${OBJECTDIR}/FreeRTOS/Source/tasks.o ${OBJECTDIR}/FreeRTOS/Source/timers.o ${OBJECTDIR}/FreeRTOS/Source/portable/GCC/MemMang/heap_4.o ${OBJECTDIR}/FreeRTOS/Source/portable/MPLAB/PIC24_dsPIC/port.o ${OBJECTDIR}/FreeRTOS/Source/portable/MPLAB/PIC24_dsPIC/portasm_PIC24.o ${OBJECTDIR}/FreeRTOS/Source/portable/MPLAB/PIC24_dsPIC/portasm_dsPIC.o ${OBJECTDIR}/mcc_generated_files/system.o ${OBJECTDIR}/mcc_generated_files/traps.o ${OBJECTDIR}/mcc_generated_files/mcc.o ${OBJECTDIR}/mcc_generated_files/interrupt_manager.o ${OBJECTDIR}/mcc_generated_files/pin_manager.o ${OBJECTDIR}/mcc_generated_files/clock.o ${OBJECTDIR}/mcc_generated_files/delay.o ${OBJECTDIR}/mcc_generated_files/uart1.o ${OBJECTDIR}/mcc_generated_files/adc1.o ${OBJECTDIR}/mcc_generated_files/oc2.o ${OBJECTDIR}/mcc_generated_files/oc1.o ${OBJECTDIR}/mcc_generated_files/oc3.o ${OBJECTDIR}/mcc_generated_files/tmr2.o ${OBJECTDIR}/src/main.o ${OBJECTDIR}/src/rtos_hooks.o ${OBJECTDIR}/src/rgb_led.o

# Source Files
SOURCEFILES=src/app/taskSerial.c src/app/taskDAC.c src/MCP4901.c src/taskButton.c src/taskADC.c FreeRTOS/Source/croutine.c FreeRTOS/Source/event_groups.c FreeRTOS/Source/list.c FreeRTOS/Source/queue.c FreeRTOS/Source/stream_buffer.c FreeRTOS/Source/tasks.c FreeRTOS/Source/timers.c FreeRTOS/Source/portable/GCC/MemMang/heap_4.c FreeRTOS/Source/portable/MPLAB/PIC24_dsPIC/port.c FreeRTOS/Source/portable/MPLAB/PIC24_dsPIC/portasm_PIC24.S FreeRTOS/Source/portable/MPLAB/PIC24_dsPIC/portasm_dsPIC.S mcc_generated_files/system.c mcc_generated_files/traps.c mcc_generated_files/mcc.c mcc_generated_files/interrupt_manager.c mcc_generated_files/pin_manager.c mcc_generated_files/clock.c mcc_generated_files/delay.c mcc_generated_files/uart1.c mcc_generated_files/adc1.c mcc_generated_files/oc2.c mcc_generated_files/oc1.c mcc_generated_files/oc3.c mcc_generated_files/tmr2.c src/main.c src/rtos_hooks.c src/rgb_led.c



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
ifneq ($(INFORMATION_MESSAGE), )
	@echo $(INFORMATION_MESSAGE)
endif
	${MAKE}  -f nbproject/Makefile-default.mk ${DISTDIR}/rtos_template.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}

MP_PROCESSOR_OPTION=24FJ128GA202
MP_LINKER_FILE_OPTION=,--script=p24FJ128GA202.gld
# ------------------------------------------------------------------------------------
# Rules for buildStep: compile
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${OBJECTDIR}/src/app/taskSerial.o: src/app/taskSerial.c  .generated_files/flags/default/cd0f55e797dd9d9ea482bec78933d73a7a14d588 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/src/app" 
	@${RM} ${OBJECTDIR}/src/app/taskSerial.o.d 
	@${RM} ${OBJECTDIR}/src/app/taskSerial.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  src/app/taskSerial.c  -o ${OBJECTDIR}/src/app/taskSerial.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/src/app/taskSerial.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -mcodecov=near -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"mcc_generated_files" -I"src/config" -I"FreeRTOS/Source/include" -I"FreeRTOS/Source/portable/MPLAB/PIC24_dsPIC" -I"src/app" -mlarge-code -msmall-data -O0 -I"mcc_generated_files" -I"src/config" -I"FreeRTOS/Source/include" -I"FreeRTOS/Source/portable/MPLAB/PIC24_dsPIC" -I"src/app" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/src/app/taskDAC.o: src/app/taskDAC.c  .generated_files/flags/default/807a048a9a7215f43b8d2763104f9dbbeb3fc22 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/src/app" 
	@${RM} ${OBJECTDIR}/src/app/taskDAC.o.d 
	@${RM} ${OBJECTDIR}/src/app/taskDAC.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  src/app/taskDAC.c  -o ${OBJECTDIR}/src/app/taskDAC.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/src/app/taskDAC.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -mcodecov=near -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"mcc_generated_files" -I"src/config" -I"FreeRTOS/Source/include" -I"FreeRTOS/Source/portable/MPLAB/PIC24_dsPIC" -I"src/app" -mlarge-code -msmall-data -O0 -I"mcc_generated_files" -I"src/config" -I"FreeRTOS/Source/include" -I"FreeRTOS/Source/portable/MPLAB/PIC24_dsPIC" -I"src/app" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/src/MCP4901.o: src/MCP4901.c  .generated_files/flags/default/e866d3588d3f13797141e32b5573069b3224f89a .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/src" 
	@${RM} ${OBJECTDIR}/src/MCP4901.o.d 
	@${RM} ${OBJECTDIR}/src/MCP4901.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  src/MCP4901.c  -o ${OBJECTDIR}/src/MCP4901.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/src/MCP4901.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -mcodecov=near -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"mcc_generated_files" -I"src/config" -I"FreeRTOS/Source/include" -I"FreeRTOS/Source/portable/MPLAB/PIC24_dsPIC" -I"src/app" -mlarge-code -msmall-data -O0 -I"mcc_generated_files" -I"src/config" -I"FreeRTOS/Source/include" -I"FreeRTOS/Source/portable/MPLAB/PIC24_dsPIC" -I"src/app" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/src/taskButton.o: src/taskButton.c  .generated_files/flags/default/6cfaf72206d15070613475e57a64c18469f38426 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/src" 
	@${RM} ${OBJECTDIR}/src/taskButton.o.d 
	@${RM} ${OBJECTDIR}/src/taskButton.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  src/taskButton.c  -o ${OBJECTDIR}/src/taskButton.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/src/taskButton.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -mcodecov=near -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"mcc_generated_files" -I"src/config" -I"FreeRTOS/Source/include" -I"FreeRTOS/Source/portable/MPLAB/PIC24_dsPIC" -I"src/app" -mlarge-code -msmall-data -O0 -I"mcc_generated_files" -I"src/config" -I"FreeRTOS/Source/include" -I"FreeRTOS/Source/portable/MPLAB/PIC24_dsPIC" -I"src/app" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/src/taskADC.o: src/taskADC.c  .generated_files/flags/default/c983936d5fa2e09e06b9e92a7721a2d661643986 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/src" 
	@${RM} ${OBJECTDIR}/src/taskADC.o.d 
	@${RM} ${OBJECTDIR}/src/taskADC.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  src/taskADC.c  -o ${OBJECTDIR}/src/taskADC.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/src/taskADC.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -mcodecov=near -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"mcc_generated_files" -I"src/config" -I"FreeRTOS/Source/include" -I"FreeRTOS/Source/portable/MPLAB/PIC24_dsPIC" -I"src/app" -mlarge-code -msmall-data -O0 -I"mcc_generated_files" -I"src/config" -I"FreeRTOS/Source/include" -I"FreeRTOS/Source/portable/MPLAB/PIC24_dsPIC" -I"src/app" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/FreeRTOS/Source/croutine.o: FreeRTOS/Source/croutine.c  .generated_files/flags/default/b24cff6b1b1ced0a48d1ae6b3558dcb8ef1b330f .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/FreeRTOS/Source" 
	@${RM} ${OBJECTDIR}/FreeRTOS/Source/croutine.o.d 
	@${RM} ${OBJECTDIR}/FreeRTOS/Source/croutine.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  FreeRTOS/Source/croutine.c  -o ${OBJECTDIR}/FreeRTOS/Source/croutine.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/FreeRTOS/Source/croutine.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -mcodecov=near -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"mcc_generated_files" -I"src/config" -I"FreeRTOS/Source/include" -I"FreeRTOS/Source/portable/MPLAB/PIC24_dsPIC" -I"src/app" -mlarge-code -msmall-data -O0 -I"mcc_generated_files" -I"src/config" -I"FreeRTOS/Source/include" -I"FreeRTOS/Source/portable/MPLAB/PIC24_dsPIC" -I"src/app" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/FreeRTOS/Source/event_groups.o: FreeRTOS/Source/event_groups.c  .generated_files/flags/default/b247adae5803ba7fa41d9d674b3fd5e2760be05b .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/FreeRTOS/Source" 
	@${RM} ${OBJECTDIR}/FreeRTOS/Source/event_groups.o.d 
	@${RM} ${OBJECTDIR}/FreeRTOS/Source/event_groups.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  FreeRTOS/Source/event_groups.c  -o ${OBJECTDIR}/FreeRTOS/Source/event_groups.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/FreeRTOS/Source/event_groups.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -mcodecov=near -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"mcc_generated_files" -I"src/config" -I"FreeRTOS/Source/include" -I"FreeRTOS/Source/portable/MPLAB/PIC24_dsPIC" -I"src/app" -mlarge-code -msmall-data -O0 -I"mcc_generated_files" -I"src/config" -I"FreeRTOS/Source/include" -I"FreeRTOS/Source/portable/MPLAB/PIC24_dsPIC" -I"src/app" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/FreeRTOS/Source/list.o: FreeRTOS/Source/list.c  .generated_files/flags/default/72e2b43fe3e85db9d93c858e8d12e7e754dad855 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/FreeRTOS/Source" 
	@${RM} ${OBJECTDIR}/FreeRTOS/Source/list.o.d 
	@${RM} ${OBJECTDIR}/FreeRTOS/Source/list.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  FreeRTOS/Source/list.c  -o ${OBJECTDIR}/FreeRTOS/Source/list.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/FreeRTOS/Source/list.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -mcodecov=near -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"mcc_generated_files" -I"src/config" -I"FreeRTOS/Source/include" -I"FreeRTOS/Source/portable/MPLAB/PIC24_dsPIC" -I"src/app" -mlarge-code -msmall-data -O0 -I"mcc_generated_files" -I"src/config" -I"FreeRTOS/Source/include" -I"FreeRTOS/Source/portable/MPLAB/PIC24_dsPIC" -I"src/app" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/FreeRTOS/Source/queue.o: FreeRTOS/Source/queue.c  .generated_files/flags/default/68bdffdb7e43416708d2c57f95adb053d8609837 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/FreeRTOS/Source" 
	@${RM} ${OBJECTDIR}/FreeRTOS/Source/queue.o.d 
	@${RM} ${OBJECTDIR}/FreeRTOS/Source/queue.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  FreeRTOS/Source/queue.c  -o ${OBJECTDIR}/FreeRTOS/Source/queue.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/FreeRTOS/Source/queue.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -mcodecov=near -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"mcc_generated_files" -I"src/config" -I"FreeRTOS/Source/include" -I"FreeRTOS/Source/portable/MPLAB/PIC24_dsPIC" -I"src/app" -mlarge-code -msmall-data -O0 -I"mcc_generated_files" -I"src/config" -I"FreeRTOS/Source/include" -I"FreeRTOS/Source/portable/MPLAB/PIC24_dsPIC" -I"src/app" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/FreeRTOS/Source/stream_buffer.o: FreeRTOS/Source/stream_buffer.c  .generated_files/flags/default/b26ffd57227d92c72eecf1c238ed694da72871b2 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/FreeRTOS/Source" 
	@${RM} ${OBJECTDIR}/FreeRTOS/Source/stream_buffer.o.d 
	@${RM} ${OBJECTDIR}/FreeRTOS/Source/stream_buffer.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  FreeRTOS/Source/stream_buffer.c  -o ${OBJECTDIR}/FreeRTOS/Source/stream_buffer.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/FreeRTOS/Source/stream_buffer.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -mcodecov=near -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"mcc_generated_files" -I"src/config" -I"FreeRTOS/Source/include" -I"FreeRTOS/Source/portable/MPLAB/PIC24_dsPIC" -I"src/app" -mlarge-code -msmall-data -O0 -I"mcc_generated_files" -I"src/config" -I"FreeRTOS/Source/include" -I"FreeRTOS/Source/portable/MPLAB/PIC24_dsPIC" -I"src/app" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/FreeRTOS/Source/tasks.o: FreeRTOS/Source/tasks.c  .generated_files/flags/default/ee2c1b4b8c11299b882110f343571afdc91041d8 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/FreeRTOS/Source" 
	@${RM} ${OBJECTDIR}/FreeRTOS/Source/tasks.o.d 
	@${RM} ${OBJECTDIR}/FreeRTOS/Source/tasks.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  FreeRTOS/Source/tasks.c  -o ${OBJECTDIR}/FreeRTOS/Source/tasks.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/FreeRTOS/Source/tasks.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -mcodecov=near -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"mcc_generated_files" -I"src/config" -I"FreeRTOS/Source/include" -I"FreeRTOS/Source/portable/MPLAB/PIC24_dsPIC" -I"src/app" -mlarge-code -msmall-data -O0 -I"mcc_generated_files" -I"src/config" -I"FreeRTOS/Source/include" -I"FreeRTOS/Source/portable/MPLAB/PIC24_dsPIC" -I"src/app" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/FreeRTOS/Source/timers.o: FreeRTOS/Source/timers.c  .generated_files/flags/default/903d4f15fa53f2231120db5c1658e677225b2c85 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/FreeRTOS/Source" 
	@${RM} ${OBJECTDIR}/FreeRTOS/Source/timers.o.d 
	@${RM} ${OBJECTDIR}/FreeRTOS/Source/timers.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  FreeRTOS/Source/timers.c  -o ${OBJECTDIR}/FreeRTOS/Source/timers.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/FreeRTOS/Source/timers.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -mcodecov=near -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"mcc_generated_files" -I"src/config" -I"FreeRTOS/Source/include" -I"FreeRTOS/Source/portable/MPLAB/PIC24_dsPIC" -I"src/app" -mlarge-code -msmall-data -O0 -I"mcc_generated_files" -I"src/config" -I"FreeRTOS/Source/include" -I"FreeRTOS/Source/portable/MPLAB/PIC24_dsPIC" -I"src/app" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/FreeRTOS/Source/portable/GCC/MemMang/heap_4.o: FreeRTOS/Source/portable/GCC/MemMang/heap_4.c  .generated_files/flags/default/da6d4f2b7db11feada9bce197564bb05dc9d8df1 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/FreeRTOS/Source/portable/GCC/MemMang" 
	@${RM} ${OBJECTDIR}/FreeRTOS/Source/portable/GCC/MemMang/heap_4.o.d 
	@${RM} ${OBJECTDIR}/FreeRTOS/Source/portable/GCC/MemMang/heap_4.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  FreeRTOS/Source/portable/GCC/MemMang/heap_4.c  -o ${OBJECTDIR}/FreeRTOS/Source/portable/GCC/MemMang/heap_4.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/FreeRTOS/Source/portable/GCC/MemMang/heap_4.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -mcodecov=near -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"mcc_generated_files" -I"src/config" -I"FreeRTOS/Source/include" -I"FreeRTOS/Source/portable/MPLAB/PIC24_dsPIC" -I"src/app" -mlarge-code -msmall-data -O0 -I"mcc_generated_files" -I"src/config" -I"FreeRTOS/Source/include" -I"FreeRTOS/Source/portable/MPLAB/PIC24_dsPIC" -I"src/app" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/FreeRTOS/Source/portable/MPLAB/PIC24_dsPIC/port.o: FreeRTOS/Source/portable/MPLAB/PIC24_dsPIC/port.c  .generated_files/flags/default/164cad5fdf2ba1208f70a90a172e8f734e7e0c72 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/FreeRTOS/Source/portable/MPLAB/PIC24_dsPIC" 
	@${RM} ${OBJECTDIR}/FreeRTOS/Source/portable/MPLAB/PIC24_dsPIC/port.o.d 
	@${RM} ${OBJECTDIR}/FreeRTOS/Source/portable/MPLAB/PIC24_dsPIC/port.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  FreeRTOS/Source/portable/MPLAB/PIC24_dsPIC/port.c  -o ${OBJECTDIR}/FreeRTOS/Source/portable/MPLAB/PIC24_dsPIC/port.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/FreeRTOS/Source/portable/MPLAB/PIC24_dsPIC/port.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -mcodecov=near -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"mcc_generated_files" -I"src/config" -I"FreeRTOS/Source/include" -I"FreeRTOS/Source/portable/MPLAB/PIC24_dsPIC" -I"src/app" -mlarge-code -msmall-data -O0 -I"mcc_generated_files" -I"src/config" -I"FreeRTOS/Source/include" -I"FreeRTOS/Source/portable/MPLAB/PIC24_dsPIC" -I"src/app" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/system.o: mcc_generated_files/system.c  .generated_files/flags/default/bfb775991f38ed30afdf3263be16ff26930bc9c .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/system.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/system.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/system.c  -o ${OBJECTDIR}/mcc_generated_files/system.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/system.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -mcodecov=near -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"mcc_generated_files" -I"src/config" -I"FreeRTOS/Source/include" -I"FreeRTOS/Source/portable/MPLAB/PIC24_dsPIC" -I"src/app" -mlarge-code -msmall-data -O0 -I"mcc_generated_files" -I"src/config" -I"FreeRTOS/Source/include" -I"FreeRTOS/Source/portable/MPLAB/PIC24_dsPIC" -I"src/app" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/traps.o: mcc_generated_files/traps.c  .generated_files/flags/default/52616144ab98cb7daa390981ff2c46eed476b9db .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/traps.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/traps.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/traps.c  -o ${OBJECTDIR}/mcc_generated_files/traps.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/traps.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -mcodecov=near -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"mcc_generated_files" -I"src/config" -I"FreeRTOS/Source/include" -I"FreeRTOS/Source/portable/MPLAB/PIC24_dsPIC" -I"src/app" -mlarge-code -msmall-data -O0 -I"mcc_generated_files" -I"src/config" -I"FreeRTOS/Source/include" -I"FreeRTOS/Source/portable/MPLAB/PIC24_dsPIC" -I"src/app" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/mcc.o: mcc_generated_files/mcc.c  .generated_files/flags/default/513830f1d6f253b9149a6c1cd1d0bfc3a32e6ec4 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/mcc.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/mcc.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/mcc.c  -o ${OBJECTDIR}/mcc_generated_files/mcc.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/mcc.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -mcodecov=near -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"mcc_generated_files" -I"src/config" -I"FreeRTOS/Source/include" -I"FreeRTOS/Source/portable/MPLAB/PIC24_dsPIC" -I"src/app" -mlarge-code -msmall-data -O0 -I"mcc_generated_files" -I"src/config" -I"FreeRTOS/Source/include" -I"FreeRTOS/Source/portable/MPLAB/PIC24_dsPIC" -I"src/app" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/interrupt_manager.o: mcc_generated_files/interrupt_manager.c  .generated_files/flags/default/2fa3d7339a9a7e6a323fe24ae283c49551221c42 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/interrupt_manager.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/interrupt_manager.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/interrupt_manager.c  -o ${OBJECTDIR}/mcc_generated_files/interrupt_manager.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/interrupt_manager.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -mcodecov=near -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"mcc_generated_files" -I"src/config" -I"FreeRTOS/Source/include" -I"FreeRTOS/Source/portable/MPLAB/PIC24_dsPIC" -I"src/app" -mlarge-code -msmall-data -O0 -I"mcc_generated_files" -I"src/config" -I"FreeRTOS/Source/include" -I"FreeRTOS/Source/portable/MPLAB/PIC24_dsPIC" -I"src/app" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/pin_manager.o: mcc_generated_files/pin_manager.c  .generated_files/flags/default/7e211c7b0ce1eaea6267429f1e8673a70ebaadfa .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/pin_manager.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/pin_manager.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/pin_manager.c  -o ${OBJECTDIR}/mcc_generated_files/pin_manager.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/pin_manager.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -mcodecov=near -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"mcc_generated_files" -I"src/config" -I"FreeRTOS/Source/include" -I"FreeRTOS/Source/portable/MPLAB/PIC24_dsPIC" -I"src/app" -mlarge-code -msmall-data -O0 -I"mcc_generated_files" -I"src/config" -I"FreeRTOS/Source/include" -I"FreeRTOS/Source/portable/MPLAB/PIC24_dsPIC" -I"src/app" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/clock.o: mcc_generated_files/clock.c  .generated_files/flags/default/5f9837d39f609df8d6e00bf736ea21ab20402c94 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/clock.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/clock.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/clock.c  -o ${OBJECTDIR}/mcc_generated_files/clock.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/clock.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -mcodecov=near -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"mcc_generated_files" -I"src/config" -I"FreeRTOS/Source/include" -I"FreeRTOS/Source/portable/MPLAB/PIC24_dsPIC" -I"src/app" -mlarge-code -msmall-data -O0 -I"mcc_generated_files" -I"src/config" -I"FreeRTOS/Source/include" -I"FreeRTOS/Source/portable/MPLAB/PIC24_dsPIC" -I"src/app" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/delay.o: mcc_generated_files/delay.c  .generated_files/flags/default/8df7fc58b8aeb60d9aa8566bf8d98bdb1e6a4059 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/delay.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/delay.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/delay.c  -o ${OBJECTDIR}/mcc_generated_files/delay.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/delay.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -mcodecov=near -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"mcc_generated_files" -I"src/config" -I"FreeRTOS/Source/include" -I"FreeRTOS/Source/portable/MPLAB/PIC24_dsPIC" -I"src/app" -mlarge-code -msmall-data -O0 -I"mcc_generated_files" -I"src/config" -I"FreeRTOS/Source/include" -I"FreeRTOS/Source/portable/MPLAB/PIC24_dsPIC" -I"src/app" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/uart1.o: mcc_generated_files/uart1.c  .generated_files/flags/default/93f39d43b6a10d1c463856bac4a7bbfe6c0db4d6 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/uart1.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/uart1.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/uart1.c  -o ${OBJECTDIR}/mcc_generated_files/uart1.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/uart1.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -mcodecov=near -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"mcc_generated_files" -I"src/config" -I"FreeRTOS/Source/include" -I"FreeRTOS/Source/portable/MPLAB/PIC24_dsPIC" -I"src/app" -mlarge-code -msmall-data -O0 -I"mcc_generated_files" -I"src/config" -I"FreeRTOS/Source/include" -I"FreeRTOS/Source/portable/MPLAB/PIC24_dsPIC" -I"src/app" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/adc1.o: mcc_generated_files/adc1.c  .generated_files/flags/default/26e17982250f87187473af6ccf5f7a49ba306ce2 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/adc1.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/adc1.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/adc1.c  -o ${OBJECTDIR}/mcc_generated_files/adc1.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/adc1.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -mcodecov=near -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"mcc_generated_files" -I"src/config" -I"FreeRTOS/Source/include" -I"FreeRTOS/Source/portable/MPLAB/PIC24_dsPIC" -I"src/app" -mlarge-code -msmall-data -O0 -I"mcc_generated_files" -I"src/config" -I"FreeRTOS/Source/include" -I"FreeRTOS/Source/portable/MPLAB/PIC24_dsPIC" -I"src/app" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/oc2.o: mcc_generated_files/oc2.c  .generated_files/flags/default/66ef5edc98477e37e4201ee414dd08d52504c7f3 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/oc2.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/oc2.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/oc2.c  -o ${OBJECTDIR}/mcc_generated_files/oc2.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/oc2.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -mcodecov=near -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"mcc_generated_files" -I"src/config" -I"FreeRTOS/Source/include" -I"FreeRTOS/Source/portable/MPLAB/PIC24_dsPIC" -I"src/app" -mlarge-code -msmall-data -O0 -I"mcc_generated_files" -I"src/config" -I"FreeRTOS/Source/include" -I"FreeRTOS/Source/portable/MPLAB/PIC24_dsPIC" -I"src/app" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/oc1.o: mcc_generated_files/oc1.c  .generated_files/flags/default/99e307487d5259244e3701142371197eaaf5377e .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/oc1.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/oc1.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/oc1.c  -o ${OBJECTDIR}/mcc_generated_files/oc1.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/oc1.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -mcodecov=near -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"mcc_generated_files" -I"src/config" -I"FreeRTOS/Source/include" -I"FreeRTOS/Source/portable/MPLAB/PIC24_dsPIC" -I"src/app" -mlarge-code -msmall-data -O0 -I"mcc_generated_files" -I"src/config" -I"FreeRTOS/Source/include" -I"FreeRTOS/Source/portable/MPLAB/PIC24_dsPIC" -I"src/app" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/oc3.o: mcc_generated_files/oc3.c  .generated_files/flags/default/a4d7b577b1f30e5d4dcf6154e9630274d84901df .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/oc3.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/oc3.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/oc3.c  -o ${OBJECTDIR}/mcc_generated_files/oc3.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/oc3.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -mcodecov=near -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"mcc_generated_files" -I"src/config" -I"FreeRTOS/Source/include" -I"FreeRTOS/Source/portable/MPLAB/PIC24_dsPIC" -I"src/app" -mlarge-code -msmall-data -O0 -I"mcc_generated_files" -I"src/config" -I"FreeRTOS/Source/include" -I"FreeRTOS/Source/portable/MPLAB/PIC24_dsPIC" -I"src/app" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/tmr2.o: mcc_generated_files/tmr2.c  .generated_files/flags/default/bf4312301f19be74b25a0d5af0665d366ca69a9b .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/tmr2.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/tmr2.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/tmr2.c  -o ${OBJECTDIR}/mcc_generated_files/tmr2.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/tmr2.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -mcodecov=near -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"mcc_generated_files" -I"src/config" -I"FreeRTOS/Source/include" -I"FreeRTOS/Source/portable/MPLAB/PIC24_dsPIC" -I"src/app" -mlarge-code -msmall-data -O0 -I"mcc_generated_files" -I"src/config" -I"FreeRTOS/Source/include" -I"FreeRTOS/Source/portable/MPLAB/PIC24_dsPIC" -I"src/app" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/src/main.o: src/main.c  .generated_files/flags/default/cb09f359160c95ad685067268cbcbedbffedcb69 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/src" 
	@${RM} ${OBJECTDIR}/src/main.o.d 
	@${RM} ${OBJECTDIR}/src/main.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  src/main.c  -o ${OBJECTDIR}/src/main.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/src/main.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -mcodecov=near -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"mcc_generated_files" -I"src/config" -I"FreeRTOS/Source/include" -I"FreeRTOS/Source/portable/MPLAB/PIC24_dsPIC" -I"src/app" -mlarge-code -msmall-data -O0 -I"mcc_generated_files" -I"src/config" -I"FreeRTOS/Source/include" -I"FreeRTOS/Source/portable/MPLAB/PIC24_dsPIC" -I"src/app" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/src/rtos_hooks.o: src/rtos_hooks.c  .generated_files/flags/default/9303e48427a4d734a0299a791863d00eb34617ed .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/src" 
	@${RM} ${OBJECTDIR}/src/rtos_hooks.o.d 
	@${RM} ${OBJECTDIR}/src/rtos_hooks.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  src/rtos_hooks.c  -o ${OBJECTDIR}/src/rtos_hooks.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/src/rtos_hooks.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -mcodecov=near -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"mcc_generated_files" -I"src/config" -I"FreeRTOS/Source/include" -I"FreeRTOS/Source/portable/MPLAB/PIC24_dsPIC" -I"src/app" -mlarge-code -msmall-data -O0 -I"mcc_generated_files" -I"src/config" -I"FreeRTOS/Source/include" -I"FreeRTOS/Source/portable/MPLAB/PIC24_dsPIC" -I"src/app" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/src/rgb_led.o: src/rgb_led.c  .generated_files/flags/default/e92559bcf06f4f02644ba0b465e91db7e5c119e2 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/src" 
	@${RM} ${OBJECTDIR}/src/rgb_led.o.d 
	@${RM} ${OBJECTDIR}/src/rgb_led.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  src/rgb_led.c  -o ${OBJECTDIR}/src/rgb_led.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/src/rgb_led.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -mcodecov=near -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"mcc_generated_files" -I"src/config" -I"FreeRTOS/Source/include" -I"FreeRTOS/Source/portable/MPLAB/PIC24_dsPIC" -I"src/app" -mlarge-code -msmall-data -O0 -I"mcc_generated_files" -I"src/config" -I"FreeRTOS/Source/include" -I"FreeRTOS/Source/portable/MPLAB/PIC24_dsPIC" -I"src/app" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
else
${OBJECTDIR}/src/app/taskSerial.o: src/app/taskSerial.c  .generated_files/flags/default/77e1fa19f24704591a9b9fe93ac26c314308fba6 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/src/app" 
	@${RM} ${OBJECTDIR}/src/app/taskSerial.o.d 
	@${RM} ${OBJECTDIR}/src/app/taskSerial.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  src/app/taskSerial.c  -o ${OBJECTDIR}/src/app/taskSerial.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/src/app/taskSerial.o.d"      -mno-eds-warn  -g -omf=elf -mcodecov=near -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"mcc_generated_files" -I"src/config" -I"FreeRTOS/Source/include" -I"FreeRTOS/Source/portable/MPLAB/PIC24_dsPIC" -I"src/app" -mlarge-code -msmall-data -O0 -I"mcc_generated_files" -I"src/config" -I"FreeRTOS/Source/include" -I"FreeRTOS/Source/portable/MPLAB/PIC24_dsPIC" -I"src/app" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/src/app/taskDAC.o: src/app/taskDAC.c  .generated_files/flags/default/d9cd3b53ec143698746b840883bafcba9feb7d5a .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/src/app" 
	@${RM} ${OBJECTDIR}/src/app/taskDAC.o.d 
	@${RM} ${OBJECTDIR}/src/app/taskDAC.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  src/app/taskDAC.c  -o ${OBJECTDIR}/src/app/taskDAC.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/src/app/taskDAC.o.d"      -mno-eds-warn  -g -omf=elf -mcodecov=near -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"mcc_generated_files" -I"src/config" -I"FreeRTOS/Source/include" -I"FreeRTOS/Source/portable/MPLAB/PIC24_dsPIC" -I"src/app" -mlarge-code -msmall-data -O0 -I"mcc_generated_files" -I"src/config" -I"FreeRTOS/Source/include" -I"FreeRTOS/Source/portable/MPLAB/PIC24_dsPIC" -I"src/app" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/src/MCP4901.o: src/MCP4901.c  .generated_files/flags/default/3a4f045da673fd66fbb38c43221839fd060006fb .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/src" 
	@${RM} ${OBJECTDIR}/src/MCP4901.o.d 
	@${RM} ${OBJECTDIR}/src/MCP4901.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  src/MCP4901.c  -o ${OBJECTDIR}/src/MCP4901.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/src/MCP4901.o.d"      -mno-eds-warn  -g -omf=elf -mcodecov=near -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"mcc_generated_files" -I"src/config" -I"FreeRTOS/Source/include" -I"FreeRTOS/Source/portable/MPLAB/PIC24_dsPIC" -I"src/app" -mlarge-code -msmall-data -O0 -I"mcc_generated_files" -I"src/config" -I"FreeRTOS/Source/include" -I"FreeRTOS/Source/portable/MPLAB/PIC24_dsPIC" -I"src/app" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/src/taskButton.o: src/taskButton.c  .generated_files/flags/default/aac9628a3fe5bc9e79740f753d055823b2471bed .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/src" 
	@${RM} ${OBJECTDIR}/src/taskButton.o.d 
	@${RM} ${OBJECTDIR}/src/taskButton.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  src/taskButton.c  -o ${OBJECTDIR}/src/taskButton.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/src/taskButton.o.d"      -mno-eds-warn  -g -omf=elf -mcodecov=near -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"mcc_generated_files" -I"src/config" -I"FreeRTOS/Source/include" -I"FreeRTOS/Source/portable/MPLAB/PIC24_dsPIC" -I"src/app" -mlarge-code -msmall-data -O0 -I"mcc_generated_files" -I"src/config" -I"FreeRTOS/Source/include" -I"FreeRTOS/Source/portable/MPLAB/PIC24_dsPIC" -I"src/app" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/src/taskADC.o: src/taskADC.c  .generated_files/flags/default/e84fc6bf607052794d6a679f9088cd77d75a2bc5 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/src" 
	@${RM} ${OBJECTDIR}/src/taskADC.o.d 
	@${RM} ${OBJECTDIR}/src/taskADC.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  src/taskADC.c  -o ${OBJECTDIR}/src/taskADC.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/src/taskADC.o.d"      -mno-eds-warn  -g -omf=elf -mcodecov=near -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"mcc_generated_files" -I"src/config" -I"FreeRTOS/Source/include" -I"FreeRTOS/Source/portable/MPLAB/PIC24_dsPIC" -I"src/app" -mlarge-code -msmall-data -O0 -I"mcc_generated_files" -I"src/config" -I"FreeRTOS/Source/include" -I"FreeRTOS/Source/portable/MPLAB/PIC24_dsPIC" -I"src/app" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/FreeRTOS/Source/croutine.o: FreeRTOS/Source/croutine.c  .generated_files/flags/default/7e0d40d09f1c5c27e47c422356b83b60224dceb4 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/FreeRTOS/Source" 
	@${RM} ${OBJECTDIR}/FreeRTOS/Source/croutine.o.d 
	@${RM} ${OBJECTDIR}/FreeRTOS/Source/croutine.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  FreeRTOS/Source/croutine.c  -o ${OBJECTDIR}/FreeRTOS/Source/croutine.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/FreeRTOS/Source/croutine.o.d"      -mno-eds-warn  -g -omf=elf -mcodecov=near -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"mcc_generated_files" -I"src/config" -I"FreeRTOS/Source/include" -I"FreeRTOS/Source/portable/MPLAB/PIC24_dsPIC" -I"src/app" -mlarge-code -msmall-data -O0 -I"mcc_generated_files" -I"src/config" -I"FreeRTOS/Source/include" -I"FreeRTOS/Source/portable/MPLAB/PIC24_dsPIC" -I"src/app" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/FreeRTOS/Source/event_groups.o: FreeRTOS/Source/event_groups.c  .generated_files/flags/default/2a0407d5836caea842ba6c9730a0a0b580598b2c .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/FreeRTOS/Source" 
	@${RM} ${OBJECTDIR}/FreeRTOS/Source/event_groups.o.d 
	@${RM} ${OBJECTDIR}/FreeRTOS/Source/event_groups.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  FreeRTOS/Source/event_groups.c  -o ${OBJECTDIR}/FreeRTOS/Source/event_groups.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/FreeRTOS/Source/event_groups.o.d"      -mno-eds-warn  -g -omf=elf -mcodecov=near -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"mcc_generated_files" -I"src/config" -I"FreeRTOS/Source/include" -I"FreeRTOS/Source/portable/MPLAB/PIC24_dsPIC" -I"src/app" -mlarge-code -msmall-data -O0 -I"mcc_generated_files" -I"src/config" -I"FreeRTOS/Source/include" -I"FreeRTOS/Source/portable/MPLAB/PIC24_dsPIC" -I"src/app" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/FreeRTOS/Source/list.o: FreeRTOS/Source/list.c  .generated_files/flags/default/9862910b35e0f1a0d94762a7083bed40c32b67f5 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/FreeRTOS/Source" 
	@${RM} ${OBJECTDIR}/FreeRTOS/Source/list.o.d 
	@${RM} ${OBJECTDIR}/FreeRTOS/Source/list.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  FreeRTOS/Source/list.c  -o ${OBJECTDIR}/FreeRTOS/Source/list.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/FreeRTOS/Source/list.o.d"      -mno-eds-warn  -g -omf=elf -mcodecov=near -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"mcc_generated_files" -I"src/config" -I"FreeRTOS/Source/include" -I"FreeRTOS/Source/portable/MPLAB/PIC24_dsPIC" -I"src/app" -mlarge-code -msmall-data -O0 -I"mcc_generated_files" -I"src/config" -I"FreeRTOS/Source/include" -I"FreeRTOS/Source/portable/MPLAB/PIC24_dsPIC" -I"src/app" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/FreeRTOS/Source/queue.o: FreeRTOS/Source/queue.c  .generated_files/flags/default/b40ceff7f4ae17a241504889e99439db7279938e .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/FreeRTOS/Source" 
	@${RM} ${OBJECTDIR}/FreeRTOS/Source/queue.o.d 
	@${RM} ${OBJECTDIR}/FreeRTOS/Source/queue.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  FreeRTOS/Source/queue.c  -o ${OBJECTDIR}/FreeRTOS/Source/queue.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/FreeRTOS/Source/queue.o.d"      -mno-eds-warn  -g -omf=elf -mcodecov=near -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"mcc_generated_files" -I"src/config" -I"FreeRTOS/Source/include" -I"FreeRTOS/Source/portable/MPLAB/PIC24_dsPIC" -I"src/app" -mlarge-code -msmall-data -O0 -I"mcc_generated_files" -I"src/config" -I"FreeRTOS/Source/include" -I"FreeRTOS/Source/portable/MPLAB/PIC24_dsPIC" -I"src/app" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/FreeRTOS/Source/stream_buffer.o: FreeRTOS/Source/stream_buffer.c  .generated_files/flags/default/d9e149820814a9966f0666e9534fa37308033a09 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/FreeRTOS/Source" 
	@${RM} ${OBJECTDIR}/FreeRTOS/Source/stream_buffer.o.d 
	@${RM} ${OBJECTDIR}/FreeRTOS/Source/stream_buffer.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  FreeRTOS/Source/stream_buffer.c  -o ${OBJECTDIR}/FreeRTOS/Source/stream_buffer.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/FreeRTOS/Source/stream_buffer.o.d"      -mno-eds-warn  -g -omf=elf -mcodecov=near -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"mcc_generated_files" -I"src/config" -I"FreeRTOS/Source/include" -I"FreeRTOS/Source/portable/MPLAB/PIC24_dsPIC" -I"src/app" -mlarge-code -msmall-data -O0 -I"mcc_generated_files" -I"src/config" -I"FreeRTOS/Source/include" -I"FreeRTOS/Source/portable/MPLAB/PIC24_dsPIC" -I"src/app" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/FreeRTOS/Source/tasks.o: FreeRTOS/Source/tasks.c  .generated_files/flags/default/ee10df80e2d5ff20fbbad469cf306dd82cd52573 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/FreeRTOS/Source" 
	@${RM} ${OBJECTDIR}/FreeRTOS/Source/tasks.o.d 
	@${RM} ${OBJECTDIR}/FreeRTOS/Source/tasks.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  FreeRTOS/Source/tasks.c  -o ${OBJECTDIR}/FreeRTOS/Source/tasks.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/FreeRTOS/Source/tasks.o.d"      -mno-eds-warn  -g -omf=elf -mcodecov=near -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"mcc_generated_files" -I"src/config" -I"FreeRTOS/Source/include" -I"FreeRTOS/Source/portable/MPLAB/PIC24_dsPIC" -I"src/app" -mlarge-code -msmall-data -O0 -I"mcc_generated_files" -I"src/config" -I"FreeRTOS/Source/include" -I"FreeRTOS/Source/portable/MPLAB/PIC24_dsPIC" -I"src/app" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/FreeRTOS/Source/timers.o: FreeRTOS/Source/timers.c  .generated_files/flags/default/97aa8db62cb64f5139e07aaf84e35d90a370ab10 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/FreeRTOS/Source" 
	@${RM} ${OBJECTDIR}/FreeRTOS/Source/timers.o.d 
	@${RM} ${OBJECTDIR}/FreeRTOS/Source/timers.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  FreeRTOS/Source/timers.c  -o ${OBJECTDIR}/FreeRTOS/Source/timers.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/FreeRTOS/Source/timers.o.d"      -mno-eds-warn  -g -omf=elf -mcodecov=near -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"mcc_generated_files" -I"src/config" -I"FreeRTOS/Source/include" -I"FreeRTOS/Source/portable/MPLAB/PIC24_dsPIC" -I"src/app" -mlarge-code -msmall-data -O0 -I"mcc_generated_files" -I"src/config" -I"FreeRTOS/Source/include" -I"FreeRTOS/Source/portable/MPLAB/PIC24_dsPIC" -I"src/app" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/FreeRTOS/Source/portable/GCC/MemMang/heap_4.o: FreeRTOS/Source/portable/GCC/MemMang/heap_4.c  .generated_files/flags/default/a34a32c8f72fa5f993f5341a756de0830fa951f6 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/FreeRTOS/Source/portable/GCC/MemMang" 
	@${RM} ${OBJECTDIR}/FreeRTOS/Source/portable/GCC/MemMang/heap_4.o.d 
	@${RM} ${OBJECTDIR}/FreeRTOS/Source/portable/GCC/MemMang/heap_4.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  FreeRTOS/Source/portable/GCC/MemMang/heap_4.c  -o ${OBJECTDIR}/FreeRTOS/Source/portable/GCC/MemMang/heap_4.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/FreeRTOS/Source/portable/GCC/MemMang/heap_4.o.d"      -mno-eds-warn  -g -omf=elf -mcodecov=near -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"mcc_generated_files" -I"src/config" -I"FreeRTOS/Source/include" -I"FreeRTOS/Source/portable/MPLAB/PIC24_dsPIC" -I"src/app" -mlarge-code -msmall-data -O0 -I"mcc_generated_files" -I"src/config" -I"FreeRTOS/Source/include" -I"FreeRTOS/Source/portable/MPLAB/PIC24_dsPIC" -I"src/app" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/FreeRTOS/Source/portable/MPLAB/PIC24_dsPIC/port.o: FreeRTOS/Source/portable/MPLAB/PIC24_dsPIC/port.c  .generated_files/flags/default/85c377d0a11191f02dc0e008f31915352ff5a23d .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/FreeRTOS/Source/portable/MPLAB/PIC24_dsPIC" 
	@${RM} ${OBJECTDIR}/FreeRTOS/Source/portable/MPLAB/PIC24_dsPIC/port.o.d 
	@${RM} ${OBJECTDIR}/FreeRTOS/Source/portable/MPLAB/PIC24_dsPIC/port.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  FreeRTOS/Source/portable/MPLAB/PIC24_dsPIC/port.c  -o ${OBJECTDIR}/FreeRTOS/Source/portable/MPLAB/PIC24_dsPIC/port.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/FreeRTOS/Source/portable/MPLAB/PIC24_dsPIC/port.o.d"      -mno-eds-warn  -g -omf=elf -mcodecov=near -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"mcc_generated_files" -I"src/config" -I"FreeRTOS/Source/include" -I"FreeRTOS/Source/portable/MPLAB/PIC24_dsPIC" -I"src/app" -mlarge-code -msmall-data -O0 -I"mcc_generated_files" -I"src/config" -I"FreeRTOS/Source/include" -I"FreeRTOS/Source/portable/MPLAB/PIC24_dsPIC" -I"src/app" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/system.o: mcc_generated_files/system.c  .generated_files/flags/default/dbbd00bdece77191bdf1eeb5f1a82bcfa7d1ec9a .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/system.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/system.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/system.c  -o ${OBJECTDIR}/mcc_generated_files/system.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/system.o.d"      -mno-eds-warn  -g -omf=elf -mcodecov=near -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"mcc_generated_files" -I"src/config" -I"FreeRTOS/Source/include" -I"FreeRTOS/Source/portable/MPLAB/PIC24_dsPIC" -I"src/app" -mlarge-code -msmall-data -O0 -I"mcc_generated_files" -I"src/config" -I"FreeRTOS/Source/include" -I"FreeRTOS/Source/portable/MPLAB/PIC24_dsPIC" -I"src/app" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/traps.o: mcc_generated_files/traps.c  .generated_files/flags/default/6dd5e0fc9ca4bd366c2b5709a6c7087930d864fc .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/traps.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/traps.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/traps.c  -o ${OBJECTDIR}/mcc_generated_files/traps.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/traps.o.d"      -mno-eds-warn  -g -omf=elf -mcodecov=near -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"mcc_generated_files" -I"src/config" -I"FreeRTOS/Source/include" -I"FreeRTOS/Source/portable/MPLAB/PIC24_dsPIC" -I"src/app" -mlarge-code -msmall-data -O0 -I"mcc_generated_files" -I"src/config" -I"FreeRTOS/Source/include" -I"FreeRTOS/Source/portable/MPLAB/PIC24_dsPIC" -I"src/app" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/mcc.o: mcc_generated_files/mcc.c  .generated_files/flags/default/d9a3eb5b893aac941004dfebf065e95d0ec50afa .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/mcc.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/mcc.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/mcc.c  -o ${OBJECTDIR}/mcc_generated_files/mcc.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/mcc.o.d"      -mno-eds-warn  -g -omf=elf -mcodecov=near -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"mcc_generated_files" -I"src/config" -I"FreeRTOS/Source/include" -I"FreeRTOS/Source/portable/MPLAB/PIC24_dsPIC" -I"src/app" -mlarge-code -msmall-data -O0 -I"mcc_generated_files" -I"src/config" -I"FreeRTOS/Source/include" -I"FreeRTOS/Source/portable/MPLAB/PIC24_dsPIC" -I"src/app" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/interrupt_manager.o: mcc_generated_files/interrupt_manager.c  .generated_files/flags/default/b35845f12a42b237c9111e27548050f3dad6c273 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/interrupt_manager.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/interrupt_manager.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/interrupt_manager.c  -o ${OBJECTDIR}/mcc_generated_files/interrupt_manager.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/interrupt_manager.o.d"      -mno-eds-warn  -g -omf=elf -mcodecov=near -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"mcc_generated_files" -I"src/config" -I"FreeRTOS/Source/include" -I"FreeRTOS/Source/portable/MPLAB/PIC24_dsPIC" -I"src/app" -mlarge-code -msmall-data -O0 -I"mcc_generated_files" -I"src/config" -I"FreeRTOS/Source/include" -I"FreeRTOS/Source/portable/MPLAB/PIC24_dsPIC" -I"src/app" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/pin_manager.o: mcc_generated_files/pin_manager.c  .generated_files/flags/default/3e5e874f8942ab6f85cdce9e07e2c40fe86d5767 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/pin_manager.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/pin_manager.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/pin_manager.c  -o ${OBJECTDIR}/mcc_generated_files/pin_manager.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/pin_manager.o.d"      -mno-eds-warn  -g -omf=elf -mcodecov=near -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"mcc_generated_files" -I"src/config" -I"FreeRTOS/Source/include" -I"FreeRTOS/Source/portable/MPLAB/PIC24_dsPIC" -I"src/app" -mlarge-code -msmall-data -O0 -I"mcc_generated_files" -I"src/config" -I"FreeRTOS/Source/include" -I"FreeRTOS/Source/portable/MPLAB/PIC24_dsPIC" -I"src/app" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/clock.o: mcc_generated_files/clock.c  .generated_files/flags/default/cd90426358b722cb0110fa03031ff719e6325458 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/clock.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/clock.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/clock.c  -o ${OBJECTDIR}/mcc_generated_files/clock.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/clock.o.d"      -mno-eds-warn  -g -omf=elf -mcodecov=near -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"mcc_generated_files" -I"src/config" -I"FreeRTOS/Source/include" -I"FreeRTOS/Source/portable/MPLAB/PIC24_dsPIC" -I"src/app" -mlarge-code -msmall-data -O0 -I"mcc_generated_files" -I"src/config" -I"FreeRTOS/Source/include" -I"FreeRTOS/Source/portable/MPLAB/PIC24_dsPIC" -I"src/app" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/delay.o: mcc_generated_files/delay.c  .generated_files/flags/default/89dfd1cd91a7ddca91b3c375ec5135dbd82ddb1a .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/delay.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/delay.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/delay.c  -o ${OBJECTDIR}/mcc_generated_files/delay.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/delay.o.d"      -mno-eds-warn  -g -omf=elf -mcodecov=near -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"mcc_generated_files" -I"src/config" -I"FreeRTOS/Source/include" -I"FreeRTOS/Source/portable/MPLAB/PIC24_dsPIC" -I"src/app" -mlarge-code -msmall-data -O0 -I"mcc_generated_files" -I"src/config" -I"FreeRTOS/Source/include" -I"FreeRTOS/Source/portable/MPLAB/PIC24_dsPIC" -I"src/app" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/uart1.o: mcc_generated_files/uart1.c  .generated_files/flags/default/e83968a0f1fb7b2149c5a7322caac6fc4cab81ae .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/uart1.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/uart1.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/uart1.c  -o ${OBJECTDIR}/mcc_generated_files/uart1.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/uart1.o.d"      -mno-eds-warn  -g -omf=elf -mcodecov=near -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"mcc_generated_files" -I"src/config" -I"FreeRTOS/Source/include" -I"FreeRTOS/Source/portable/MPLAB/PIC24_dsPIC" -I"src/app" -mlarge-code -msmall-data -O0 -I"mcc_generated_files" -I"src/config" -I"FreeRTOS/Source/include" -I"FreeRTOS/Source/portable/MPLAB/PIC24_dsPIC" -I"src/app" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/adc1.o: mcc_generated_files/adc1.c  .generated_files/flags/default/ac5a982dad120950f530a54fea482238ccede5da .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/adc1.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/adc1.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/adc1.c  -o ${OBJECTDIR}/mcc_generated_files/adc1.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/adc1.o.d"      -mno-eds-warn  -g -omf=elf -mcodecov=near -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"mcc_generated_files" -I"src/config" -I"FreeRTOS/Source/include" -I"FreeRTOS/Source/portable/MPLAB/PIC24_dsPIC" -I"src/app" -mlarge-code -msmall-data -O0 -I"mcc_generated_files" -I"src/config" -I"FreeRTOS/Source/include" -I"FreeRTOS/Source/portable/MPLAB/PIC24_dsPIC" -I"src/app" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/oc2.o: mcc_generated_files/oc2.c  .generated_files/flags/default/301b8214e10a670262a319cbdd0310f792273687 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/oc2.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/oc2.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/oc2.c  -o ${OBJECTDIR}/mcc_generated_files/oc2.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/oc2.o.d"      -mno-eds-warn  -g -omf=elf -mcodecov=near -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"mcc_generated_files" -I"src/config" -I"FreeRTOS/Source/include" -I"FreeRTOS/Source/portable/MPLAB/PIC24_dsPIC" -I"src/app" -mlarge-code -msmall-data -O0 -I"mcc_generated_files" -I"src/config" -I"FreeRTOS/Source/include" -I"FreeRTOS/Source/portable/MPLAB/PIC24_dsPIC" -I"src/app" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/oc1.o: mcc_generated_files/oc1.c  .generated_files/flags/default/64ac910026d7f6f6df20d4c9a567985344afbeae .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/oc1.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/oc1.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/oc1.c  -o ${OBJECTDIR}/mcc_generated_files/oc1.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/oc1.o.d"      -mno-eds-warn  -g -omf=elf -mcodecov=near -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"mcc_generated_files" -I"src/config" -I"FreeRTOS/Source/include" -I"FreeRTOS/Source/portable/MPLAB/PIC24_dsPIC" -I"src/app" -mlarge-code -msmall-data -O0 -I"mcc_generated_files" -I"src/config" -I"FreeRTOS/Source/include" -I"FreeRTOS/Source/portable/MPLAB/PIC24_dsPIC" -I"src/app" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/oc3.o: mcc_generated_files/oc3.c  .generated_files/flags/default/6daf53523bebec6d0a3140d25180fc3870688556 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/oc3.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/oc3.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/oc3.c  -o ${OBJECTDIR}/mcc_generated_files/oc3.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/oc3.o.d"      -mno-eds-warn  -g -omf=elf -mcodecov=near -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"mcc_generated_files" -I"src/config" -I"FreeRTOS/Source/include" -I"FreeRTOS/Source/portable/MPLAB/PIC24_dsPIC" -I"src/app" -mlarge-code -msmall-data -O0 -I"mcc_generated_files" -I"src/config" -I"FreeRTOS/Source/include" -I"FreeRTOS/Source/portable/MPLAB/PIC24_dsPIC" -I"src/app" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/tmr2.o: mcc_generated_files/tmr2.c  .generated_files/flags/default/a0a49a39896393ba3ceecf6bdb00dea43721706d .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/tmr2.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/tmr2.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/tmr2.c  -o ${OBJECTDIR}/mcc_generated_files/tmr2.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/tmr2.o.d"      -mno-eds-warn  -g -omf=elf -mcodecov=near -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"mcc_generated_files" -I"src/config" -I"FreeRTOS/Source/include" -I"FreeRTOS/Source/portable/MPLAB/PIC24_dsPIC" -I"src/app" -mlarge-code -msmall-data -O0 -I"mcc_generated_files" -I"src/config" -I"FreeRTOS/Source/include" -I"FreeRTOS/Source/portable/MPLAB/PIC24_dsPIC" -I"src/app" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/src/main.o: src/main.c  .generated_files/flags/default/90b0f8b85c6ce44e1ceb9ec942d05b2e7c84f17f .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/src" 
	@${RM} ${OBJECTDIR}/src/main.o.d 
	@${RM} ${OBJECTDIR}/src/main.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  src/main.c  -o ${OBJECTDIR}/src/main.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/src/main.o.d"      -mno-eds-warn  -g -omf=elf -mcodecov=near -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"mcc_generated_files" -I"src/config" -I"FreeRTOS/Source/include" -I"FreeRTOS/Source/portable/MPLAB/PIC24_dsPIC" -I"src/app" -mlarge-code -msmall-data -O0 -I"mcc_generated_files" -I"src/config" -I"FreeRTOS/Source/include" -I"FreeRTOS/Source/portable/MPLAB/PIC24_dsPIC" -I"src/app" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/src/rtos_hooks.o: src/rtos_hooks.c  .generated_files/flags/default/f5f11e69ef51f3bef93fdb78140f4d24d808faa8 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/src" 
	@${RM} ${OBJECTDIR}/src/rtos_hooks.o.d 
	@${RM} ${OBJECTDIR}/src/rtos_hooks.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  src/rtos_hooks.c  -o ${OBJECTDIR}/src/rtos_hooks.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/src/rtos_hooks.o.d"      -mno-eds-warn  -g -omf=elf -mcodecov=near -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"mcc_generated_files" -I"src/config" -I"FreeRTOS/Source/include" -I"FreeRTOS/Source/portable/MPLAB/PIC24_dsPIC" -I"src/app" -mlarge-code -msmall-data -O0 -I"mcc_generated_files" -I"src/config" -I"FreeRTOS/Source/include" -I"FreeRTOS/Source/portable/MPLAB/PIC24_dsPIC" -I"src/app" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/src/rgb_led.o: src/rgb_led.c  .generated_files/flags/default/16f39eb04a1dcaf0c762d2b0407807669c5bd0fe .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/src" 
	@${RM} ${OBJECTDIR}/src/rgb_led.o.d 
	@${RM} ${OBJECTDIR}/src/rgb_led.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  src/rgb_led.c  -o ${OBJECTDIR}/src/rgb_led.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/src/rgb_led.o.d"      -mno-eds-warn  -g -omf=elf -mcodecov=near -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"mcc_generated_files" -I"src/config" -I"FreeRTOS/Source/include" -I"FreeRTOS/Source/portable/MPLAB/PIC24_dsPIC" -I"src/app" -mlarge-code -msmall-data -O0 -I"mcc_generated_files" -I"src/config" -I"FreeRTOS/Source/include" -I"FreeRTOS/Source/portable/MPLAB/PIC24_dsPIC" -I"src/app" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: assemble
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: assemblePreproc
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${OBJECTDIR}/FreeRTOS/Source/portable/MPLAB/PIC24_dsPIC/portasm_PIC24.o: FreeRTOS/Source/portable/MPLAB/PIC24_dsPIC/portasm_PIC24.S  .generated_files/flags/default/e3de1a01d848ae705b7984bb71252d0f0b703351 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/FreeRTOS/Source/portable/MPLAB/PIC24_dsPIC" 
	@${RM} ${OBJECTDIR}/FreeRTOS/Source/portable/MPLAB/PIC24_dsPIC/portasm_PIC24.o.d 
	@${RM} ${OBJECTDIR}/FreeRTOS/Source/portable/MPLAB/PIC24_dsPIC/portasm_PIC24.o 
	${MP_CC} $(MP_EXTRA_AS_PRE)  FreeRTOS/Source/portable/MPLAB/PIC24_dsPIC/portasm_PIC24.S  -o ${OBJECTDIR}/FreeRTOS/Source/portable/MPLAB/PIC24_dsPIC/portasm_PIC24.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/FreeRTOS/Source/portable/MPLAB/PIC24_dsPIC/portasm_PIC24.o.d"  -D__DEBUG   -omf=elf -DXPRJ_default=$(CND_CONF)    -I"mcc_generated_files" -I"src/config" -I"FreeRTOS/Source/include" -I"FreeRTOS/Source/portable/MPLAB/PIC24_dsPIC" -I"src/app" -I"FreeRTOS/Source/portable/MPLAB/PIC24_dsPIC" -Wa,-MD,"${OBJECTDIR}/FreeRTOS/Source/portable/MPLAB/PIC24_dsPIC/portasm_PIC24.o.asm.d",--defsym=__MPLAB_BUILD=1,--defsym=__ICD2RAM=1,--defsym=__MPLAB_DEBUG=1,--defsym=__DEBUG=1,,-g,--no-relax$(MP_EXTRA_AS_POST)  -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/FreeRTOS/Source/portable/MPLAB/PIC24_dsPIC/portasm_dsPIC.o: FreeRTOS/Source/portable/MPLAB/PIC24_dsPIC/portasm_dsPIC.S  .generated_files/flags/default/3f7ffcfb8460f34f8517c15ce7e332e883b2d47d .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/FreeRTOS/Source/portable/MPLAB/PIC24_dsPIC" 
	@${RM} ${OBJECTDIR}/FreeRTOS/Source/portable/MPLAB/PIC24_dsPIC/portasm_dsPIC.o.d 
	@${RM} ${OBJECTDIR}/FreeRTOS/Source/portable/MPLAB/PIC24_dsPIC/portasm_dsPIC.o 
	${MP_CC} $(MP_EXTRA_AS_PRE)  FreeRTOS/Source/portable/MPLAB/PIC24_dsPIC/portasm_dsPIC.S  -o ${OBJECTDIR}/FreeRTOS/Source/portable/MPLAB/PIC24_dsPIC/portasm_dsPIC.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/FreeRTOS/Source/portable/MPLAB/PIC24_dsPIC/portasm_dsPIC.o.d"  -D__DEBUG   -omf=elf -DXPRJ_default=$(CND_CONF)    -I"mcc_generated_files" -I"src/config" -I"FreeRTOS/Source/include" -I"FreeRTOS/Source/portable/MPLAB/PIC24_dsPIC" -I"src/app" -I"FreeRTOS/Source/portable/MPLAB/PIC24_dsPIC" -Wa,-MD,"${OBJECTDIR}/FreeRTOS/Source/portable/MPLAB/PIC24_dsPIC/portasm_dsPIC.o.asm.d",--defsym=__MPLAB_BUILD=1,--defsym=__ICD2RAM=1,--defsym=__MPLAB_DEBUG=1,--defsym=__DEBUG=1,,-g,--no-relax$(MP_EXTRA_AS_POST)  -mdfp="${DFP_DIR}/xc16"
	
else
${OBJECTDIR}/FreeRTOS/Source/portable/MPLAB/PIC24_dsPIC/portasm_PIC24.o: FreeRTOS/Source/portable/MPLAB/PIC24_dsPIC/portasm_PIC24.S  .generated_files/flags/default/f2cde008dcdce5587afa0341d1e915bfcbcb7522 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/FreeRTOS/Source/portable/MPLAB/PIC24_dsPIC" 
	@${RM} ${OBJECTDIR}/FreeRTOS/Source/portable/MPLAB/PIC24_dsPIC/portasm_PIC24.o.d 
	@${RM} ${OBJECTDIR}/FreeRTOS/Source/portable/MPLAB/PIC24_dsPIC/portasm_PIC24.o 
	${MP_CC} $(MP_EXTRA_AS_PRE)  FreeRTOS/Source/portable/MPLAB/PIC24_dsPIC/portasm_PIC24.S  -o ${OBJECTDIR}/FreeRTOS/Source/portable/MPLAB/PIC24_dsPIC/portasm_PIC24.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/FreeRTOS/Source/portable/MPLAB/PIC24_dsPIC/portasm_PIC24.o.d"  -omf=elf -DXPRJ_default=$(CND_CONF)    -I"mcc_generated_files" -I"src/config" -I"FreeRTOS/Source/include" -I"FreeRTOS/Source/portable/MPLAB/PIC24_dsPIC" -I"src/app" -I"FreeRTOS/Source/portable/MPLAB/PIC24_dsPIC" -Wa,-MD,"${OBJECTDIR}/FreeRTOS/Source/portable/MPLAB/PIC24_dsPIC/portasm_PIC24.o.asm.d",--defsym=__MPLAB_BUILD=1,-g,--no-relax$(MP_EXTRA_AS_POST)  -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/FreeRTOS/Source/portable/MPLAB/PIC24_dsPIC/portasm_dsPIC.o: FreeRTOS/Source/portable/MPLAB/PIC24_dsPIC/portasm_dsPIC.S  .generated_files/flags/default/c9e1d256340a94e729f62beccb0c795981fbba6c .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/FreeRTOS/Source/portable/MPLAB/PIC24_dsPIC" 
	@${RM} ${OBJECTDIR}/FreeRTOS/Source/portable/MPLAB/PIC24_dsPIC/portasm_dsPIC.o.d 
	@${RM} ${OBJECTDIR}/FreeRTOS/Source/portable/MPLAB/PIC24_dsPIC/portasm_dsPIC.o 
	${MP_CC} $(MP_EXTRA_AS_PRE)  FreeRTOS/Source/portable/MPLAB/PIC24_dsPIC/portasm_dsPIC.S  -o ${OBJECTDIR}/FreeRTOS/Source/portable/MPLAB/PIC24_dsPIC/portasm_dsPIC.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/FreeRTOS/Source/portable/MPLAB/PIC24_dsPIC/portasm_dsPIC.o.d"  -omf=elf -DXPRJ_default=$(CND_CONF)    -I"mcc_generated_files" -I"src/config" -I"FreeRTOS/Source/include" -I"FreeRTOS/Source/portable/MPLAB/PIC24_dsPIC" -I"src/app" -I"FreeRTOS/Source/portable/MPLAB/PIC24_dsPIC" -Wa,-MD,"${OBJECTDIR}/FreeRTOS/Source/portable/MPLAB/PIC24_dsPIC/portasm_dsPIC.o.asm.d",--defsym=__MPLAB_BUILD=1,-g,--no-relax$(MP_EXTRA_AS_POST)  -mdfp="${DFP_DIR}/xc16"
	
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: link
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${DISTDIR}/rtos_template.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk    
	@${MKDIR} ${DISTDIR} 
	${MP_CC} $(MP_EXTRA_LD_PRE)  -o ${DISTDIR}/rtos_template.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}  ${OBJECTFILES_QUOTED_IF_SPACED}      -mcpu=$(MP_PROCESSOR_OPTION)        -D__DEBUG=__DEBUG   -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"mcc_generated_files" -I"src/config" -I"FreeRTOS/Source/include" -I"FreeRTOS/Source/portable/MPLAB/PIC24_dsPIC" -I"src/app" -mchp-stack-usage  -mreserve=data@0x800:0x81B -mreserve=data@0x81C:0x81D -mreserve=data@0x81E:0x81F -mreserve=data@0x820:0x821 -mreserve=data@0x822:0x823 -mreserve=data@0x824:0x827 -mreserve=data@0x82A:0x84F   -Wl,--local-stack,,--defsym=__MPLAB_BUILD=1,--defsym=__MPLAB_DEBUG=1,--defsym=__DEBUG=1,-D__DEBUG=__DEBUG,,$(MP_LINKER_FILE_OPTION),--stack=16,--check-sections,--data-init,--pack-data,--handles,--isr,--no-gc-sections,--fill-upper=0,--stackguard=16,--no-force-link,--smart-io,-Map="${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map",--report-mem,--memorysummary,${DISTDIR}/memoryfile.xml$(MP_EXTRA_LD_POST)  -mdfp="${DFP_DIR}/xc16" 
	
else
${DISTDIR}/rtos_template.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk   
	@${MKDIR} ${DISTDIR} 
	${MP_CC} $(MP_EXTRA_LD_PRE)  -o ${DISTDIR}/rtos_template.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX}  ${OBJECTFILES_QUOTED_IF_SPACED}      -mcpu=$(MP_PROCESSOR_OPTION)        -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"mcc_generated_files" -I"src/config" -I"FreeRTOS/Source/include" -I"FreeRTOS/Source/portable/MPLAB/PIC24_dsPIC" -I"src/app" -mchp-stack-usage -Wl,--local-stack,,--defsym=__MPLAB_BUILD=1,$(MP_LINKER_FILE_OPTION),--stack=16,--check-sections,--data-init,--pack-data,--handles,--isr,--no-gc-sections,--fill-upper=0,--stackguard=16,--no-force-link,--smart-io,-Map="${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map",--report-mem,--memorysummary,${DISTDIR}/memoryfile.xml$(MP_EXTRA_LD_POST)  -mdfp="${DFP_DIR}/xc16" 
	${MP_CC_DIR}\\xc16-bin2hex ${DISTDIR}/rtos_template.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX} -a  -omf=elf   -mdfp="${DFP_DIR}/xc16" 
	
endif


# Subprojects
.build-subprojects:


# Subprojects
.clean-subprojects:

# Clean Targets
.clean-conf: ${CLEAN_SUBPROJECTS}
	${RM} -r ${OBJECTDIR}
	${RM} -r ${DISTDIR}

# Enable dependency checking
.dep.inc: .depcheck-impl

DEPFILES=$(wildcard ${POSSIBLE_DEPFILES})
ifneq (${DEPFILES},)
include ${DEPFILES}
endif
