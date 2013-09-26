#include <cstdio>
#include <cstdlib>
#include <cstring>

int randn(int seed, int n) {
    srand(seed);
    int a = 0;
    while (n--) {
        a = rand() % 13 + 1;
    }
    return a;
}

char com[21];
char player[21];
int target[200];
int ans[1000];
int res[1000];

void print(char n[21]) {
    int i = 0; 
    while (i < 21 && n[i]) {
        printf("%d ", n[i]);
        i++;
    }
    printf("\n");
}

int result(int hp, int hc) {
    if (hp > 21) {
        return -1;
    } else if (hc > 21) {
        return 1;
    } else if (hp > hc) {
        return 1;
    } else if (hp < hc) {
        return -1;
    } else {
        return 0;
    }
}

int handvalue(char n[21]) {
    int v4 = 0, v5 = 0;
    int i;
    for (i = 0; i <= 20 && n[i]; i++) {
        switch (n[i]) {
            case 1:
                v5 += 11;
                v4++;
                break;
            case 0xb:
            case 0xc:
            case 0xd:
                v5 += 10;
                break;
            default:
                v5 += n[i];
                break;
        }
    }
    char v2;
    int result;
    if (v5 > 21) {
        while (1) {
            v2 = v4-- != 0;
            if (!v2) break;
            v5 -= 10;
            if (v5 <= 20) {
                return v5;
            }
        }
        result = v5;
    } else {
        result = v5;
    }
    return result;
}

int main(int argc, char *argv[]) {
    //int seed = 1701667182;      // "name"
    
    if (argc < 4) {
        printf("%s: <target> <seed> <st>\n", argv[0]);
        return 10;
    }
    int target = atoi(argv[1]);
    int seed = atoi(argv[2]);
    int st = atoi(argv[3]);

    int win = 0;

    memset(ans, 0, sizeof(ans));

    int cnt = 0;
    for (cnt = 0; win < target; cnt++) {
        //printf("---------------------------- cnt = %d\n", cnt);
        memset(player, 0, sizeof(player));
        memset(com, 0, sizeof(com));

        player[0] = randn(seed, st++);
        com[0] = randn(seed, st++);
        player[1] = randn(seed, st++);
        com[1] = randn(seed, st++);

        int stb = st;
     
        int done = false;
        int h;
        int rs;
        for (h = 0; h < 20; h++) {
            st = stb;
            for (int i = 0; i < h; i++) {
                player[i+2] = randn(seed, st++);
                if (handvalue(player) > 21)
                    break;
            }
            memset(&com[2], 0, sizeof(com)-8);
            for (int i = 0; handvalue(player) <= 21 && i < 20; ++i) {
                if (handvalue(com) > 16)
                    break;
                com[i+2] = randn(seed, st++);
            }
            int hp = handvalue(player);
            int hc = handvalue(com);
            print(player);
            print(com);
            printf("hp = %d, hc = %d\n", hp, hc);
            
            rs = result(hp, hc);
            if (rs == 1) {
                printf("%d: %s\n", cnt, rs == 1 ? "win" : (rs == -1 ? "fail" : "draw"));
                done = true;
                break;
            }
        }
        res[cnt] = rs;
        if (done) {
            win++;
            ans[cnt] = h;
        } else {
            ans[cnt] = 0;
        }
        if (win == target) {
            break;
        }
    }
    printf("cnt = %d\n", cnt);
    for (int i = 0; i < cnt; i++) {
        printf("%d ", ans[i]);
    }
    printf("\n");
    for (int i = 0; i < cnt; i++) {
        printf("%d ", res[i]);
    }
    printf("\n");
    return 0;
}

