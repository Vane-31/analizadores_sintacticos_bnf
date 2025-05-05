%{
#include "val_logica.tab.h"
int yywrap() { return 1; }
%}

%%
"AND"       { return AND; }
"OR"        { return OR; }
"NOT"       { return NOT; }
[01]        { yylval = atoi(yytext); return BOOLEAN; }
[ \t]       ;
[\n]        { return '\n'; }
"("         { return '('; }
")"         { return ')'; }
.           { return yytext[0]; }
%%
