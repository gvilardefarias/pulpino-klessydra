import numpy as np

FU = 2
size = 2048
file_name = "data.h"

def mat2str(mat, mat_name):
    n_row = len(mat)
    try:
        n_col = len(mat[0])
    except:
        n_col = 1

    if n_col > 1:
        mat_str = f"unsigned int {mat_name}[{n_row}][{n_col}] = {{"
    else:
        mat_str = f"unsigned int {mat_name}[{n_row}] = {{"

    for i in range(n_row):
        for j in range(n_col):
            if n_col > 1:
                mat_str += f"{mat[i][j]}"
            else:
                mat_str += f"{mat[i]}"
            if j < n_col - 1:
                mat_str += ", "
        if i < n_row - 1:
            mat_str += ",\n"
    mat_str += "};\n"

    return mat_str

def gen_patterns(vec_type):
    v_1 = []
    v_2 = []

    if vec_type == "chess":
        v_1 = [0xAAAAAAAA, 0xAAAAAAAA] * FU
        v_2 = [0x55555555, 0x55555555] * FU
    elif vec_type == "max_in":
        v_1 = [0xFFFFFFFF, 0xFFFFFFFF] * FU
        v_2 = [0xFFFFFFFF, 0xFFFFFFFF] * FU
    elif vec_type == "max_out":
        v_1 = [0xFFFFFFFF, 0x00000001] * FU
        v_2 = [0x00000000, 0xFFFFFFFE] * FU
    elif vec_type == "max_inter":
        v_1 = [0xFFFFFFFF, 0x00010001] * FU
        v_2 = [0x00000000, 0xFFFEFFFE] * FU
    elif vec_type == "nick1":
        v_1 = [0x3B317B33, 0xF93D5D1F, 0x9FFFE6BF, 0x6EFA8DAF]
        v_2 = [0xE5CF28F7, 0x37EF07EB, 0xFFFFAEAE, 0xB517D301]
    elif vec_type == "nick2":
                #2DEC1F76_20030006_6FFFB7F7_FD27AAA8
                #92132089_FFFFFFF9_7FFFB6BE_D7FFFFFF
        v_1 = [0xFD27AAA8, 0x20030006, 0x6FFFB7F7, 0x2DEC1F76]
        v_2 = [0xD7FFFFFF, 0xFFFFFFF9, 0x7FFFB6BE, 0x92132089]
    elif vec_type == "nick3":
                #A4030403_37FFFFFF_F553AAAA_5FFFFFFF
                #DBFFFBFF_C8030001_5FFFBFFF_73DFAAA9
        v_1 = [0x5FFFFFFF, 0x37FFFFFF, 0xF553AAAA, 0xA4030403]
        v_2 = [0x73DFAAA9, 0xC8030001, 0x5FFFBFFF, 0xDBFFFBFF]
    elif vec_type == "nick3_1":
        v_1 = [0x5FFFFFFF, 0x37FFFFFF] * FU
        v_2 = [0x73DFAAA9, 0xC8030001] * FU
    elif vec_type == "nick3_2":
        v_1 = [0xF553AAAA, 0xA4030403] * FU
        v_2 = [0x5FFFBFFF, 0xDBFFFBFF] * FU
    elif vec_type == "nick3_BE":
                #FFFFFFFA_5555CAAF_FFFFFFEC_C020C025
                #9555FBCE_FFFDFFFA_8000C013_FFDFFFDB
        v_1 = [0xC020C025, 0x5555CAAF, 0xFFFFFFEC, 0xFFFFFFFA]
        v_2 = [0xFFDFFFDB, 0xFFFDFFFA, 0x8000C013, 0x9555FBCE]

    A = []
    B = []
    for i in range(size//FU):
        if i % 2 == 0:
            for j in range(FU):
                A.append(v_1[0 + FU*j])
                B.append(v_1[1 + FU*j])
        else:
            for j in range(FU):
                A.append(v_2[0 + FU*j])
                B.append(v_2[1 + FU*j])
    return (A, B)

A, B = gen_patterns("nick3_1")

with open(file_name, "w") as f:
    f.write(f"#define V_SIZE {size}\n\n")

    f.write(mat2str(A, "A"))
    f.write(mat2str(B, "B"))

print("Dataset generated successfully.")