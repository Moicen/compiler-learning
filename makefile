fb:fb1.3.l fb1.3.y
	bison -d fb1.3.y
	flex fb1.3.l
	gcc -o $@ fb1.3.tab.c lex.yy.c -lfl
