%{
int nchar, nline, nword;
int totnchar = 0;
int totnline = 0;
int totnword = 0;
%}
%%

\n {++nchar; ++nline;}
[ \t\n]+ {++nword, nchar +=yyleng;}
. ++nchar;
%%
int main(int argc, char **argv)
{
	int i = 0;
	if(argc < 2){
		if(!(yyin = fopen(argv[1], "r"))){
                        perror(argv[1]);
                        return (1);
                }
	}
	else{
        for(i=1; i < argc; ++i){
		FILE *f = fopen(argv[i], "r");
		if(!f){
			printf("error\n");
		}
		yyrestart(f);
		yylex();
		fclose(f);
		totnchar += nchar;
		totnline += nline;
		totnword += nword;
		printf("%d\t%d\t%d\n", nchar, nword, nline);
		nchar = nword = nline = 0;
                }

        
       
        printf("%d\t%d\t%d\n",totnchar, totnword, totnline);
	return 0;
	}
}

