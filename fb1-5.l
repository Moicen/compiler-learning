%{
#include "fb1-5.tab.h"
int yylval;
%}
%%
"+"    { return ADD; }
"-"    { return SUB; }
"*"    { return MUL; }
"/"    { return DIV; }
"|"    { return ABS; }
[0-9]+ { yylval = atoi(yytext); return NUMBER; }
\n     { return EOL; }
[ \t]  { /*ignore whitespace */ }
"("    { return OP; }
")"    { return CP; }
"//".* /* ignore comments */
.      { printf("Mystery character %c\n", *yytext); }
<<<<<<< HEAD
%%
=======
%%
>>>>>>> 6fed1dad8b946989026336977b3a0b330c644722
