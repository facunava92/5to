#
# Generated Makefile - do not edit!
#
# Edit the Makefile in the project folder instead (../Makefile). Each target
# has a -pre and a -post target defined where you can add customized code.
#
# This makefile implements configuration specific macros and targets.


# Include project Makefile
include Makefile
# Include makefile containing local settings
ifeq "$(wildcard nbproject/Makefile-local-default.mk)" "nbproject/Makefile-local-default.mk"
include nbproject/Makefile-local-default.mk
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
FINAL_IMAGE=dist/${CND_CONF}/${IMAGE_TYPE}/ds30Loader.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
else
IMAGE_TYPE=production
OUTPUT_SUFFIX=hex
DEBUGGABLE_SUFFIX=cof
FINAL_IMAGE=dist/${CND_CONF}/${IMAGE_TYPE}/ds30Loader.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
endif

# Object Directory
OBJECTDIR=build/${CND_CONF}/${IMAGE_TYPE}

# Distribution Directory
DISTDIR=dist/${CND_CONF}/${IMAGE_TYPE}

# Object Files Quoted if spaced
OBJECTFILES_QUOTED_IF_SPACED=${OBJECTDIR}/_ext/1360937237/ds30loader.o
POSSIBLE_DEPFILES=${OBJECTDIR}/_ext/1360937237/ds30loader.o.d

# Object Files
OBJECTFILES=${OBJECTDIR}/_ext/1360937237/ds30loader.o


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
	${MAKE} ${MAKE_OPTIONS} -f nbproject/Makefile-default.mk dist/${CND_CONF}/${IMAGE_TYPE}/ds30Loader.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}

MP_PROCESSOR_OPTION=16f1938
MP_LINKER_DEBUG_OPTION=
# ------------------------------------------------------------------------------------
# Rules for buildStep: assemble
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${OBJECTDIR}/_ext/1360937237/ds30loader.o: ../src/ds30loader.asm  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1360937237 
	@${RM} ${OBJECTDIR}/_ext/1360937237/ds30loader.o.d 
	@${FIXDEPS} dummy.d -e "Z:/temp/firmware PIC12F PIC16F/ds30Loader.X/../src/ds30loader.ERR" $(SILENT) -c ${MP_AS} $(MP_EXTRA_AS_PRE) -d__DEBUG -d__MPLAB_DEBUGGER_ICD3=1 -q -p$(MP_PROCESSOR_OPTION)  $(ASM_OPTIONS)   \"Z:/temp/firmware PIC12F PIC16F/ds30Loader.X/../src/ds30loader.asm\" 
	@${MV}  "Z:/temp/firmware PIC12F PIC16F/ds30Loader.X/../src/ds30loader.O" ${OBJECTDIR}/_ext/1360937237/ds30loader.o
	@${MV}  "Z:/temp/firmware PIC12F PIC16F/ds30Loader.X/../src/ds30loader.ERR" ${OBJECTDIR}/_ext/1360937237/ds30loader.err
	@${MV}  "Z:/temp/firmware PIC12F PIC16F/ds30Loader.X/../src/ds30loader.LST" ${OBJECTDIR}/_ext/1360937237/ds30loader.lst
	@${RM}  "Z:/temp/firmware PIC12F PIC16F/ds30Loader.X/../src/ds30loader.HEX" 
	@${DEP_GEN} -d ${OBJECTDIR}/_ext/1360937237/ds30loader.o 
	
else
${OBJECTDIR}/_ext/1360937237/ds30loader.o: ../src/ds30loader.asm  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1360937237 
	@${RM} ${OBJECTDIR}/_ext/1360937237/ds30loader.o.d 
	@${FIXDEPS} dummy.d -e "Z:/temp/firmware PIC12F PIC16F/ds30Loader.X/../src/ds30loader.ERR" $(SILENT) -c ${MP_AS} $(MP_EXTRA_AS_PRE) -q -p$(MP_PROCESSOR_OPTION)  $(ASM_OPTIONS)   \"Z:/temp/firmware PIC12F PIC16F/ds30Loader.X/../src/ds30loader.asm\" 
	@${MV}  "Z:/temp/firmware PIC12F PIC16F/ds30Loader.X/../src/ds30loader.O" ${OBJECTDIR}/_ext/1360937237/ds30loader.o
	@${MV}  "Z:/temp/firmware PIC12F PIC16F/ds30Loader.X/../src/ds30loader.ERR" ${OBJECTDIR}/_ext/1360937237/ds30loader.err
	@${MV}  "Z:/temp/firmware PIC12F PIC16F/ds30Loader.X/../src/ds30loader.LST" ${OBJECTDIR}/_ext/1360937237/ds30loader.lst
	@${RM}  "Z:/temp/firmware PIC12F PIC16F/ds30Loader.X/../src/ds30loader.HEX" 
	@${DEP_GEN} -d ${OBJECTDIR}/_ext/1360937237/ds30loader.o 
	
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: link
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
dist/${CND_CONF}/${IMAGE_TYPE}/ds30Loader.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk   
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_LD} $(MP_EXTRA_LD_PRE)   -p$(MP_PROCESSOR_OPTION)  -w -x -u_DEBUG -z__ICD2RAM=1 -m"$(BINDIR_)$(TARGETBASE).map" -w -l".."   -z__MPLAB_BUILD=1  -z__MPLAB_DEBUG=1 -z__MPLAB_DEBUGGER_ICD3=1 $(MP_LINKER_DEBUG_OPTION) -odist/${CND_CONF}/${IMAGE_TYPE}/ds30Loader.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}  ${OBJECTFILES}     
else
dist/${CND_CONF}/${IMAGE_TYPE}/ds30Loader.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk   
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_LD} $(MP_EXTRA_LD_PRE)   -p$(MP_PROCESSOR_OPTION)  -w  -m"$(BINDIR_)$(TARGETBASE).map" -w -l".."   -z__MPLAB_BUILD=1  -odist/${CND_CONF}/${IMAGE_TYPE}/ds30Loader.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX}  ${OBJECTFILES}     
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
