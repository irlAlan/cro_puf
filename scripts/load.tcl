source common.tcl

open_hw_manager
connect_hw_server
open_hw_target

current_hw_device [lindex [get_hw_devices] 0]

set_property PROGRAM.FILE \
    $bit_dir/$project_name.bit \
    [current_hw_device]

program_hw_devices [current_hw_device]

puts "Loading Finished\n"


# Path to your bitstream
#set bitfile "../build/bit/ST_RGC.bit"
#
#open_hw
#connect_hw_server
#
## Open the JTAG chain
#open_hw_target
#
## Get the FPGA device (Basys3 has one)
#set dev [lindex [get_hw_devices] 0]
#
## Associate the bitstream with the device
#set_property PROGRAM.FILE $bitfile $dev
#
## Program the FPGA
#program_hw_devices $dev
#
## Optional: refresh status
#refresh_hw_device $dev
