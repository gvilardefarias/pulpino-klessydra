#!/bin/csh
source ${PULP_PATH}/./vsim/vcompile/setup.csh

##############################################################################
# Settings
##############################################################################

set IP=OoO

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
set IP_PATH="${IPS_PATH}/OoO"
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

echo "${Green}Compiling component: ${Brown} Klessydra-OoO ${NC}"
echo "${Red}"
vcom -2008 -quiet -suppress 2583 -work ${LIB_PATH}   ${IP_PATH}/klessydra-OoO/PKG_RiscV_Klessydra.vhd || goto error
vcom -2008 -quiet -suppress 2583 -work ${LIB_PATH}   ${IP_PATH}/klessydra-OoO/RTL-Load_Store_Unit.vhd || goto error
vcom -2008 -quiet -suppress 2583 -work ${LIB_PATH}   ${IP_PATH}/klessydra-OoO/RTL-Accumulator.vhd || goto error
vcom -2008 -quiet -suppress 2583 -work ${LIB_PATH}   ${IP_PATH}/klessydra-OoO/RTL-Multiplier_Divider.vhd || goto error
vcom -2008 -quiet -suppress 2583 -work ${LIB_PATH}   ${IP_PATH}/klessydra-OoO/RTL-Commit_Counters.vhd || goto error
vcom -2008 -quiet -suppress 2583 -work ${LIB_PATH}   ${IP_PATH}/klessydra-OoO/RTL-Processing_Pipeline.vhd || goto error
vcom -2008 -quiet -suppress 2583 -work ${LIB_PATH}   ${IP_PATH}/klessydra-OoO/RTL-CSR_Unit.vhd || goto error
vcom -2008 -quiet -suppress 2583 -work ${LIB_PATH}   ${IP_PATH}/klessydra-OoO/RTL-Program_Counter_unit.vhd || goto error
vcom -2008 -quiet -suppress 2583 -work ${LIB_PATH}   ${IP_PATH}/klessydra-OoO/RTL-Debug_Unit.vhd || goto error
vcom -2008 -quiet -suppress 2583 -work ${LIB_PATH}   ${IP_PATH}/klessydra-OoO/RTL-Registerfile.vhd || goto error
vcom -2008 -quiet -suppress 2583 -work ${LIB_PATH}   ${IP_PATH}/klessydra-OoO/RTL-DSP_Unit.vhd || goto error
vcom -2008 -quiet -suppress 2583 -work ${LIB_PATH}   ${IP_PATH}/klessydra-OoO/RTL-Register_Renaming.vhd || goto error
vcom -2008 -quiet -suppress 2583 -work ${LIB_PATH}   ${IP_PATH}/klessydra-OoO/RTL-ID_STAGE.vhd || goto error
vcom -2008 -quiet -suppress 2583 -work ${LIB_PATH}   ${IP_PATH}/klessydra-OoO/RTL-Reorder_Buffer.vhd || goto error
vcom -2008 -quiet -suppress 2583 -work ${LIB_PATH}   ${IP_PATH}/klessydra-OoO/RTL-IE_STAGE.vhd || goto error
vcom -2008 -quiet -suppress 2583 -work ${LIB_PATH}   ${IP_PATH}/klessydra-OoO/RTL-Scratchpad_Memory_Interface.vhd || goto error
vcom -2008 -quiet -suppress 2583 -work ${LIB_PATH}   ${IP_PATH}/klessydra-OoO/RTL-IF_STAGE.vhd || goto error
vcom -2008 -quiet -suppress 2583 -work ${LIB_PATH}   ${IP_PATH}/klessydra-OoO/RTL-Scratchpad_Memory.vhd || goto error
vcom -2008 -quiet -suppress 2583 -work ${LIB_PATH}   ${IP_PATH}/klessydra-OoO/RTL-Instr_Issue.vhd || goto error
vcom -2008 -quiet -suppress 2583 -work ${LIB_PATH}   ${IP_PATH}/klessydra-OoO/STR-Klessydra_top.vhd || goto error

echo "${Cyan}--> ${IP} compilation complete! ${NC}"
exit 0

##############################################################################
# Error handler
##############################################################################

error:
echo "${NC}"
exit 1
