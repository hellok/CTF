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
        fprintf(stderr, "%d ", n[i]);
        i++;
    }
    fprintf(stderr, "\n");
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

int rest(int score, int seed, int st) {

    if (score >= 1337) {
        return 0;
    }
    int win = 0;
    
    int target = (1337 - score) / 127;
    if ((1337 - score) % 127 != 0) {
        target++;
    }

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
        int sth0;
        for (h = 0; h < 20; h++) {
            st = stb;
            for (int i = 0; i < h; i++) {
                player[i+2] = randn(seed, st++);
                if (handvalue(player) > 21)
                    break;
            }
            memset(&com[2], 0, sizeof(com)-2);
            for (int i = 0; handvalue(player) <= 21 && i < 20; ++i) {
                if (handvalue(com) > 16)
                    break;
                com[i+2] = randn(seed, st++);
            }
            int hp = handvalue(player);
            int hc = handvalue(com);
            if (h == 0) {
                //print(player);
                //print(com);
                sth0 = st;
            }
            //fprintf(stderr, "hp = %d, hc = %d\n", hp, hc);
            
            rs = result(hp, hc);
            if (rs == 1) {
                //print(player);
                //print(com);
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
            st = sth0;
        }
        fprintf(stderr, "%d: %s\n", cnt, rs == 1 ? "win" : (rs == -1 ? "fail" : "draw"));
    }
    fprintf(stderr, "cnt = %d\n", cnt);
    for (int i = 0; i < cnt; i++) {
        printf("%d %c\n", ans[i], res[i] == -1 ? 'f' : ' ');
    }
    /*
    printf("\n");
    for (int i = 0; i < cnt; i++) {
        printf("%d ", );
    }
    printf("\n");
    */
    return 0;
}


int main(int argc, char *argv[]) {
    //int seed = 1701667182;      // "name"

    int n;
    int score;
    scanf("%d%d\n", &n, &score);
    for (int i = 0; i < n; i++) {
        scanf("%d ", &target[i]);
    }
    
    int max = 0;
    int seed = 45;

    char * sc = (char *)&seed;

    for (seed = 0; seed < (1<<30); seed++) {
        bool flag = true;
        for (int j = 0; j < 4; j++) {
            if (sc[j] == '\n') {
                flag = false;
                break;
            }
        }
        if (!flag) continue;
        memset(ans, 0, sizeof(ans));

        int st = 1;
        for (int cnt = 0; cnt < n; cnt++) {
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
                memset(&com[2], 0, sizeof(com)-2);
                for (int i = 0; handvalue(player) <= 21 && i < 20; ++i) {
                    if (handvalue(com) > 16)
                        break;
                    com[i+2] = randn(seed, st++);
                }
                int hp = handvalue(player);
                int hc = handvalue(com);
                //print(player);
                //print(com);
                //fprintf(stderr, "hp = %d, hc = %d\n", hp, hc);
                
                rs = result(hp, hc);
                if (rs == target[cnt]) {
                    //printf("%d: %s\n", cnt, rs == 1 ? "win" : (rs == -1 ? "fail" : "draw"));
                    done = true;
                    break;
                } else if (rs == target[cnt] + 1 && rs == -1) {
                    done = true;
                    st += 3;
                    break;
                }
            }
            if (!done) {
                //printf("cannot find solution, cnt = %d\n", cnt);
                if (cnt > max) {
                    max = cnt;
                    fprintf(stderr, "new max = %d\n", max);
                }
                break;
            } else {
                ans[cnt] = h;
                if (handvalue(player) > 21) {
                    ans[cnt] = -h;
                }
                res[cnt] = rs;
            }
            if (cnt == n - 1) {
                fprintf(stderr, "seed = %d, st = %d\n", seed, st);
                printf("%d\n", seed);
                for (int i = 0; i < n; i++) {
                    printf("%d\n", ans[i]);
                }
                fprintf(stderr, "score = %d-------------------\n", score);
                rest(score, seed, st);
                return 0;
                printf("\n");
                for (int i = 0; i < n; i++) {
                    printf("%d ", res[i]);
                }
                printf("\n");
                return 0;
            }
        }
    }
    return 0;
}

