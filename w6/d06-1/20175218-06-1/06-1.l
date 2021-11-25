%option noyywrap
%{
#include <string.h>
#include <stdlib.h>
enum yytokentype{
NUMBER = 256,
ADD = 257,
SUB = 258,
MUL = 259,
DIV = 260,
REM = 261,
EOL = 262,
LP = 263,
RP = 264
};
int yylval;
	
%}
%%
add	{return ADD;}
sub	{return SUB;}
mul	{return MUL;}
div	{return DIV;}
rem	{return REM;}
lp	{return LP;}
rp	{return RP;}
[0-9]+	{yylval = atoi(yytext);
	return NUMBER;}
\n	{return EOL;}
[ \t]	{/*whitespace ignore*/}
.	{return(yytext[0]);}
%%

int main()
{
	int tok = -1;
	while ((tok = yylex())){
		printf("%d %s\n", tok, yytext);
	}
	
	return 0;
}
