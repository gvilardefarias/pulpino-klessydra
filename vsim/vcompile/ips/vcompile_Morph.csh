#!/bin/csh
source ${PULP_PATH}/./vsim/vcompile/setup.csh

##############################################################################
# Settings
##############################################################################

set IP=Morph

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
set IP_PATH="${IPS_PATH}/Morph"
set RTL_PATH="${RTL_PATH}"

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

echo "${Green}Compiling component: ${Brown} Klessydra-Morph ${NC}"
echo "${Red}"
vcom -2008 -quiet -suppress 2583 -work ${LIB_PATH}   ${IP_PATH}/klessydra-m/PKG_RiscV_Klessydra.vhd || goto error
vcom -2008 -quiet -suppress 2583 -work ${LIB_PATH}   ${IP_PATH}/klessydra-m/RTL-Accumulator.vhd || goto error
vcom -2008 -quiet -suppress 2583 -work ${LIB_PATH}   ${IP_PATH}/klessydra-m/RTL-CSR_Unit.vhd || goto error
vcom -2008 -quiet -suppress 2583 -work ${LIB_PATH}   ${IP_PATH}/klessydra-m/RTL-Debug_Unit.vhd || goto error
vcom -2008 -quiet -suppress 2583 -work ${LIB_PATH}   ${IP_PATH}/klessydra-m/RTL-DSP_Unit.vhd || goto error
vcom -2008 -quiet -suppress 2583 -work ${LIB_PATH}   ${IP_PATH}/klessydra-m/RTL-FPU_Top_Wrapper.vhd || goto error
vcom -2008 -quiet -suppress 2583 -work ${LIB_PATH}   ${IP_PATH}/klessydra-m/RTL-ID_STAGE.vhd || goto error
vcom -2008 -quiet -suppress 2583 -work ${LIB_PATH}   ${IP_PATH}/klessydra-m/RTL-IE_STAGE.vhd || goto error
vcom -2008 -quiet -suppress 2583 -work ${LIB_PATH}   ${IP_PATH}/klessydra-m/RTL-IF_STAGE.vhd || goto error
vcom -2008 -quiet -suppress 2583 -work ${LIB_PATH}   ${IP_PATH}/klessydra-m/RTL-Load_Store_Unit.vhd || goto error
vcom -2008 -quiet -suppress 2583 -work ${LIB_PATH}   ${IP_PATH}/klessydra-m/RTL-Processing_Pipeline.vhd || goto error
vcom -2008 -quiet -suppress 2583 -work ${LIB_PATH}   ${IP_PATH}/klessydra-m/RTL-Program_Counter_unit.vhd || goto error
vcom -2008 -quiet -suppress 2583 -work ${LIB_PATH}   ${IP_PATH}/klessydra-m/RTL-Registerfile.vhd || goto error
vcom -2008 -quiet -suppress 2583 -work ${LIB_PATH}   ${IP_PATH}/klessydra-m/RTL-Scratchpad_Memory_Interface.vhd || goto error
vcom -2008 -quiet -suppress 2583 -work ${LIB_PATH}   ${IP_PATH}/klessydra-m/RTL-Scratchpad_Memory.vhd || goto error
vcom -2008 -quiet -suppress 2583 -work ${LIB_PATH}   ${IP_PATH}/klessydra-m/RTL-VCU_Unit.vhd || goto error
vcom -2008 -quiet -suppress 2583 -work ${LIB_PATH}   ${IP_PATH}/klessydra-m/STR-Klessydra_Core.vhd || goto error
vcom -2008 -quiet -suppress 2583 -work ${LIB_PATH}   ${IP_PATH}/klessydra-m/STR-Klessydra_Multi-Core_Wrapper.vhd || goto error
vcom -2008 -quiet -suppress 2583 -work ${LIB_PATH}   ${IP_PATH}/klessydra-m/STR-Klessydra_Top.vhd || goto error

echo "${Cyan}--> ${IP} compilation complete! ${NC}"
exit 0

##############################################################################
# Error handler
##############################################################################

error:
echo "${NC}"
exit 1
