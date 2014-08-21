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
OUTPUT_SUFFIX=cof
DEBUGGABLE_SUFFIX=cof
FINAL_IMAGE=dist/${CND_CONF}/${IMAGE_TYPE}/SREB.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
else
IMAGE_TYPE=production
OUTPUT_SUFFIX=hex
DEBUGGABLE_SUFFIX=cof
FINAL_IMAGE=dist/${CND_CONF}/${IMAGE_TYPE}/SREB.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
endif

# Object Directory
OBJECTDIR=build/${CND_CONF}/${IMAGE_TYPE}

# Distribution Directory
DISTDIR=dist/${CND_CONF}/${IMAGE_TYPE}

# Source Files Quoted if spaced
SOURCEFILES_QUOTED_IF_SPACED=source/main.c source/adc.c source/gpio.c source/pwm.c source/timer.c source/uart.c

# Object Files Quoted if spaced
OBJECTFILES_QUOTED_IF_SPACED=${OBJECTDIR}/source/main.p1 ${OBJECTDIR}/source/adc.p1 ${OBJECTDIR}/source/gpio.p1 ${OBJECTDIR}/source/pwm.p1 ${OBJECTDIR}/source/timer.p1 ${OBJECTDIR}/source/uart.p1
POSSIBLE_DEPFILES=${OBJECTDIR}/source/main.p1.d ${OBJECTDIR}/source/adc.p1.d ${OBJECTDIR}/source/gpio.p1.d ${OBJECTDIR}/source/pwm.p1.d ${OBJECTDIR}/source/timer.p1.d ${OBJECTDIR}/source/uart.p1.d

# Object Files
OBJECTFILES=${OBJECTDIR}/source/main.p1 ${OBJECTDIR}/source/adc.p1 ${OBJECTDIR}/source/gpio.p1 ${OBJECTDIR}/source/pwm.p1 ${OBJECTDIR}/source/timer.p1 ${OBJECTDIR}/source/uart.p1

# Source Files
SOURCEFILES=source/main.c source/adc.c source/gpio.c source/pwm.c source/timer.c source/uart.c


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
	${MAKE} ${MAKE_OPTIONS} -f nbproject/Makefile-default.mk dist/${CND_CONF}/${IMAGE_TYPE}/SREB.${IMAGE_TYPE}.${OUTPUT_SUFFIX}

