#!/bin/sh
# CAUTION!!! ZERO-DELAY PARAMETERS SPECIFIED HERE
LIB_FILES=""
NETLIST_FILES=" /home/g.vilarde/Klessydra/pulpino-klessydra/GL/DSP_1a_2s.v /home/g.vilarde/syn_libraries/15nm/verilog/NanGate_15nm_OCL_functional.v"
DPV_FILE="/home/g.vilarde/Klessydra/pulpino-klessydra/scripts/atpg_stildpv.v"
SIMULATOR="vcs"
if [ -z "${STILDPV_HOME}" -o ! -d "${STILDPV_HOME}" ]
then echo "ERROR: Please define \$STILDPV_HOME to reference a directory"; exit 1;
fi
${SIMULATOR} -R +acc+2 -P ${STILDPV_HOME}/lib/stildpv_vcs.tab \
 +tetramax +delay_mode_zero \
${DPV_FILE} ${NETLIST_FILES} ${LIB_FILES} \
${STILDPV_HOME}/lib/libstildpv.a
SIMSTATUS=$?
if [ ${SIMSTATUS} -ne 0 ]
then echo "WARNING: simulation command returned error status ${SIMSTATUS}"; exit ${SIMSTATUS};
fi
