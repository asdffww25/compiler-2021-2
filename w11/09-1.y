%{
#include <stdio.h>
#include "ST.h"
extern int yylex();
void yyerror(char *);
int errors;
void install(char *sym_name){
	symRec *s;
	s = getsym(sym_name);
	if( s == 0)
		s = putsym(sym_name);
	else{
		printf("%s error\n", sym_name);
	}
}
void context_check(char *sym_name){
	if(getsym(sym_name) == 0)
		printf("%s no\n", sym_name);
}
%}
%union{
	int intval;
	char *id;
};	
%start program

%token LET INTEGER IN ASSGNOP
%token SKIP IF THEN ELSE END WHILE DO READ WRITE
%token <intval> NUMBER
%token FI
%token <id> IDENTIFIER
%left '-' '+'
%left '*' '/'
%right '^'
%%
program : LET declarations IN command_sequence END { YYACCEPT; }
;

declarations : /* empty */ | INTEGER id_seq IDENTIFIER '.' { install( $3 ); }
;

id_seq : /* empty */ | id_seq IDENTIFIER ',' { install( $2 ); }
;

command_sequence : /* empty */ | command_sequence command ';'
;

command : SKIP
	| IDENTIFIER ASSGNOP expression { context_check( $1 ); }
	| IF expression THEN command_sequence ELSE command_sequence FI
	| WHILE expression DO command_sequence END
	| READ IDENTIFIER { context_check( $2 ); }
	| WRITE expression
;

expression : NUMBER | IDENTIFIER { context_check( $1 ); } | '(' expression ')' | expression '+' expression | expression '-' expression | expression '*' expression | expression '/' expression | expression '^' expression | expression '=' expression | expression '<' expression | expression '>' expression
;
%%
int main(int argc, char *argv[]){
	extern FILE *yyin;
	yyin = fopen(argv[1], "r");
	errors = 0;
	yyparse();
	return 0;
}
void yyerror(char *s)
{
	printf("%s\n", s);
}

