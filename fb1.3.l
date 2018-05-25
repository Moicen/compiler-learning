%{
#include "fb1.3.tab.h"
%}
%%
"+"    { return ADD; }
"-"    { return SUB; }
"*"    { return MUL; }
"/"    { return DIV; }
"|"    { return ABS; }
"&"    { return AND; }
"||"    { return OR; }
"~"    { return NOT; }
[0-9]+ { yylval = atoi(yytext); return NUMBER; }
0x[a-f0-9]+ { yylval = strtol(yytext, NULL, 16); return NUMBER; }
\n     { return EOL; }
[ \t]  { /*ignore whitespace */ }
"("    { return OP; }
")"    { return CP; }
"//".* /* ignore comments */
.      { printf("Mystery character %c\n", *yytext); }
