import argparse
import subprocess
import os


sim_file = "sim/"

parser = argparse.ArgumentParser()

parser.add_argument("-sim", help="Simulate the project", action="store_true")
parser.add_argument("-build", help="build the project")

args = parser.parse_args()

if args.sim:
    if not os.path.isdir(sim_file):
        print("Making Simulation directory")
        os.makedirs(sim_file)

    test = subprocess.Popen(
        [["cd", "sim_file"],
        ["vlib", "work"]]
        )
    output = test.communicate()[0]