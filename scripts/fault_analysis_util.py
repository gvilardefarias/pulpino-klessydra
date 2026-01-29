fault_dict_file = "out/3a_8s/64d/fault_dict.py"
safe_dict_file = "out/3a_8s/safe_dict.py"

out_dir = "out/"

def gen_fault_summary(fault_dict, verbose=False):
    if verbose:
        output = "Fault Analysis Summary\n"
        output += "=====================\n"
    else:
        output = ""

    total_faults = 0
    total_detected = 0
    for f_type in fault_dict:
        if verbose:
            output += f"Fault Type: {f_type}\n"
        total_type = 0
        for sta in fault_dict[f_type]:
            count = len(fault_dict[f_type][sta])
            total_faults += count
            total_type += count
            if verbose:
                output += f"  {sta}: {count} faults\n"
        if verbose:
            output += f"Total: {total_type} faults\n"
            output += "-----------------------------\n"
        if f_type in ['DD', 'PD']:
            total_detected += total_type

    output += f"Total Faults: {total_faults}\n"
    output += f"Total Detected: {total_detected}\n"
    output += f"Total Undetected: {total_faults - total_detected}\n"

    return output

def remove_safe_faults(fault_dict, safe_dict):
    for f_type in fault_dict.keys():
        for sta in fault_dict[f_type].keys():
            fault_dict[f_type][sta] = [f for f in fault_dict[f_type][sta] if '.'.join(f.split('.')[1:]) not in safe_dict['safe'][sta]]
    return fault_dict

def filter_faults(fault_dict, filter):
    filtered_dict = {f_type: {'sta0': [], 'sta1': []} for f_type in fault_dict.keys()}
    for f_type in fault_dict.keys():
        for sta in fault_dict[f_type].keys():
            filtered_dict[f_type][sta] = [f for f in fault_dict[f_type][sta] if filter in f]
    return filtered_dict

def write_tmax_file(fault_dict, filename='tmax_faults.txt'):
    with open(filename, 'w') as f:
        for f_type in fault_dict.keys():
            if not f_type in ['DD', 'PD']:
                for sta in fault_dict[f_type].keys():
                    for fault in fault_dict[f_type][sta]:
                        f.write(f"{sta.replace('t', '')} AN {'/'.join(fault.split('.')[1:])}\n")

if __name__ == "__main__":
    with open(fault_dict_file, 'r') as f:
        exec(f.read())
    with open(safe_dict_file, 'r') as sd_f:
        exec(sd_f.read())

    mu_fault_dict = filter_faults(fault_dict, 'MULT_STG')
    ac_fault_dict = filter_faults(fault_dict, 'ACCUM_STG')
    ad_fault_dict = filter_faults(fault_dict, 'ADD_STG')
    sh_fault_dict = filter_faults(fault_dict, 'SHIF_STG')
    co_fault_dict = filter_faults(fault_dict, 'COMP_STG')

    fault_dict = remove_safe_faults(fault_dict, safe_dict)

    print("Filtered Fault Summary (after removing safe faults):")
    print(gen_fault_summary(fault_dict))
    write_tmax_file(fault_dict, out_dir + "tmax_faults.txt")

    fault_dict = remove_safe_faults(mu_fault_dict, safe_dict)
    print("MULT_STG Fault Summary:")
    print(gen_fault_summary(fault_dict))

    fault_dict = remove_safe_faults(ac_fault_dict, safe_dict)
    print("ACCUM_STG Fault Summary :")
    print(gen_fault_summary(fault_dict))

    fault_dict = remove_safe_faults(ad_fault_dict, safe_dict)
    print("ADD_STG Fault Summary:")
    print(gen_fault_summary(fault_dict))

    fault_dict = remove_safe_faults(sh_fault_dict, safe_dict)
    print("SHIF_STG Fault Summary:")
    print(gen_fault_summary(fault_dict))

    fault_dict = remove_safe_faults(co_fault_dict, safe_dict)
    print("COMP_STG Fault Summary:")
    print(gen_fault_summary(fault_dict))