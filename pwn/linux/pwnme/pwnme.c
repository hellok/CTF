/*
	secuinside 2013 pwnme challenge by mongii
	$ gcc -o pwnme pwnme.c -pie -fno-stack-protector
	* remote bof with pie+aslr+nx on ubuntu 13.04
*/

#include <stdio.h> 
#include <stdlib.h> 
#include <errno.h> 
#include <string.h> 
#include <sys/types.h> 
#include <netinet/in.h> 
#include <sys/socket.h> 
#include <sys/wait.h> 

#define MYPORT 8181 
#define BACKLOG 100 
#define BUFSIZE 1024 

int sockfd, client_fd;
struct sockaddr_in my_addr;
struct sockaddr_in their_addr;
int sin_size;

void main(void)
{
	char buf[BUFSIZE];

        if ((sockfd = socket(AF_INET, SOCK_STREAM, 0)) == -1) {
            perror("socket");
            exit(1);
        }

        my_addr.sin_family = AF_INET;         
        my_addr.sin_port = htons(MYPORT);    
        my_addr.sin_addr.s_addr = INADDR_ANY;
        bzero(&(my_addr.sin_zero), 8);    

	int option=1;
	setsockopt(sockfd, SOL_SOCKET, SO_REUSEADDR, &option, sizeof(int)); 

        if (bind(sockfd, (struct sockaddr *)&my_addr, sizeof(struct sockaddr)) == -1) {
            perror("bind");
            exit(1);
        }

        if (listen(sockfd, BACKLOG) == -1) {
            perror("listen");
            exit(1);
        }

	printf("DEBUG : ready to accept..\n");

        while(1) {  
            sin_size = sizeof(struct sockaddr_in);
            if ((client_fd = accept(sockfd, (struct sockaddr *)&their_addr, &sin_size)) == -1) {
                perror("accept");
                continue;
            }

            printf("DEBUG : got connection from %s\n", inet_ntoa(their_addr.sin_addr));

            if (!fork()) { 
		send(client_fd, "what is your name? ", 19, 0);
	
		memset(buf, 0, sizeof(buf));
		recv(client_fd, buf, BUFSIZE+16, 0);
		send(client_fd, "nice to meet you!\n", 18, 0);

		printf("DEBUG : %s was here\n", buf);
		memset(buf, 0, sizeof(buf));
                close(client_fd);
		return 0;
            }
            else{
		close(client_fd);  
		while(waitpid(-1,NULL,WNOHANG) > 0); 
	    }
	}
}

