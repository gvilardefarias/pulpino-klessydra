import re
import argparse
import os

clk_p = 10
T_START = 73355000
T_END = 125455000

parser = argparse.ArgumentParser(description="SAIF Parser")
parser.add_argument("file_name", help="Path to the SAIF file or VCD file")
parser.add_argument("-t_file", help="Path to the file where start and end times are recorded")
parser.add_argument("-t_start", help="Start time for SAIF analysis", default=str(T_START))
parser.add_argument("-t_end", help="End time for SAIF analysis", default=str(T_END))
args = parser.parse_args()

def analyze_saif(file_path):
    total_toggles = 0
    signal_count = 0
    duration = -1

    re_duration = re.compile(r"\(DURATION\s+([\d\.]+)\)")
    
    re_tc = re.compile(r"\(TC\s+(\d+)\)")

    with open(file_path, 'r', encoding='utf-8', errors='ignore') as f:
        for line in f:
            if duration == -1:
                dur_match = re_duration.search(line)
                if dur_match:
                    duration = float(dur_match.group(1))

            tcs = re_tc.findall(line)
            
            if tcs:
                for count in tcs:
                    tc_val = int(count)
                    total_toggles += tc_val
                    signal_count += 1
    
    duration /= 1000

    print("-" * 50)
    print("SAIF Analyser")
    print("-" * 50)
    print(f"File: {file_path}")
    print(f"Duration: {duration:.2f}")
    print(f"Signal count (SC): {signal_count}")
    print(f"Toggle count (TC): {total_toggles}")
    print("-" * 50)

    avg_tc = total_toggles / signal_count
    
    toggle_rate = clk_p*avg_tc / duration

    print(f"Toggle per signal (TC/SC): {avg_tc:.2f}")
    print(f"Toggle rate per clock (TR): {100*toggle_rate:.2f}%")
    
    print("-" * 50)

if __name__ == "__main__":
    file_name = args.file_name
    t_start = int(args.t_start)
    t_end = int(args.t_end)

    if args.t_file:
        with open(args.t_file, "r") as t_file:
            lines = t_file.readlines()
            for line in lines:
                if line.startswith("start"):
                    t_start = int(line.split()[1])
                elif line.startswith("end"):
                    t_end = int(line.split()[1])

    name, ext = file_name.rsplit(".", 1)
    if ext == "vcd":
        os.system(f"vcd2saif -input {file_name} -output {name}.saif -time {t_start} {t_end}")
    analyze_saif(name + ".saif")