MP_PROCESSOR_OPTION=18F4550
# ------------------------------------------------------------------------------------
# Rules for buildStep: compile
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${OBJECTDIR}/source/main.p1: source/main.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/source 
	@${RM} ${OBJECTDIR}/source/main.p1.d 
	@${RM} ${OBJECTDIR}/source/main.p1 
	${MP_CC} --pass1 $(MP_EXTRA_CC_PRE) --chip=$(MP_PROCESSOR_OPTION) -Q -G  -D__DEBUG=1 --debugger=none  --double=24 --float=24 --emi=wordwrite --opt=default,-asm,-asmfile,-speed,+space,+debug --addrqual=require --mode=std -N255 -I"include" -I"source" -V --warn=0 --asmlist --summary=default,+psect,-class,+mem,-hex,-file -L --output=default,-inhx032 --runtime=default,+clear,+init,-keep,-no_startup,-download,-config,-clib,-plib --output=+mcof,-elf "--errformat=%%f:%%l: error: %%s" "--warnformat=%%f:%%l: warning: %%s" "--msgformat=%%f:%%l: advisory: %%s"    -o${OBJECTDIR}/source/main.p1  source/main.c 
	@-${MV} ${OBJECTDIR}/source/main.d ${OBJECTDIR}/source/main.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/source/main.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/source/adc.p1: source/adc.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/source 
	@${RM} ${OBJECTDIR}/source/adc.p1.d 
	@${RM} ${OBJECTDIR}/source/adc.p1 
	${MP_CC} --pass1 $(MP_EXTRA_CC_PRE) --chip=$(MP_PROCESSOR_OPTION) -Q -G  -D__DEBUG=1 --debugger=none  --double=24 --float=24 --emi=wordwrite --opt=default,-asm,-asmfile,-speed,+space,+debug --addrqual=require --mode=std -N255 -I"include" -I"source" -V --warn=0 --asmlist --summary=default,+psect,-class,+mem,-hex,-file -L --output=default,-inhx032 --runtime=default,+clear,+init,-keep,-no_startup,-download,-config,-clib,-plib --output=+mcof,-elf "--errformat=%%f:%%l: error: %%s" "--warnformat=%%f:%%l: warning: %%s" "--msgformat=%%f:%%l: advisory: %%s"    -o${OBJECTDIR}/source/adc.p1  source/adc.c 
	@-${MV} ${OBJECTDIR}/source/adc.d ${OBJECTDIR}/source/adc.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/source/adc.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/source/gpio.p1: source/gpio.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/source 
	@${RM} ${OBJECTDIR}/source/gpio.p1.d 
	@${RM} ${OBJECTDIR}/source/gpio.p1 
	${MP_CC} --pass1 $(MP_EXTRA_CC_PRE) --chip=$(MP_PROCESSOR_OPTION) -Q -G  -D__DEBUG=1 --debugger=none  --double=24 --float=24 --emi=wordwrite --opt=default,-asm,-asmfile,-speed,+space,+debug --addrqual=require --mode=std -N255 -I"include" -I"source" -V --warn=0 --asmlist --summary=default,+psect,-class,+mem,-hex,-file -L --output=default,-inhx032 --runtime=default,+clear,+init,-keep,-no_startup,-download,-config,-clib,-plib --output=+mcof,-elf "--errformat=%%f:%%l: error: %%s" "--warnformat=%%f:%%l: warning: %%s" "--msgformat=%%f:%%l: advisory: %%s"    -o${OBJECTDIR}/source/gpio.p1  source/gpio.c 
	@-${MV} ${OBJECTDIR}/source/gpio.d ${OBJECTDIR}/source/gpio.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/source/gpio.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/source/pwm.p1: source/pwm.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/source 
	@${RM} ${OBJECTDIR}/source/pwm.p1.d 
	@${RM} ${OBJECTDIR}/source/pwm.p1 
	${MP_CC} --pass1 $(MP_EXTRA_CC_PRE) --chip=$(MP_PROCESSOR_OPTION) -Q -G  -D__DEBUG=1 --debugger=none  --double=24 --float=24 --emi=wordwrite --opt=default,-asm,-asmfile,-speed,+space,+debug --addrqual=require --mode=std -N255 -I"include" -I"source" -V --warn=0 --asmlist --summary=default,+psect,-class,+mem,-hex,-file -L --output=default,-inhx032 --runtime=default,+clear,+init,-keep,-no_startup,-download,-config,-clib,-plib --output=+mcof,-elf "--errformat=%%f:%%l: error: %%s" "--warnformat=%%f:%%l: warning: %%s" "--msgformat=%%f:%%l: advisory: %%s"    -o${OBJECTDIR}/source/pwm.p1  source/pwm.c 
	@-${MV} ${OBJECTDIR}/source/pwm.d ${OBJECTDIR}/source/pwm.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/source/pwm.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/source/timer.p1: source/timer.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/source 
	@${RM} ${OBJECTDIR}/source/timer.p1.d 
	@${RM} ${OBJECTDIR}/source/timer.p1 
	${MP_CC} --pass1 $(MP_EXTRA_CC_PRE) --chip=$(MP_PROCESSOR_OPTION) -Q -G  -D__DEBUG=1 --debugger=none  --double=24 --float=24 --emi=wordwrite --opt=default,-asm,-asmfile,-speed,+space,+debug --addrqual=require --mode=std -N255 -I"include" -I"source" -V --warn=0 --asmlist --summary=default,+psect,-class,+mem,-hex,-file -L --output=default,-inhx032 --runtime=default,+clear,+init,-keep,-no_startup,-download,-config,-clib,-plib --output=+mcof,-elf "--errformat=%%f:%%l: error: %%s" "--warnformat=%%f:%%l: warning: %%s" "--msgformat=%%f:%%l: advisory: %%s"    -o${OBJECTDIR}/source/timer.p1  source/timer.c 
	@-${MV} ${OBJECTDIR}/source/timer.d ${OBJECTDIR}/source/timer.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/source/timer.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/source/uart.p1: source/uart.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/source 
	@${RM} ${OBJECTDIR}/source/uart.p1.d 
	@${RM} ${OBJECTDIR}/source/uart.p1 
	${MP_CC} --pass1 $(MP_EXTRA_CC_PRE) --chip=$(MP_PROCESSOR_OPTION) -Q -G  -D__DEBUG=1 --debugger=none  --double=24 --float=24 --emi=wordwrite --opt=default,-asm,-asmfile,-speed,+space,+debug --addrqual=require --mode=std -N255 -I"include" -I"source" -V --warn=0 --asmlist --summary=default,+psect,-class,+mem,-hex,-file -L --output=default,-inhx032 --runtime=default,+clear,+init,-keep,-no_startup,-download,-config,-clib,-plib --output=+mcof,-elf "--errformat=%%f:%%l: error: %%s" "--warnformat=%%f:%%l: warning: %%s" "--msgformat=%%f:%%l: advisory: %%s"    -o${OBJECTDIR}/source/uart.p1  source/uart.c 
	@-${MV} ${OBJECTDIR}/source/uart.d ${OBJECTDIR}/source/uart.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/source/uart.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
