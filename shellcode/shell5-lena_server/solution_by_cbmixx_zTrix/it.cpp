#include <cstdio>

int main(int argc, char *argv[]) {
    int height = 64, width = 512;
    for (int i = 0; i < (height >> 3); ++i)
        for (int j = 0; j < (width >> 3); ++j)
            for (int k = 0; k <= 2; ++k)
                for (int l = 0; l < 8; ++l)
                    for (int m = 0; m < 8; ++m) {
                            int fuck = 3 * (m + 8 * (j + ((l + 8 * i) << 6 ))) + k;
                            int f = fuck / 3;
                            if (f >= height * width){
                                fprintf(stderr, "fuck!!!!!!!!\n");
                                return 1;
                            }
                            /*
                            printf("%08X %d %d %d\n", fuck, fuck, h, w);
                            */
                            int h = f / width;
                            int w = f % width;
                            printf("%d %d %d\n", h, w, k);
                        }
    return 0;
}
