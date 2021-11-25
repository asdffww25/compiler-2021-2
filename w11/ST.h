#include <string.h>
#include <stdlib.h>
struct symrec{
	char *name;
	struct symrec *next;
};

typedef struct symrec symRec;
symRec *sym_table = (symRec *) 0;

symRec *putsym(char *sym_name){
	symRec *ptr;
	ptr = (symRec *) malloc (sizeof(symRec));
	ptr->name = (char *) malloc (strlen(sym_name)+1);

	strcpy(ptr->name, sym_name);
	ptr->next = (struct symrec *)sym_table;
	sym_table = ptr;
	return ptr;
}

symRec *getsym(char *sym_name){
	symRec *ptr;
	for(ptr = sym_table; ptr!=(symRec *) 0; ptr = (symRec *)ptr->next){
		if(strcmp(ptr->name, sym_name) == 0)
			return ptr;
	}
	return 0;
}

