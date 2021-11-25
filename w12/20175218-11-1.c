#include <stdio.h>
#include <string.h>
#include "SM.h"
#include <stdlib.h>

int main(int argc, char *argv[]){
	char buffer[BUFSIZ];
	FILE *fd = fopen(argv[1], "r");
	char s1[30];	
	int data;
	int size = sizeof(op_name)/sizeof(char*);
	for(int i = 0; i < 27; i++){
		fgets(buffer,sizeof(buffer), fd);
		sscanf(buffer ,"%s %d", s1, &data );
		code[i].arg = data;
		for(int j = 0; j<size; j++){
			int a = strcmp(s1, op_name[j]);
			if(a == 0){
				code[i].op = j;
			}
		}
//		printf("name = %s, data = %d\n", s1, data);
	}
/*	for(int i = 0; i<27; i++){
		printf("code[%d] : %d \targ[%d] : %d\n", i,code[i].op,i,code[i].arg );
	}
*/
	fetch_execute_cycle();
	fclose(fd);
	return 0;
}

