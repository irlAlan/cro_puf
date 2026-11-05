# Path to your bitstream
set bitfile "../build/bit/ST_RGC.bit"

open_hw
connect_hw_server

# Open the JTAG chain
open_hw_target

# Get the FPGA device (Basys3 has one)
set dev [lindex [get_hw_devices] 0]

# Associate the bitstream with the device
set_property PROGRAM.FILE $bitfile $dev

# Program the FPGA
program_hw_devices $dev

# Optional: refresh status
refresh_hw_device $dev