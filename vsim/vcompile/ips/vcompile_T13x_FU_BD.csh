#!/bin/csh
source ${PULP_PATH}/./vsim/vcompile/setup.csh

##############################################################################
# Settings
##############################################################################

set IP=T13x

##############################################################################
# Check settings
##############################################################################

# check if environment variables are defined
if (! $?MSIM_LIBS_PATH ) then
  echo "${Red} MSIM_LIBS_PATH is not defined ${NC}"
  exit 1
endif

if (! $?IPS_PATH ) then
  echo "${Red} IPS_PATH is not defined ${NC}"
  exit 1
endif

set LIB_NAME="${IP}_lib"
set LIB_PATH="${MSIM_LIBS_PATH}/${LIB_NAME}"
set IP_PATH="${IPS_PATH}/FU_breakdown"
set RTL_PATH="${RTL_PATH}"
set GL_PATH="${IPS_PATH}/../GL"
set PDK_PATH="/home/g.vilarde/syn_libraries/15nm/verilog"

##############################################################################
# Preparing library
##############################################################################

echo "${Green}--> Compiling ${IP}... ${NC}"

rm -rf $LIB_PATH

vlib $LIB_PATH
vmap $LIB_NAME $LIB_PATH

##############################################################################
# Compiling RTL
##############################################################################

echo "${Green}Compiling component: ${Brown} Klessydra-T13x FU Breakdown ${NC}"
echo "${Red}"
vcom -2008 -quiet -suppress 2583 -work ${LIB_PATH}   ${IP_PATH}/kless/PKG_RiscV_Klessydra.vhd || goto error
vcom -2008 -quiet -suppress 2583 -work ${LIB_PATH}   ${IP_PATH}/kless/RTL-Load_Store_Unit.vhd || goto error
#vcom -2008 -quiet -suppress 2583 -work ${LIB_PATH}   ${IP_PATH}/kless/RTL-Processing_Pipeline.vhd || goto error
#vcom -2008 -quiet -suppress 2583 -work ${LIB_PATH}   ${IP_PATH}/kless/RTL-Processing_Pipeline_syn.vhd || goto error
vcom -2008 -quiet -suppress 2583 -work ${LIB_PATH}   ${IP_PATH}/kless/RTL-CSR_Unit.vhd || goto error
vcom -2008 -quiet -suppress 2583 -work ${LIB_PATH}   ${IP_PATH}/kless/RTL-Program_Counter_unit.vhd || goto error
vcom -2008 -quiet -suppress 2583 -work ${LIB_PATH}   ${IP_PATH}/kless/RTL-Debug_Unit.vhd || goto error
vcom -2008 -quiet -suppress 2583 -work ${LIB_PATH}   ${IP_PATH}/kless/RTL-Registerfile.vhd || goto error
vcom -2008 -quiet -suppress 2583 -work ${LIB_PATH}   ${IP_PATH}/kless/RTL-Scratchpad_Memory_Interface.vhd || goto error
vcom -2008 -quiet -suppress 2583 -work ${LIB_PATH}   ${IP_PATH}/kless/RTL-ID_STAGE.vhd || goto error
vcom -2008 -quiet -suppress 2583 -work ${LIB_PATH}   ${IP_PATH}/kless/RTL-Scratchpad_Memory.vhd || goto error
vcom -2008 -quiet -suppress 2583 -work ${LIB_PATH}   ${IP_PATH}/kless/RTL-IE_STAGE.vhd || goto error
vcom -2008 -quiet -suppress 2583 -work ${LIB_PATH}   ${IP_PATH}/kless/STR-Klessydra_top.vhd || goto error
vcom -2008 -quiet -suppress 2583 -work ${LIB_PATH}   ${IP_PATH}/kless/RTL-IF_STAGE.vhd || goto error
#vcom -2008 -quiet -suppress 2583 -work ${LIB_PATH}   ${IP_PATH}/kless/RTL-Accumulator.vhd || goto error
#vcom -2008 -quiet -suppress 2583 -work ${LIB_PATH}   ${IP_PATH}/DSP/RTL-Adder.vhd || goto error
#vcom -2008 -quiet -suppress 2583 -work ${LIB_PATH}   ${IP_PATH}/DSP/RTL-Comparator.vhd || goto error
#vcom -2008 -quiet -suppress 2583 -work ${LIB_PATH}   ${IP_PATH}/DSP/RTL-Shifter.vhd || goto error
#vcom -2008 -quiet -suppress 2583 -work ${LIB_PATH}   ${IP_PATH}/DSP/RTL-Multiplier.vhd || goto error
#vcom -2008 -quiet -suppress 2583 -work ${LIB_PATH}   ${IP_PATH}/DSP/RTL-DSP_Unit.vhd || goto error
#vcom -2008 -quiet -suppress 2583 -work ${LIB_PATH}   ${IP_PATH}/DSP/RTL-DSP_Unit_syn_0.vhd || goto error

