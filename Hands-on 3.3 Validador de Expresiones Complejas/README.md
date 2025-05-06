## 📐 Gramática (BNF)

El analizador está basado en la siguiente gramática libre de contexto en forma BNF:

<expr> ::= <expr> + <term> | <expr> - <term> | <term>
<term> ::= <term> * <factor> | <term> / <factor> | <factor>
<factor> ::= ( <expr> ) | <logical>
<logical> ::= <logical> AND <term> | <logical> OR <term> | NOT <factor> | BOOL

Esta gramática permite:
- Expresiones aritméticas con suma, resta, multiplicación y división.
- Expresiones lógicas con operadores `AND`, `OR`, `NOT` y valores booleanos (`1` o `0`).
- La anidación y combinación de ambos tipos de expresiones.

---

## 📁 Archivos del Proyecto

- `analizador.y`: archivo Bison con las reglas sintácticas y semánticas.
- `analizador.l`: archivo Flex para el análisis léxico (reconocimiento de tokens como números, operadores y booleanos).
- `README.md`: este archivo.
- `Makefile` (opcional): para automatizar la compilación.

---

## ⚙️ Instrucciones de Compilación y Ejecución

### 🔧 Compilación

Desde la terminal, ejecuta:
bison -d analizador.y
flex analizador.l
gcc analizador.tab.c lex.yy.c -o analizador
▶️ Ejecución
./analizador
Se te pedirá ingresar expresiones una por una. El programa evaluará cada una e imprimirá el resultado si es válida, o un mensaje de error si es inválida. Escribe salir para finalizar el programa.

🧪 Ejemplos de Entrada y Salida
Entrada	Salida
(4 + 5) * (2 AND 1)	Expresion valida. Resultado: 9
(2 AND 3) / (4 - 1	Expresion invalida
NOT (1 + 2)	Expresion valida. Resultado: 0
((3 * 2) + 1) AND (1 OR 0)	Expresion valida. Resultado: 1
