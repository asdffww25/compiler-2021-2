%{
#include <stdio.h>
%}

%token LET IN END
%token INTEGER IDENTIFIER
%token SKIP IF THEN ELSE FI WHILE DO READ WRITE NUMBER
%token . , ; := = ( ) + - * / ^ < > 
%%
program: LET [ declarations ] IN command_sequence END

declarations: INTEGER [ id_seq ] IDENTIFIER .

id_seq: id_seq... IDENTIFIER ,

command_sequence: command... command

command: SKIP
       |IDENTIFIER := expression|IF exp THEN command_sequence ELSE command_sequence FI|WHILE exp DO command_squence END|READ IDENTIFIER|WRITE expression;

expression: NUMBER | INDENTIFIER|'(' expression ')'|
%%
