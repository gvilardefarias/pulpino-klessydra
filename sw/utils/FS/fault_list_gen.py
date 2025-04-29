# Author: Gustavo Vilar de Farias
# This script generates a fault list for a given input file containing signal names and types

import re

# Defines
input_file = "sig_mul_list.txt"
output_file = input_file.replace("sig", "fault")
module_path = "/top_i/core_region_i/CORE/RISCV_CORE/Pipe/ACCL_generate/DSP/"

# Parameters
params = {
    "fu_range": 1,
    "accl_range": 1,
    "SIMD_Width": 64
}

def extr_pare_cont(line):
    return re.findall(r'\((.*?)\)', line)

with open(input_file, 'r') as infile, open(output_file, 'w') as outfile:
    for line in infile:
        line = line.strip()

        parts = line.split()
        signal_name = parts[1]
        signal_type = line.split(":")[1].strip()

        if "std_logic_vector" in signal_type:
            idx = extr_pare_cont(signal_type)[0]
            
            for i in range(params[idx]):
                outfile.write(f"sa0 {module_path}{signal_name}({i}) -\n")
                outfile.write(f"sa1 {module_path}{signal_name}({i}) -\n")
        elif "array_2d" in signal_type:
            idx = extr_pare_cont(signal_type)

            idx[0] = idx[0].split()[0].split('-')[0]
            idx[1] = idx[1].split()[0].split('-')[0]
            
            for i in range(params[idx[0]]):
                for j in range(params[idx[1]]):
                    outfile.write(f"sa0 {module_path}{signal_name}({i})({j}) -\n")
                    outfile.write(f"sa1 {module_path}{signal_name}({i})({j}) -\n")
        else:
            outfile.write(f"sa0 {module_path}{signal_name} -\n")
            outfile.write(f"sa1 {module_path}{signal_name} -\n")