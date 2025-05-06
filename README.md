# Hands-on 3: Construcción de Analizadores Sintácticos y Validación de Expresiones

Este proyecto tiene como objetivo construir analizadores sintácticos para validar expresiones aritméticas y lógicas, utilizando herramientas como BNF, C, Python, Bison y Flex. No es necesario utilizar una IDE, ya que se pueden usar editores de texto simples.

## Herramientas Utilizadas

- **BNF (Backus-Naur Form):** Notación para definir la sintaxis de los lenguajes de programación.
- **C y Python:** Lenguajes de programación utilizados para implementar los analizadores.
- **Bison:** Herramienta para la construcción de analizadores sintácticos.
- **Flex:** Herramienta para el análisis léxico.
- **Editor de texto:** No es necesario usar una IDE.

## Instalación en Windows

1. **Instalar MSYS2:**
   - Descargar e instalar MSYS2 desde [https://www.msys2.org/](https://www.msys2.org/).
   - Abrir la terminal de MSYS2 y actualizar los paquetes con el siguiente comando:
     ```bash
     pacman -Syu
     ```
   - Instalar las herramientas necesarias:
     ```bash
     pacman -S mingw-w64-x86_64-gcc mingw-w64-x86_64-bison mingw-w64-x86_64-flex python
     ```

2. **Verificar la instalación:**
   - Ejecutar los siguientes comandos para asegurarte de que las herramientas están instaladas correctamente:
     ```bash
     bison --version
     gcc --version
     python --version
     ```

## Ejemplos de Implementación

### Ejemplo Básico en C

Se construye un analizador sintáctico básico en C para validar expresiones aritméticas, utilizando los archivos `validar.y` y `validar.l`.

- **Archivo `validar.y`:** Define la gramática en BNF.
- **Archivo `validar.l`:** Define las expresiones regulares para el análisis léxico.
  
**Compilación y Ejecución:**
```bash
bison -d validar.y
flex validar.l
gcc lex.yy.c y.tab.c -o validar -lm
./validar
