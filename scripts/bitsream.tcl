source common.tcl

open_checkpoint \
    $impl_dir/post_route.dcp

write_bitstream \
    -force \
    $bit_dir/$project_name.bit


puts "Bitsream Generated\n"
