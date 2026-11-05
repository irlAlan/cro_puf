set project_name "ST_RGC"
set top_module "top"
set constraints_file "cro_constr.xdc"
set fpga_part "xc7a35tcpg236-1"
set hdl_dirs {}


set script_dir [file dirname [file normalize [info script]]]
set root_dir   [file normalize [file join $script_dir ".."]]

proc join_path {args} {
    return [eval file join $args]
}

set constr_dir   [join_path $root_dir constr]
set synth_dir    [join_path $root_dir build synth]
set impl_dir     [join_path $root_dir build impl]
set reports_dir  [join_path $root_dir build reports]
set bit_dir      [join_path $root_dir build bit]

file mkdir $synth_dir   
file mkdir $impl_dir   
file mkdir $reports_dir
file mkdir $bit_dir    

# Add src directory itself 
lappend hdl_dirs [join_path $root_dir src]

# go through the entire src dir and append all the directories
#foreach dir [glob -type d -directory [file join $root_dir "src"] *] {
#    lappend hdl_dirs $dir
#}

set src_dir [file join $root_dir "src"]
set subdirs [glob -nocomplain -type d -directory $src_dir *]

foreach dir $subdirs {
    lappend hdl_dirs $dir
}

# read each sys verilog file in the directories
#foreach dir $hdl_dirs {
#    # read_verilog [glob -nocomplain [file join $dir "*.sv"]]
#    set sv_files [glob -nocomplain [file join $dir "*.sv"]]
#    if {[llength $sv_files] > 0} { read_verilog $sv_files }
#    # read_verilog [glob -nocomplain [file join $dir "*.v"]]
#}
#
set hdl_files [glob -nocomplain -directory $src_dir *.v *.sv *.vhd]

# Read Constraints file
read_xdc [join_path $constr_dir $constraints_file]


#if {$argc > 0 && [lindex $argv 0] eq "proj"} {
    puts "Creating Vivado project"
    create_project -force project_bft_batch ./project_bft_batch -part $fpga_part
    add_files $hdl_files
    # Now import/copy the files into the project
    import_files -force
#}

# synthesis
#synth_design -top $top_module -part $fpga_part
#write_checkpoint -force [join_path $synth_dir post_synth.dcp] 
#report_timing_summary -file [join_path $reports_dir synth_timing.rpt] 
#report_utilization    -file [join_path $reports_dir synth_util.rpt] 
#
## run implementation
#opt_design
#place_design
#route_design
#
#write_checkpoint -force [join_path $impl_dir post_route.dcp] 
#report_timing_summary -file [join_path $reports_dir impl_timing.rpt] 
#report_route_status   -file [join_path $reports_dir route_status.rpt] 
#report_utilization    -file [join_path $reports_dir impl_util.rpt] 
#
## write bitstream
#write_bitstream -force [join_path $bit_dir "$project_name.bit"]