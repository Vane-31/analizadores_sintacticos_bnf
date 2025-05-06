%option noyywrap
%{
#include "analizador.tab.h"
%}

%%

[0-9]+      { yylval.val = atoi(yytext); return BOOL; }
"AND"       { return AND; }
"OR"        { return OR; }
"NOT"       { return NOT; }
"("         { return '('; }
")"         { return ')'; }
"+"         { return '+'; }
"-"         { return '-'; }
"*"         { return '*'; }
"/"         { return '/'; }
[ \t\n]+    { /* ignorar espacios */ }
.           { return yytext[0]; }

%%

