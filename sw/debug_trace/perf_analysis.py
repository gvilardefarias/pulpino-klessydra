
#!/usr/bin/env python
# Gustavo Vilar de Farias <g.vilarde@polito.it>
#
# Copyright (C) 2025 Politecnico di Torino
# All rights reserved.

import sys

def search_instr(trace_file, instr):
    """
    Search for a specific instruction in the trace file and return the lines that contain it.
    """
    results = []
    with open(trace_file, "r") as f:
        for line in f:
            if instr in line:
                results.append(line)
    return results

def extract_time(lines):
    times = []

    for line in lines:
        times.append(int(line.split()[0]))
    return times


if __name__ == "__main__":
    trace_file = sys.argv[1]

    # Search for NOP instructions in the trace file
    # and extract their timestamps
    lines = search_instr(trace_file, "nop")
    times = sorted(extract_time(lines))

    # Calculate the time difference between two nop instructions
    time_diffs = []
    for i in range(1, len(times), 2):
        time_diffs.append(times[i] - times[i - 1])

    print("Region execution time:")
    for i, time_diff in enumerate(time_diffs):
        print(f"Region {i}: {time_diff} ns")