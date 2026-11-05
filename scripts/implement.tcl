# Implementation of project
#
source common.tcl

open_checkpoint $synth_dir/post_synth.dcp

opt_design
place_design
phys_opt_design
route_design

write_checkpoint -force $impl_dir/post_route.dcp

report_timing_summary -file $reports_dir/impl_timing.rpt

report_utilization -file $reports_dir/impl_util.rpt

puts "Implementation Finished\n"