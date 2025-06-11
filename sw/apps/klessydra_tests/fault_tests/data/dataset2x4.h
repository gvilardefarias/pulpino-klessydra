#define N_ROW_1 2
#define N_COL_1 4
#define N_COL_2 2

#define N_COL_3 4

#define N_COL_4 4

unsigned int m1[2][4] = {0, 0xFFFFFFFF, 0x0000FFFF, 0x00010000,
0xFFFFFFFF, 0x0000FFFF, 0x00010000, 0};
unsigned int m2[4][2] = {0,          1,
                         1,          0x0000FFFF,
                         0x0000FFFF, 0x00001000,
                         0x00001000, 0};
