file mkdir build
file mkdir build/sim

cd build/sim

if {[file exists work]} {
    vdel -all -lib work
}

vlib work
vmap work work

vlog ../../src/*.sv
vlog ../../tb/*.sv

vsim tb_top

add wave *

run -all