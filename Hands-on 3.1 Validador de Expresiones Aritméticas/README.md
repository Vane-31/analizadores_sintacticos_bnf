# Validador de Expresiones Aritméticas

Este proyecto contiene un validador de expresiones aritméticas básicas (suma, resta, multiplicación y división) utilizando **Bison** y **Flex**. El validador verifica si las expresiones aritméticas son sintácticamente correctas de acuerdo con una gramática definida en **BNF (Backus-Naur Form)**.

## Objetivo

El objetivo del proyecto es construir un analizador sintáctico para validar expresiones aritméticas básicas. El analizador valida operaciones como:

- Suma (`+`)
- Resta (`-`)
- Multiplicación (`*`)
- División (`/`)

El validador es capaz de identificar expresiones correctas e incorrectas basándose en las reglas de la gramática.

## Gramática BNF

La gramática utilizada para este validador está definida en BNF de la siguiente manera:

<expr> ::= <expr> + <term> | <expr> - <term> | <term>
<term> ::= <term> * <factor> | <term> / <factor> | <factor>
<factor> ::= ( <expr> ) | NUMBER

- **<expr>** representa una expresión, que puede ser una suma o resta de términos.
- **<term>** representa un término, que puede ser una multiplicación o división de factores.
- **<factor>** representa un número o una expresión entre paréntesis.

## Archivos

Este proyecto está compuesto por los siguientes archivos:

- `validar.y`: Archivo de **Bison** que define la gramática y las acciones semánticas del analizador.
- `validar.l`: Archivo de **Flex** que define el análisis léxico, o sea, la conversión de la entrada en tokens.
- `Makefile`: (si decides crear uno) Archivo para automatizar la construcción del programa.
- `README.md`: Este archivo con información del proyecto.

## Cómo ejecutar

Para ejecutar el programa en tu sistema, sigue estos pasos:

1. **Instala Bison y Flex** si no los tienes instalados. En sistemas basados en Linux, puedes hacerlo con:
sudo apt-get install bison flex

markdown
Copiar
Editar

2. **Compila el programa**. Abre una terminal y navega al directorio donde están los archivos del proyecto. Luego, ejecuta los siguientes comandos:

Primero, genera los archivos de Bison y Flex:
```bash
bison -d validar.y
flex validar.l
Luego, compila los archivos generados con GCC:

gcc validar.tab.c lex.yy.c -o validador
Ejecuta el validador:

./validador
Prueba el validador: Puedes probar varias expresiones aritméticas como:

(4 + 5) * 2

3 - (2 + 1)

5 * (3 + 2)

7 / (2 - 1)

El programa te indicará si la expresión es válida o no.

Ejemplos
Entrada 1:
(4 + 5) * 2
Expresión válida
Entrada 2:
3 - (2 + )
Expresión inválida
