import re
import sys
import os

clk_p = 10
t_start = 73355000
t_end = 125455000

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
    if len(sys.argv) < 2:
        print("python calc_saif.py <file.[vcd/saif]>")
    else:
        file_name = sys.argv[1]
        name, ext = file_name.rsplit(".", 1)
        if ext == "vcd":
            os.system(f"vcd2saif -input {file_name} -output {name}.saif -time {t_start} {t_end}")
        analyze_saif(name + ".saif")