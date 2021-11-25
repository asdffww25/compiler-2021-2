%{
int nchar, nline, nword;
%}
%%

\n {++nchar; ++nline;}
[ \t\n]+ {++nword, nchar +=yyleng;}
. ++nchar;
%%
int main(int argc, char **argv)
{
	if(argc > 1){
		if(!(yyin = fopen(argv[1], "r"))){
			perror(argv[1]);
			return (1);
			}
		}

        yylex();
        printf("%d\t%d\t%d\n",nchar, nword, nline);
        return 0;
}

