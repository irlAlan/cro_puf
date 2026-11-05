# #!/usr/bin/env python3

import subprocess
import sys

TCL_DIR = "scripts"

COMMANDS = {
    "project": "create_project.tcl",
    "synth":   "synth.tcl",
    "impl":    "impl.tcl",
    "bit":     "bitstream.tcl",
    "program": "program.tcl"
}

def run_vivado(script):
    subprocess.run(
        [
            "vivado",
            "-mode",
            "batch",
            "-source",
            f"{TCL_DIR}/{script}"
        ],
        check=True
    )

def run_modelsim():
    subprocess.run(
        [
            "vsim",
            "-do",
            "scripts/sim_modelsim.do"
        ],
        check=True
    )

def build():
    run_vivado(COMMANDS["synth"])
    run_vivado(COMMANDS["impl"])
    run_vivado(COMMANDS["bit"])

def usage():
    print(
        """
Usage:
    control.py sim
    control.py project
    control.py synth
    control.py impl
    control.py bit
    control.py program
    control.py build
"""
    )

if __name__ == "__main__":

    if len(sys.argv) != 2:
        usage()
        sys.exit(1)

    cmd = sys.argv[1]

    if cmd == "sim":
        run_modelsim()

    elif cmd == "build":
        build()

    elif cmd in COMMANDS:
        run_vivado(COMMANDS[cmd])

    else:
        print(f"Unknown command: {cmd}")
        usage()
        sys.exit(1)