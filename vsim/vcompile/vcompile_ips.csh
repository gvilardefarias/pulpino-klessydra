#!/usr/bin/csh

echo ""
echo "${Green}--> Compiling PULP IPs libraries... ${NC}"
csh ${PULP_PATH}/./vsim/vcompile/ips/vcompile_apb_node.csh || exit 1
csh ${PULP_PATH}/./vsim/vcompile/ips/vcompile_apb_event_unit.csh || exit 1
csh ${PULP_PATH}/./vsim/vcompile/ips/vcompile_apb_fll_if.csh || exit 1
csh ${PULP_PATH}/./vsim/vcompile/ips/vcompile_apb_gpio.csh || exit 1
csh ${PULP_PATH}/./vsim/vcompile/ips/vcompile_apb_i2c.csh || exit 1
csh ${PULP_PATH}/./vsim/vcompile/ips/vcompile_apb_pulpino.csh || exit 1
csh ${PULP_PATH}/./vsim/vcompile/ips/vcompile_apb_spi_master.csh || exit 1
csh ${PULP_PATH}/./vsim/vcompile/ips/vcompile_apb_timer.csh || exit 1
csh ${PULP_PATH}/./vsim/vcompile/ips/vcompile_apb_uart.csh || exit 1
csh ${PULP_PATH}/./vsim/vcompile/ips/vcompile_apb_uart_sv.csh || exit 1
csh ${PULP_PATH}/./vsim/vcompile/ips/vcompile_apb2per.csh || exit 1
csh ${PULP_PATH}/./vsim/vcompile/ips/vcompile_axi2apb.csh || exit 1
csh ${PULP_PATH}/./vsim/vcompile/ips/vcompile_axi_mem_if_DP.csh || exit 1
csh ${PULP_PATH}/./vsim/vcompile/ips/vcompile_axi_node.csh || exit 1
csh ${PULP_PATH}/./vsim/vcompile/ips/vcompile_axi_slice.csh || exit 1
csh ${PULP_PATH}/./vsim/vcompile/ips/vcompile_axi_slice_dc.csh || exit 1
csh ${PULP_PATH}/./vsim/vcompile/ips/vcompile_axi_spi_master.csh || exit 1
csh ${PULP_PATH}/./vsim/vcompile/ips/vcompile_axi_spi_slave.csh || exit 1
csh ${PULP_PATH}/./vsim/vcompile/ips/vcompile_core2axi.csh || exit 1
csh ${PULP_PATH}/./vsim/vcompile/ips/vcompile_adv_dbg_if.csh || exit 1
csh ${PULP_PATH}/./vsim/vcompile/ips/vcompile_riscv.csh || exit 1
csh ${PULP_PATH}/./vsim/vcompile/ips/vcompile_zero-riscy.csh || exit 1
csh ${PULP_PATH}/./vsim/vcompile/ips/vcompile_fpu.csh || exit 1
csh ${PULP_PATH}/./vsim/vcompile/ips/vcompile_F03x.csh || exit 1
csh ${PULP_PATH}/./vsim/vcompile/ips/vcompile_Morph.csh || exit 1
csh ${PULP_PATH}/./vsim/vcompile/ips/vcompile_OoO.csh || exit 1
csh ${PULP_PATH}/./vsim/vcompile/ips/vcompile_S1.csh || exit 1
csh ${PULP_PATH}/./vsim/vcompile/ips/vcompile_T02x.csh || exit 1
csh ${PULP_PATH}/./vsim/vcompile/ips/vcompile_T03x.csh || exit 1
csh ${PULP_PATH}/./vsim/vcompile/ips/vcompile_T13x_FU_BD_gl.csh || exit 1
#csh ${PULP_PATH}/./vsim/vcompile/ips/vcompile_T13x_FU_BD.csh || exit 1
#csh ${PULP_PATH}/./vsim/vcompile/ips/vcompile_T13x.csh || exit 1
csh ${PULP_PATH}/./vsim/vcompile/ips/vcompile_fT13x.csh || exit 1
csh ${PULP_PATH}/./vsim/vcompile/ips/vcompile_dfT13x.csh || exit 1
csh ${PULP_PATH}/./vsim/vcompile/ips/vcompile_KPrim.csh || exit 1
csh ${PULP_PATH}/./vsim/vcompile/ips/vcompile_KFPU.csh || exit 1
