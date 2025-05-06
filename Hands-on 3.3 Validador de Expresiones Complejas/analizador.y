%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// Declaraciones externas necesarias
extern void yy_scan_string(const char *);
extern int yylex(void);
extern int yylex_destroy(void);
int yyerror(char *s);
int resultado;
%}

%union {
    int val;
}

%token <val> BOOL
%token AND OR NOT
%token '+' '-' '*' '/' '(' ')'

%type <val> expr term factor logical input

// Precedencia y asociatividad
%left OR
%left AND
%right NOT
%left '+' '-'
%left '*' '/'

%%

// Regla inicial
input: expr           { resultado = $1; }
     ;

expr: expr '+' term   { $$ = $1 + $3; }
    | expr '-' term   { $$ = $1 - $3; }
    | term            { $$ = $1; }
    ;

term: term '*' factor { $$ = $1 * $3; }
    | term '/' factor {
        if ($3 == 0) {
            yyerror("Division por cero");
            YYABORT;
        } else {
            $$ = $1 / $3;
        }
      }
    | factor          { $$ = $1; }
    ;

factor: '(' expr ')'  { $$ = $2; }
      | logical       { $$ = $1; }
      ;

logical: logical AND term  { $$ = $1 && $3; }
       | logical OR term   { $$ = $1 || $3; }
       | NOT factor        { $$ = !$2; }
       | BOOL              { $$ = $1; }
       ;

%%

int yyerror(char *s) {
    fprintf(stderr, "Error de sintaxis: %s\n", s);
    return 0;
}

int main() {
    char input[1024];

    while (1) {
        printf("Introduce una expresion (o escribe 'salir' para terminar):\n");
        if (fgets(input, sizeof(input), stdin) == NULL)
            break;

        input[strcspn(input, "\n")] = '\0';  // Eliminar salto de línea

        if (strcmp(input, "salir") == 0)
            break;

        yy_scan_string(input);  // Escanea la expresión
        if (yyparse() == 0)
            printf("Expresion valida. Resultado: %d\n", resultado);
        else
            printf("Expresion invalida\n");

        yylex_destroy();  // Limpia el búfer escaneado
    }

    return 0;
}


