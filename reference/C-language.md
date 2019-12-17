# The C language

A quick reference of the C language constructs that are relevant for this tutorial.
What we show here is C code that adheres to the 1999 version of the C standard, usually called 'C99'.


## Basics

A C program consists of variable declarations an function declarations.

In general a C program can span multiple source files, in this tutorial everything is in
a single file, except for functions from various support libraries.

### The preprocessor

Before a C program is compiled, it is first processed by the *preprocessor*, a program that
rewrites the input text into intermediate text. For this tutorial the relevant preprocessor
directives are:

```c
#include <file.h>
```

Where `file.h` is the name of a library header file.

Some frequently used library header files:

File | Content
--- | ---
`stdio.h` | The standard I/O library. Contains the `printf()` function
`stdbool.h` | Definitions for the Boolean type (`bool`)
`math.h` | Functions on floating-point numbers, such as `sin()`, `exp()`, and `sqrt()`
`omp.h` | The OpenMP library


```c
#pragma <type> <hint>
```

Where `<type>` is the type of pragma, and `<hint>` is the hint we want to give to the compiler.
Relevant `<type>` values are:

type | User
:--- | :----
`GCC` | The Gnu C compiler (gcc)
`OMP` | Any compiler supporting OpenMP
`STDC` | Any compiler supporting the 1999 version of the C standard


## Types

name     | printf format | bits | description
-------  | ------------: | ---: | ----
int      |  %d           | 32   | integer
long int | %ld           | 64   | long integer
char     | %c            |  8   | character
float    | %f            | 32   | floating-point number (IEEE 754-1985)
double   | %f            | 64   | floating-point number (IEEE 754-1985)
char *   | %s            | 64   | pointer to char (strings are char arrays ending with '\0' character)


**Disclaimer**: the C standard does not dictate the exact number of bits in a type, the values shown above are just
for `normal’ systems. It is allowed to have a 9-bit char, a 48-bit int, or a double with a different floating-point
representation, although this is mostly historic or for exotic processors.  

For historical reasons, an empty parameter list denotes that a function has an unspecified
parameter list. To indicate that there are zero parameters, the keyword `void`
should be used. For example:
```c
int return_two(void) {
    return 2;
}
```

## Constants

Integer constants are written in the obvious way: `0`, `1234`, `-76`. Hexadecimal constants
are also allowed: `0xff` is the same value as `255`. Long integers can be written explicitly by
adding a 'L' at the end: '0L', '12345678L', `-3L`, `0x1234567890ABCDEFL`.

Character constants are written by surrounding a single letter with single quotes: `'a'`, `'B'`,
`'0'`, `'$'`, `']'`.

## Arrays and pointers

Array types are written as `<type> <var>[<size>]`, where `<size>` is a constant. Examples: `int t[9]`, `char *w[6]`.
`<size>` can also be an expression, but it must be possible to compute it during compilation. Example: `int a[2*5]`.
Accessing elements also uses `[ ]`:
```c
int a[10];
a[0] = 1;
for (int i=1; i<10; i++)
    a[i] = 2 * a[i-1];
```

Pointers are typed addresses, with the type written as `<type> *`. Examples: `int *`, `char **`.
You can do arithmetic on pointers: `p + 1` points to the next element after the one `p` points to.

Array variables are almost pointers, but they have a fixed value.

Accessing elements uses `*` or `[ ]':

```c
int a[10];
a[0] = 1;
int *p = a+1;
for (int i=1; i<10; i++){
    *p = *(p-1);
    p = p + 1;
}
```

Or:

```c
int a[10];
int *p = a;
*p++ = 1;
for (int i=1; i<10; i++)
    *p++ = p[-1];
```

## Strings

Strings don't have a special type, they are `const char *`. Strings end with a '\0' character.

For example, the string:
```c
const char *greeting = "Hello";
```
defines a pointer to an array of characters:

`greeting` -> | `H` | `e` | `l` | `l` | `o` | `\0` |

## The printf() function

The function `printf()` prints a string to the standard output, with format strings replaced by the value of extra
parameters. Example:
```c
printf(“The square root of %d is %.4f\n”, 3, sqrt(3));
```
Output:
```
The square root of 3 is 1.7321
```
Example:
```c
printf(“%d is %s\n”, 3, ((3 % 2) == 0) ? “even” : “odd”);
```
Output:
```
3 is odd
```
Use `%%` to get a single `%`.

## The main() function

```c
int main(void)
{
    return 0;
}
```

A C compiler recognizes a few other types of `main()` function as well, but that is beyond this tutorial.

## The #pragma annotations

## Compiling and running a C program

## Further reading