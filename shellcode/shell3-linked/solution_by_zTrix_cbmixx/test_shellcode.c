#include <stdio.h>
#include <stdint.h>
#include <stdlib.h>

typedef struct _llist {
    struct _llist *next;
    uint32_t tag;
    char data[100];
} llist;

char *(*func)();
char * ans;

char * user(llist * head) {
    llist * p = head;
    while (p -> tag != 0x41414100) {
        p = p->next;
    }
    return p->data;
}

int main(int argc, char * argv[]) {
    llist * header = (llist *)malloc(sizeof(llist));
    llist * p = header;
    int i;
    int ph[100] = {1, 1};
    for (i = 2; i < 100; i++) {
        ph[i] = ph[i-1] + ph[i-2];
    }
    
    char * buffer = (char *)malloc(4096);
    if (argc > 1) {
        FILE * f = fopen(argv[1], "r");
        int read = fread(buffer, 1, 4096, f);
        fclose(f);
        func = (char *(*)(llist *))buffer;
        fprintf(stderr, "testing user function, len = %d\n", read);
    } else {
        func = user;
        fprintf(stderr, "testing c function\n");
    }
    srand(time(NULL));
    int len = rand() % 100;
    for (i = 0; ; i++) {
        p->tag = 0x41414100 - len + i;
        p->data[0] = 'a' + i;
        p->data[1] = 0;
        p->next = (llist *)malloc(sizeof(llist));
        if (p->tag == 0x41414100) {
            ans = p->data;
            break;
        }
        p = p->next;
    }
    
    char * ret = func(header);
    if (ret == ans) {
        printf("[ PASS ] ans == ret == %p\n", ans);
        printf("%s\n", user(header));
    } else {
        printf("[ FAIL ] ans = %p, ret = %p\n", ans, ret);
    }
    return 0;
}

