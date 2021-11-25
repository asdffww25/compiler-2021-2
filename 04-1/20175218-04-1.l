%{
#include "04-3.tab.h"
%}
%%
"+"	{return ADD;}
"-"	{return SUB;}
"*"	{return MUL;}
"/"	{return DIV;}
"%"	{return REM;}
[0-9]+	{yylval = atoi(yytext);
	return NUMBER;}
\n	{return EOL;}
[ \t]	{/*whitespace ignore*/}
.	{printf("no %c\n", *yytext);}
%%