#vcom -2008 -quiet -suppress 2583 -work ${LIB_PATH}   ${IP_PATH}/DSP/RTL-Adder_syn.vhd || goto error
#vcom -2008 -quiet -suppress 2583 -work ${LIB_PATH}   ${IP_PATH}/DSP/RTL-Comparator_syn.vhd || goto error
#vcom -2008 -quiet -suppress 2583 -work ${LIB_PATH}   ${IP_PATH}/DSP/RTL-Shifter_syn.vhd || goto error
#vcom -2008 -quiet -suppress 2583 -work ${LIB_PATH}   ${IP_PATH}/DSP/RTL-Accumulator_syn.vhd || goto error
#vcom -2008 -quiet -suppress 2583 -work ${LIB_PATH}   ${IP_PATH}/DSP/RTL-Multiplier_syn.vhd || goto error
#vcom -2008 -quiet -suppress 2583 -work ${LIB_PATH}   ${IP_PATH}/DSP/RTL-DSP_Unit_syn.vhd || goto error

vlog -quiet -work ${LIB_PATH}   ${PDK_PATH}/NanGate_15nm_OCL_functional.v || goto error
vlog -quiet -work ${LIB_PATH}   ${GL_PATH}/DSP.v || goto error
#vlog -quiet -work ${LIB_PATH}   ${GL_PATH}/ADDER.v || goto error
#vlog -quiet -work ${LIB_PATH}   ${GL_PATH}/ACCUMULATOR.v || goto error
#vlog -quiet -work ${LIB_PATH}   ${GL_PATH}/MULTIPLIER.v || goto error
#vlog -quiet -work ${LIB_PATH}   ${GL_PATH}/SHIFTER.v || goto error
#vlog -quiet -work ${LIB_PATH}   ${GL_PATH}/COMPARATOR.v || goto error
#vcom -2008 -quiet -suppress 2583 -work ${LIB_PATH}   ${IP_PATH}/DSP/RTL-DSP_Unit_gl.vhd || goto error
vcom -2008 -quiet -suppress 2583 -work ${LIB_PATH}   ${IP_PATH}/kless/RTL-Processing_Pipeline_gl.vhd || goto error

