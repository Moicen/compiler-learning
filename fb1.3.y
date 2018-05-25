/* simplest version of calculator */
%{
#include <stdio.h>
%}

/* declare tokens */
%token NUMBER
%token ADD SUB MUL DIV ABS
%token EOL
%token OP CP
%token AND OR NOT

%%

calclist: /* nothing */
 | calclist exp EOL { printf("= %d(0x%x)\n> ", $2, $2); }
 | calclist EOL { printf("> "); }
 ;

 exp: factor
 | exp ADD factor { $$ = $1 + $3; }
 | exp SUB factor { $$ = $1 - $3; }
 ;

factor: logical
 | factor MUL logical { $$ = $1 * $3; }
 | factor DIV logical { $$ = $1 / $3; }
 ;

logical: term
 | logical AND term { $$ = $1 & $3; }
 | logical OR term { $$ = $1 | $3; }
 | NOT logical { $$ = ~$2; }
 ;

term: NUMBER
 | ABS term { $$ = $2 >= 0 ? $2 : - $2; }
 | OP exp CP { $$ = $2; }
;

%%

main(int argc, char **argv)
{
  printf("> ");
  yyparse();
}

yyerror(char *s)
{
  fprintf(stderr, "error: %s\n", s);
}
