import argparse

input_file = ""
out_dir = "out/"

parser = argparse.ArgumentParser(description="Zoix Report Parser")
parser.add_argument("-i", "--input", type=str, required=True, help="Input file path")

args = parser.parse_args()
input_file = args.input

def zoix2dict(input_file):
    zoix_dict = {'DD': {'sta0':[], 'sta1': []}, 
                 'ND': {'sta0':[], 'sta1': []}, 
                 'PD': {'sta0':[], 'sta1': []}, 
                 'NC': {'sta0':[], 'sta1': []}, 
                 'NO': {'sta0':[], 'sta1': []}}
    start = False

    prev_f_type = "-"

    with open(input_file, 'r') as file:
        lines = file.readlines()
        for line in lines:
            if line.find("}") == 0 and start:
                break
            if "FaultList{" in line:
                start = True
            if start:
                f_def = False
                for f_type in zoix_dict.keys():
                    if " " + f_type + " " in line:
                        prev_f_type = f_type
                        f_def = True

                        break
                if " -- " in line or f_def:
                    f_mod = "sta" + line.split()[-3]
                    f_name = line.split()[-1].replace("}", "").replace("\"", "")

                    zoix_dict[prev_f_type][f_mod].append(f_name)

    return zoix_dict

if __name__ == "__main__":
    out_dict = zoix2dict(input_file)

    output_file = out_dir + "fault_dict.py"
    with open(output_file, 'w') as f:
        f.write("fault_dict = ")
        f.write(str(out_dict))