import matplotlib.pyplot as plt 
import csv
import numpy as np
import argparse

args = argparse.ArgumentParser(description='Generate graphs from data')
args.add_argument('input', type=str, default='data.csv', help='Input file name')

input_args = args.parse_args()
input_file = input_args.input

def SDC_MS():
    DC = {}

    with open(input_file, 'r') as f:
        reader = csv.reader(f)
        for idx, row in enumerate(reader):
            if idx == 0:
                continue
            #mat_size = row[0].split(' ')[0].split('x')
            #mat_size = int(mat_size[0]) * int(mat_size[1])
            mat_size = row[0].split(' ')[0]

            if mat_size not in DC:
                DC[mat_size] = [int(row[3])]
            else:
                DC[mat_size].append(int(row[3]))

    x = DC.keys()
    y = []
    lower_err = []
    upper_err = []

    for i in x:
        DC[i] = sorted(DC[i])
        middle = DC[i][len(DC[i])//2]

        y.append(middle)
        lower_err.append(middle - DC[i][0])
        upper_err.append(DC[i][-1] - middle)

    error = [lower_err, upper_err]

    plt.plot(x, y)
    plt.errorbar(x, y, yerr=error, fmt='o', capsize=5)
    plt.ylabel('Memory Changes Fault Detected')
    plt.xlabel('Matrix Size')

    plt.title('Faults detected with random data vs Matrix Size')

    plt.show()

def SF_MS():
    DC = {}

    with open(input_file, 'r') as f:
        reader = csv.reader(f)
        for idx, row in enumerate(reader):
            if idx == 0:
                continue
            #mat_size = row[0].split(' ')[0].split('x')
            #mat_size = int(mat_size[0]) * int(mat_size[1])
            mat_size = row[0].split(' ')[0]

            if mat_size not in DC:
                DC[mat_size] = [int(row[2])]
            else:
                DC[mat_size].append(int(row[2]))

    x = DC.keys()
    y = []
    lower_err = []
    upper_err = []

    for i in x:
        DC[i] = sorted(DC[i])
        middle = DC[i][len(DC[i])//2]

        y.append(middle)
        lower_err.append(middle - DC[i][0])
        upper_err.append(DC[i][-1] - middle)

    error = [lower_err, upper_err]

    plt.plot(x, y)
    plt.errorbar(x, y, yerr=error, fmt='o', capsize=5)
    plt.ylabel('Silent Fault (Not detected)')
    plt.xlabel('Matrix Size')

    plt.title('Faults not detected with random data vs Matrix Size')

    plt.show()

def OP_MS():
    SIMD1 = 2
    SIMD2 = 8

    MS = np.array(range(1, 17))

    OP1 = MS**3/SIMD1
    OP2 = MS**3/SIMD2

    x_ticks = [2, 4, 8, 16]
    #x_ticks = [2, 4, 8, 16, 64]
    y_ticks = range(0, 2050, 150)
    #y_ticks = [i**3/FU1 for i in x_ticks]
    #y_ticks.extend([i**3/FU2 for i in x_ticks])
    #print(y_ticks)

    plt.plot(MS, OP1)
    plt.plot(MS, OP2)
    plt.legend([f'SIMD = {SIMD1}', f'SIMD = {SIMD2}'])
    plt.ylabel('Number of Operations per SIMD')
    plt.xlabel('Matrix Side')
    plt.xticks(x_ticks)
    plt.yticks(y_ticks)
    plt.title(f'Number of Operations vs Matrix Size')
    plt.show()

def parser_data(data):
    dict = {}

    for i in range(len(data)):
        if i == 0:
            continue

        for idx, val in enumerate(data[i]):
            if not data[0][idx] == 'Name':
                val = int(val)

            if not data[0][idx] in dict:
                dict[data[0][idx]] = [val]
            else:
                dict[data[0][idx]].append(val)

    return dict

def stack():
    with open(input_file, 'r') as f:
        reader = csv.reader(f)

        data = [row for row in reader]

    data = parser_data(data)

    fig, ax = plt.subplots()

    color_map = {
        'SF': 'red',
        'TO': 'yellow',
        'DC': 'green',
        'FSF': 'purple',
        'Halt': 'orange'
    }

    bottom = np.zeros(len(data['Name']))
    for fault_t in data:
        if fault_t == 'Name':
            continue

        ax.bar(data['Name'], data[fault_t], label=fault_t, bottom=bottom, color=color_map.get(fault_t, 'gray'))
        bottom += np.array(data[fault_t])


    ax.set_ylabel('Fault Count')
    ax.set_xlabel('Matrix Size')
    ax.set_title('Faults by Matrix Size')
    ax.legend()
    plt.show()

stack()
#SF_MS()