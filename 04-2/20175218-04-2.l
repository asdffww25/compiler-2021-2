%{
#include "04-4.tab.h"
%}
%%
"+"     {return ADD;}
"-"     {return SUB;}
"*"     {return MUL;}
"/"     {return DIV;}
"^"	{return POW;}
[0-9]+  {yylval = atoi(yytext);
        return NUMBER;}
\n      {return EOL;}
[ \t]   {/*whitespace ignore*/}
.       {printf("no %c\n", *yytext);}
%%

