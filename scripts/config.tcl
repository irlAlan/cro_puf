set project_name     "cro_puf"
set top_module       "top"
set constraints_file "cro_constr.xdc"
set fpga_part        "xc7a35tcpg236-1"

set script_dir [file dirname [file normalize [info script]]]
set root_dir   [file normalize [file join $script_dir ".."]]

proc join_path {args} {
    return [eval file join $args]
}

set src_dir      [join_path $root_dir src]
set constr_dir   [join_path $root_dir constr]

set synth_dir    [join_path $root_dir build synth]
set impl_dir     [join_path $root_dir build impl]
set reports_dir  [join_path $root_dir build reports]
set bit_dir      [join_path $root_dir build bit]

file mkdir $synth_dir
file mkdir $impl_dir
file mkdir $reports_dir
file mkdir $bit_dir