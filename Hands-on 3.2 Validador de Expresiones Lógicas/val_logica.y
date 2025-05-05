%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int yylex(void);
int yyerror(char *s);

// Para usar cadenas como entrada:
#define YY_BUF_SIZE 16384
typedef struct yy_buffer_state *YY_BUFFER_STATE;
extern YY_BUFFER_STATE yy_scan_string(const char *yy_str);
extern void yy_delete_buffer(YY_BUFFER_STATE b);
%}

%token BOOLEAN
%token AND OR NOT
%left OR
%left AND
%right NOT

%%

input:
    expr '\n'     { printf("Expresion valida\n"); }
  | error '\n'    { yyerror("Expresion invalida"); yyerrok; yyclearin; }
;

expr:
    expr AND term
  | expr OR term
  | term
;

term:
    NOT factor
  | factor
;

factor:
    '(' expr ')'
  | BOOLEAN
;

%%

int yyerror(char *s) {
    fprintf(stderr, "%s\n", s);
    return 0;
}

int main() {
    char input[1024];
    while (1) {
        printf("Ingrese una expresion: ");
        if (!fgets(input, sizeof(input), stdin)) break;

        YY_BUFFER_STATE buffer = yy_scan_string(input);
        if (yyparse() != 0)
            fprintf(stderr, "Error de analisis\n");
        yy_delete_buffer(buffer);
    }
    return 0;
}
