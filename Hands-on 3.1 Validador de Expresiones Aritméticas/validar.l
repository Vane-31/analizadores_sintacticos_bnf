%{
#include "validar.tab.h"

// Solución al error de yywrap
int yywrap() { return 1; }
%}
%%
[0-9]+          { yylval = atoi(yytext); return NUMBER; }
[ \t]           ;
[\n]            { return '\n'; }
[+\-*/()]       { return yytext[0]; }
.               { return yytext[0]; }
%%


