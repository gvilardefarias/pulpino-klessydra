
import argparse

input_file = ""
out_dir = "out/"

parser = argparse.ArgumentParser(description="Jasper Safe faults report parser")
parser.add_argument("-i", "--input", type=str, required=True, help="Input file path")

args = parser.parse_args()
input_file = args.input

def jasperSafes2dict(input_file):
    jasper_safe_dict = {'safe': {'sta0':[], 'sta1': []}}

    sta0_start = False
    sta1_start = False

    with open(input_file, 'r') as file:
        lines = file.readlines()
        for line in lines:
            if '<SA0>' in line:
                sta0_start = True
                sta1_start = False
                continue
            if '<SA1>' in line:
                sta0_start = False
                sta1_start = True
                continue

            if '[' in line and 'Safe' in line:
                if sta0_start:
                    jasper_safe_dict['safe']['sta0'].append(line.split()[1])
                if sta1_start:
                    jasper_safe_dict['safe']['sta1'].append(line.split()[1])

    return jasper_safe_dict

if __name__ == "__main__":
    out_dict = jasperSafes2dict(input_file)

    output_file = out_dir + "safe_dict.py"
    with open(output_file, 'w') as f:
        f.write("safe_dict = ")
        f.write(str(out_dict))