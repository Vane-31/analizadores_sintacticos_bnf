# Validador de Expresiones Lógicas

Este proyecto implementa un validador de expresiones lógicas utilizando **Bison** y **Flex**. El validador es capaz de analizar expresiones que incluyen operadores lógicos como **AND**, **OR**, **NOT**, y valores booleanos **0** y **1**. El programa valida expresiones lógicas y reporta si son correctas o contienen errores de sintaxis.

## Requisitos

- **Bison**: Herramienta para el análisis sintáctico.
- **Flex**: Herramienta para el análisis léxico.
- **GCC**: Compilador para compilar el código generado por Bison y Flex.

## Archivos

El proyecto consta de dos archivos principales:

1. **val_logica.y**: Definición de la gramática con Bison.
2. **val_logica.l**: Definición de las reglas léxicas con Flex.

## Instrucciones de compilación

1. **Compilar con Bison y Flex**:
   ```bash
   bison -d val_logica.y
   flex val_logica.l
   gcc lex.yy.c val_logica.tab.c -o val_logica -lm
Ejecutar el programa:

./val_logica
El programa te pedirá que ingreses una expresión lógica y te indicará si la expresión es válida o no.

Ejemplos de uso
Expresiones válidas
Entrada: (1 AND 0) OR (NOT 1)
Salida: Expresión válida

Entrada: NOT (1 OR 0) AND 1
Salida: Expresión válida

Entrada: (1 AND 1) OR 0
Salida: Expresión válida

Entrada: 1 AND NOT 0
Salida: Expresión válida

Expresiones inválidas
Entrada: (1 AND (0 OR 1)
Salida: Expresión inválida

Entrada: 1 OR OR 0
Salida: Expresión inválida

Descripción de la gramática
La gramática utilizada para el análisis de las expresiones lógicas es la siguiente:

<expr>   ::= <expr> AND <term> | <expr> OR <term> | <term>
<term>   ::= NOT <factor> | <factor>
<factor> ::= ( <expr> ) | BOOLEAN
Notas
Los operadores lógicos son AND, OR y NOT.

Los valores booleanos permitidos son 0 (falso) y 1 (verdadero).

Los paréntesis se utilizan para agrupar expresiones.
