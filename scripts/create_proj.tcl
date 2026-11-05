# Create project
source common.tcl

create_project -force $project_name $root_dir/$project_name -part $fpga_part

set hdl_files [glob -nocomplain -directory $src_dir *.v *.sv *.vhd]

add_files $hdl_files

add_files -fileset constrs_1 [join_path $constr_dir $constraints_file]

import_files -force

update_compile_order -fileset sources_1

puts "Project Created"