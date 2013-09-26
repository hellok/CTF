#include <cstdio>

class ECCDecodeDataStream {
    static int * DoDecodeBlock(int *);
}


void __attribute__ ((constructor)) my_init() {
    int ecc_struct[40];
    DoDecodeBlock(ecc_struct);
}
