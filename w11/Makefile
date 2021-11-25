09-1: 09-1.l 09-1.y
	bison -d -o 09-1.tab.c 09-1.y
	flex -o 09-1.lex.c 09-1.l
	$(CC) -o 09-1 09-1.tab.c 09-1.lex.c 

clean:
	rm *.c *.h
