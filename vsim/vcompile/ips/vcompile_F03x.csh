#!/bin/csh
source ${PULP_PATH}/./vsim/vcompile/setup.csh

##############################################################################
# Settings
##############################################################################

set IP=F03x

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
set IP_PATH="${IPS_PATH}/F03x"
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

echo "${Green}Compiling component: ${Brown} Klessydra-F03x ${NC}"
echo "${Red}"
vcom -2008 -quiet -suppress 2583 -work ${LIB_PATH}   ${IP_PATH}/klessydra-f0-3th/PKG_RiscV_Klessydra_thread_parameters.vhd || goto error
vcom -2008 -quiet -suppress 2583 -work ${LIB_PATH}   ${IP_PATH}/klessydra-f0-3th/PKG_RiscV_Klessydra.vhd || goto error
vcom -2008 -quiet -suppress 2583 -work ${LIB_PATH}   ${IP_PATH}/klessydra-f0-3th/TMR_REG_PKG.vhd || goto error
vcom -2008 -quiet -suppress 2583 -work ${LIB_PATH}   ${IP_PATH}/klessydra-f0-3th/CMP-TMR_REG.vhd || goto error
vcom -2008 -quiet -suppress 2583 -work ${LIB_PATH}   ${IP_PATH}/klessydra-f0-3th/RTL-Processing_Pipeline_TMR.vhd || goto error
vcom -2008 -quiet -suppress 2583 -work ${LIB_PATH}   ${IP_PATH}/klessydra-f0-3th/RTL-Program_Counter_unit_TMR.vhd || goto error
vcom -2008 -quiet -suppress 2583 -work ${LIB_PATH}   ${IP_PATH}/klessydra-f0-3th/PKG_RiscV_Klessydra.vhd || goto error
vcom -2008 -quiet -suppress 2583 -work ${LIB_PATH}   ${IP_PATH}/klessydra-f0-3th/STR-Klessydra_top.vhd || goto error
vcom -2008 -quiet -suppress 2583 -work ${LIB_PATH}   ${IP_PATH}/klessydra-f0-3th/RTL-CSR_Unit_TMR.vhd || goto error
vcom -2008 -quiet -suppress 2583 -work ${LIB_PATH}   ${IP_PATH}/klessydra-f0-3th/RTL-Debug_Unit.vhd || goto error

echo "${Cyan}--> ${IP} compilation complete! ${NC}"
exit 0

##############################################################################
# Error handler
##############################################################################

error:
echo "${NC}"
exit 1
