onerror {quit -f}
vlib work
vlog -work work lab1CEG3156.vo
vlog -work work lab1CEG3156.vt
vsim -novopt -c -t 1ps -L cycloneive_ver -L altera_ver -L altera_mf_ver -L 220model_ver -L sgate work.lab1CEG3156_vlg_vec_tst
vcd file -direction lab1CEG3156.msim.vcd
vcd add -internal lab1CEG3156_vlg_vec_tst/*
vcd add -internal lab1CEG3156_vlg_vec_tst/i1/*
add wave /*
run -all
