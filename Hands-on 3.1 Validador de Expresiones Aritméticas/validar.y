// validar.y
%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// Declaración de funciones necesarias
int yylex(void);
int yyerror(char *s);

// Declaración del tipo y funciones para manejar buffers de Flex
typedef struct yy_buffer_state *YY_BUFFER_STATE;
extern YY_BUFFER_STATE yy_scan_string(const char *str);
extern void yy_delete_buffer(YY_BUFFER_STATE buffer);
%}

%token NUMBER
%left '+' '-'
%left '*' '/'
%right UMINUS

%%

input:
    expr '\n'           { printf("Expresion valida\n"); }
  | error '\n'          { yyerror("Expresion invalida"); yyerrok; yyclearin; }
;

expr:
    expr '+' expr
  | expr '-' expr
  | expr '*' expr
  | expr '/' expr
  | '-' expr %prec UMINUS
  | '(' expr ')'
  | NUMBER
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

        yy_delete_buffer(buffer); // Importante: liberar el buffer después de cada entrada
    }

    return 0;
}

