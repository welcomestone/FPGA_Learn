transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+D:/FPGA_Pro/User/LED_ctrl_2/src {D:/FPGA_Pro/User/LED_ctrl_2/src/LED_ctrl_2.v}
vlog -vlog01compat -work work +incdir+D:/FPGA_Pro/User/LED_ctrl_2/src {D:/FPGA_Pro/User/LED_ctrl_2/src/LED_twincle.v}

vlog -vlog01compat -work work +incdir+D:/FPGA_Pro/User/LED_ctrl_2/src {D:/FPGA_Pro/User/LED_ctrl_2/src/LED_ctrl_2_tb.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cycloneive_ver -L rtl_work -L work -voptargs="+acc"  LED_ctrl_2_tb

add wave *
view structure
view signals
run -all