#vcom -2008 -quiet -suppress 2583 -work ${LIB_PATH}   ${IP_PATH}/modules/FU/adders_stg/DSP_Adders_stg_1.vhd || goto error
#vcom -2008 -quiet -suppress 2583 -work ${LIB_PATH}   ${IP_PATH}/modules/FU/adders_stg/DSP_Adders_stg_2.vhd || goto error
#vcom -2008 -quiet -suppress 2583 -work ${LIB_PATH}   ${IP_PATH}/modules/FU/adders_stg/DSP_Adders_Sync.vhd || goto error
#vcom -2008 -quiet -suppress 2583 -work ${LIB_PATH}   ${IP_PATH}/modules/FU/DSP_Adders.vhd || goto error
#vcom -2008 -quiet -suppress 2583 -work ${LIB_PATH}   ${IP_PATH}/modules/FU/multipliers/multipliers_stg/DSP_Multipliers_stg_1.vhd || goto error
#vcom -2008 -quiet -suppress 2583 -work ${LIB_PATH}   ${IP_PATH}/modules/FU/multipliers/multipliers_stg/DSP_Multipliers_stg_1_comb.vhd || goto error
#vcom -2008 -quiet -suppress 2583 -work ${LIB_PATH}   ${IP_PATH}/modules/FU/multipliers/multipliers_stg/DSP_Multipliers_stg_2.vhd || goto error
#vcom -2008 -quiet -suppress 2583 -work ${LIB_PATH}   ${IP_PATH}/modules/FU/multipliers/DSP_Multipliers.vhd || goto error
#vcom -2008 -quiet -suppress 2583 -work ${LIB_PATH}   ${IP_PATH}/modules/FU/shifters_stg/DSP_Shifters_comb.vhd || goto error
#vcom -2008 -quiet -suppress 2583 -work ${LIB_PATH}   ${IP_PATH}/modules/FU/shifters_stg/DSP_Shifters_stg_1.vhd || goto error
#vcom -2008 -quiet -suppress 2583 -work ${LIB_PATH}   ${IP_PATH}/modules/FU/shifters_stg/DSP_Shifters_stg_2.vhd || goto error
#vcom -2008 -quiet -suppress 2583 -work ${LIB_PATH}   ${IP_PATH}/modules/FU/DSP_Shifters.vhd || goto error
#vcom -2008 -quiet -suppress 2583 -work ${LIB_PATH}   ${IP_PATH}/modules/FU/comparators_stg/DSP_Comparators_Unit.vhd || goto error
#vcom -2008 -quiet -suppress 2583 -work ${LIB_PATH}   ${IP_PATH}/modules/FU/DSP_Comparators.vhd || goto error
#vcom -2008 -quiet -suppress 2583 -work ${LIB_PATH}   ${IP_PATH}/modules/pipeline/DSP_Pipeline_Controller.vhd || goto error
#vcom -2008 -quiet -suppress 2583 -work ${LIB_PATH}   ${IP_PATH}/modules/mapping/mapping_multithread/DSP_Mapping_Multithread_Out_Mapper.vhd || goto error
#vcom -2008 -quiet -suppress 2583 -work ${LIB_PATH}   ${IP_PATH}/modules/mapping/mapping_multicore/DSP_Mapping_Multicore_Out_Mapper.vhd || goto error
#vcom -2008 -quiet -suppress 2583 -work ${LIB_PATH}   ${IP_PATH}/modules/mapping/mapping_multithread/DSP_Mapping_IN_Unit_Multithread.vhd || goto error
#vcom -2008 -quiet -suppress 2583 -work ${LIB_PATH}   ${IP_PATH}/modules/mapping/mapping_multicore/DSP_Mapping_IN_Unit_Multicore.vhd || goto error
#vcom -2008 -quiet -suppress 2583 -work ${LIB_PATH}   ${IP_PATH}/modules/mapping/DSP_Mapping.vhd || goto error
#vcom -2008 -quiet -suppress 2583 -work ${LIB_PATH}   ${IP_PATH}/modules/FU_handler/MT/MT_comp/DSP_FU_Issue_Buffer_Sync.vhd || goto error
#vcom -2008 -quiet -suppress 2583 -work ${LIB_PATH}   ${IP_PATH}/modules/FU_handler/MT/MT_comp/DSP_FU_Issue_Buffer_Comb.vhd || goto error
#vcom -2008 -quiet -suppress 2583 -work ${LIB_PATH}   ${IP_PATH}/modules/FU_handler/MT/MT_comp/DSP_Busy_FU_Sync.vhd || goto error
#vcom -2008 -quiet -suppress 2583 -work ${LIB_PATH}   ${IP_PATH}/modules/FU_handler/MT/MT_comp/DSP_FU_Handler_MT_pending_enabler_sync.vhd || goto error
#vcom -2008 -quiet -suppress 2583 -work ${LIB_PATH}   ${IP_PATH}/modules/FU_handler/MT/MT_comp/DSP_FU_Handler_MT_fu_enabler_comb.vhd || goto error
#vcom -2008 -quiet -suppress 2583 -work ${LIB_PATH}   ${IP_PATH}/modules/FU_handler/MT/DSP_FU_Handler_MT.vhd || goto error
#vcom -2008 -quiet -suppress 2583 -work ${LIB_PATH}   ${IP_PATH}/modules/FU_handler/MC/DSP_FU_Handler_MC.vhd || goto error
#vcom -2008 -quiet -suppress 2583 -work ${LIB_PATH}   ${IP_PATH}/modules/FU_handler/DSP_FU_Handler.vhd || goto error
#vcom -2008 -quiet -suppress 2583 -work ${LIB_PATH}   ${IP_PATH}/modules/FU_handler/DSP_FU_Enabler_Sync.vhd || goto error
#vcom -2008 -quiet -suppress 2583 -work ${LIB_PATH}   ${IP_PATH}/modules/exec/DSP_Exec_Unit.vhd || goto error
#vcom -2008 -quiet -suppress 2583 -work ${LIB_PATH}   ${IP_PATH}/modules/excpt_cntrl/DSP_Excpt_Cntrl_unit.vhd || goto error
#vcom -2008 -quiet -suppress 2583 -work ${LIB_PATH}   ${IP_PATH}/modules/FU/RTL-Accumulator.vhd || goto error
#vcom -2008 -quiet -suppress 2583 -work ${LIB_PATH}   ${IP_PATH}/modules/RTL_DSP_TOP.vhd || goto error

echo "${Cyan}--> ${IP} compilation complete! ${NC}"
exit 0

##############################################################################
# Error handler
##############################################################################

error:
echo "${NC}"
exit 1