else
${OBJECTDIR}/source/main.p1: source/main.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/source 
	@${RM} ${OBJECTDIR}/source/main.p1.d 
	@${RM} ${OBJECTDIR}/source/main.p1 
	${MP_CC} --pass1 $(MP_EXTRA_CC_PRE) --chip=$(MP_PROCESSOR_OPTION) -Q -G  --double=24 --float=24 --emi=wordwrite --opt=default,-asm,-asmfile,-speed,+space,+debug --addrqual=require --mode=std -N255 -I"include" -I"source" -V --warn=0 --asmlist --summary=default,+psect,-class,+mem,-hex,-file -L --output=default,-inhx032 --runtime=default,+clear,+init,-keep,-no_startup,-download,-config,-clib,-plib --output=+mcof,-elf "--errformat=%%f:%%l: error: %%s" "--warnformat=%%f:%%l: warning: %%s" "--msgformat=%%f:%%l: advisory: %%s"    -o${OBJECTDIR}/source/main.p1  source/main.c 
	@-${MV} ${OBJECTDIR}/source/main.d ${OBJECTDIR}/source/main.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/source/main.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/source/adc.p1: source/adc.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/source 
	@${RM} ${OBJECTDIR}/source/adc.p1.d 
	@${RM} ${OBJECTDIR}/source/adc.p1 
	${MP_CC} --pass1 $(MP_EXTRA_CC_PRE) --chip=$(MP_PROCESSOR_OPTION) -Q -G  --double=24 --float=24 --emi=wordwrite --opt=default,-asm,-asmfile,-speed,+space,+debug --addrqual=require --mode=std -N255 -I"include" -I"source" -V --warn=0 --asmlist --summary=default,+psect,-class,+mem,-hex,-file -L --output=default,-inhx032 --runtime=default,+clear,+init,-keep,-no_startup,-download,-config,-clib,-plib --output=+mcof,-elf "--errformat=%%f:%%l: error: %%s" "--warnformat=%%f:%%l: warning: %%s" "--msgformat=%%f:%%l: advisory: %%s"    -o${OBJECTDIR}/source/adc.p1  source/adc.c 
	@-${MV} ${OBJECTDIR}/source/adc.d ${OBJECTDIR}/source/adc.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/source/adc.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/source/gpio.p1: source/gpio.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/source 
	@${RM} ${OBJECTDIR}/source/gpio.p1.d 
	@${RM} ${OBJECTDIR}/source/gpio.p1 
	${MP_CC} --pass1 $(MP_EXTRA_CC_PRE) --chip=$(MP_PROCESSOR_OPTION) -Q -G  --double=24 --float=24 --emi=wordwrite --opt=default,-asm,-asmfile,-speed,+space,+debug --addrqual=require --mode=std -N255 -I"include" -I"source" -V --warn=0 --asmlist --summary=default,+psect,-class,+mem,-hex,-file -L --output=default,-inhx032 --runtime=default,+clear,+init,-keep,-no_startup,-download,-config,-clib,-plib --output=+mcof,-elf "--errformat=%%f:%%l: error: %%s" "--warnformat=%%f:%%l: warning: %%s" "--msgformat=%%f:%%l: advisory: %%s"    -o${OBJECTDIR}/source/gpio.p1  source/gpio.c 
	@-${MV} ${OBJECTDIR}/source/gpio.d ${OBJECTDIR}/source/gpio.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/source/gpio.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/source/pwm.p1: source/pwm.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/source 
	@${RM} ${OBJECTDIR}/source/pwm.p1.d 
	@${RM} ${OBJECTDIR}/source/pwm.p1 
	${MP_CC} --pass1 $(MP_EXTRA_CC_PRE) --chip=$(MP_PROCESSOR_OPTION) -Q -G  --double=24 --float=24 --emi=wordwrite --opt=default,-asm,-asmfile,-speed,+space,+debug --addrqual=require --mode=std -N255 -I"include" -I"source" -V --warn=0 --asmlist --summary=default,+psect,-class,+mem,-hex,-file -L --output=default,-inhx032 --runtime=default,+clear,+init,-keep,-no_startup,-download,-config,-clib,-plib --output=+mcof,-elf "--errformat=%%f:%%l: error: %%s" "--warnformat=%%f:%%l: warning: %%s" "--msgformat=%%f:%%l: advisory: %%s"    -o${OBJECTDIR}/source/pwm.p1  source/pwm.c 
	@-${MV} ${OBJECTDIR}/source/pwm.d ${OBJECTDIR}/source/pwm.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/source/pwm.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/source/timer.p1: source/timer.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/source 
	@${RM} ${OBJECTDIR}/source/timer.p1.d 
	@${RM} ${OBJECTDIR}/source/timer.p1 
	${MP_CC} --pass1 $(MP_EXTRA_CC_PRE) --chip=$(MP_PROCESSOR_OPTION) -Q -G  --double=24 --float=24 --emi=wordwrite --opt=default,-asm,-asmfile,-speed,+space,+debug --addrqual=require --mode=std -N255 -I"include" -I"source" -V --warn=0 --asmlist --summary=default,+psect,-class,+mem,-hex,-file -L --output=default,-inhx032 --runtime=default,+clear,+init,-keep,-no_startup,-download,-config,-clib,-plib --output=+mcof,-elf "--errformat=%%f:%%l: error: %%s" "--warnformat=%%f:%%l: warning: %%s" "--msgformat=%%f:%%l: advisory: %%s"    -o${OBJECTDIR}/source/timer.p1  source/timer.c 
	@-${MV} ${OBJECTDIR}/source/timer.d ${OBJECTDIR}/source/timer.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/source/timer.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/source/uart.p1: source/uart.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/source 
	@${RM} ${OBJECTDIR}/source/uart.p1.d 
	@${RM} ${OBJECTDIR}/source/uart.p1 
	${MP_CC} --pass1 $(MP_EXTRA_CC_PRE) --chip=$(MP_PROCESSOR_OPTION) -Q -G  --double=24 --float=24 --emi=wordwrite --opt=default,-asm,-asmfile,-speed,+space,+debug --addrqual=require --mode=std -N255 -I"include" -I"source" -V --warn=0 --asmlist --summary=default,+psect,-class,+mem,-hex,-file -L --output=default,-inhx032 --runtime=default,+clear,+init,-keep,-no_startup,-download,-config,-clib,-plib --output=+mcof,-elf "--errformat=%%f:%%l: error: %%s" "--warnformat=%%f:%%l: warning: %%s" "--msgformat=%%f:%%l: advisory: %%s"    -o${OBJECTDIR}/source/uart.p1  source/uart.c 
	@-${MV} ${OBJECTDIR}/source/uart.d ${OBJECTDIR}/source/uart.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/source/uart.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: assemble
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: link
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
dist/${CND_CONF}/${IMAGE_TYPE}/SREB.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk    
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_CC} $(MP_EXTRA_LD_PRE) --chip=$(MP_PROCESSOR_OPTION) -G -mdist/${CND_CONF}/${IMAGE_TYPE}/SREB.${IMAGE_TYPE}.map  -D__DEBUG=1 --debugger=none  --double=24 --float=24 --emi=wordwrite --opt=default,-asm,-asmfile,-speed,+space,+debug --addrqual=require --mode=std -N255 -I"include" -I"source" -V --warn=0 --asmlist --summary=default,+psect,-class,+mem,-hex,-file -L --output=default,-inhx032 --runtime=default,+clear,+init,-keep,-no_startup,-download,-config,-clib,-plib --output=+mcof,-elf "--errformat=%%f:%%l: error: %%s" "--warnformat=%%f:%%l: warning: %%s" "--msgformat=%%f:%%l: advisory: %%s"        -odist/${CND_CONF}/${IMAGE_TYPE}/SREB.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX}  ${OBJECTFILES_QUOTED_IF_SPACED}     
	@${RM} dist/${CND_CONF}/${IMAGE_TYPE}/SREB.${IMAGE_TYPE}.hex 
	
else
dist/${CND_CONF}/${IMAGE_TYPE}/SREB.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk   
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_CC} $(MP_EXTRA_LD_PRE) --chip=$(MP_PROCESSOR_OPTION) -G -mdist/${CND_CONF}/${IMAGE_TYPE}/SREB.${IMAGE_TYPE}.map  --double=24 --float=24 --emi=wordwrite --opt=default,-asm,-asmfile,-speed,+space,+debug --addrqual=require --mode=std -N255 -I"include" -I"source" -V --warn=0 --asmlist --summary=default,+psect,-class,+mem,-hex,-file -L --output=default,-inhx032 --runtime=default,+clear,+init,-keep,-no_startup,-download,-config,-clib,-plib --output=+mcof,-elf "--errformat=%%f:%%l: error: %%s" "--warnformat=%%f:%%l: warning: %%s" "--msgformat=%%f:%%l: advisory: %%s"     -odist/${CND_CONF}/${IMAGE_TYPE}/SREB.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX}  ${OBJECTFILES_QUOTED_IF_SPACED}     
	
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
