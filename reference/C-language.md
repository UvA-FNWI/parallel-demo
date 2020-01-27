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
`mpi.h` | The MPI library

```c
#define <name> <replacement>
```
Where `<name>` is a name token, and `<replacement>` is a replacement string that is itself
also subject to `#define` replacement. All occurrences of the `<name>` token are replaced
by the token sequence in `<replacement>`. By convention `<name>` is completely in CAPITALS,
for example:

```c
#define ITERATIONS (25)
```

It is a good habit to surround numbers and numerical expressions with `()` to avoid unexpected
parsings of the token string. Consider for example:

```c
#define A 100
#define B -25
int x = A B;
```
is perfectly legal C, and inititialises `x` with the value 75, but this is almost certainly not
what the programmer intended.

```c
#pragma <type> <hint>
```

Where `<type>` is the type of pragma, and `<hint>` is the hint we want to give to the compiler.
Relevant `<type>` values are:

type | User
:--- | :----
`GCC` | The Gnu C compiler (gcc)
`OMP` | Compilers supporting OpenMP
`STDC` | Compilers supporting the 1999 version of the C standard


## Types

name     | bits | description
-------  | ---: | ----
int      | 32   | integer
long int | 64   | long integer
char     |  8   | character
bool     |  8   | Boolean
double   | 64   | floating-point number
void     |  -   | The 'void' type
char *   | 64   | pointer to char (strings are char arrays ending with '\0' character)
void *   | 64   | pointer to any type of data


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
`'0'`, `'$'`, `']'`. Some character sequences starting with a backslash have a special meaning.
They are called 'escape sequences', and the starting backslash is called the 'escape character'.

character | ASCII value | description
:-------- | ----------: | -----
'\0'      | 0           | Null
'\a'      | 7           | Bell
'\b'      | 8           | Backspace
'\t'      | 9           | Tab
'\n'      | 10          | New line: the portable C way to start a new line, even on systems that natively require something else
'\r'      | 13          | Carriage return
'\\\\'    | 92          | A single backslash

The same escape sequences can also be used in strings:

```c
"Hello world\n"
```
ends the string with a new line.

Floating point `double` constants are written like `10.2`, `-3.14159`, `1.2e3`, `3e-2`.

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
The unary `&` operator takes the address of an assignable expression, and to access the element that the pointer
points to, use the unary `*`:

```c
int var = 22;
int *p = &var;
*p += 2 * 3;
```
results in `var` having the value 28. Note the two different ways that the `*` operator is used:
for pointer dereferencing, and for multiplication.

Array variables are almost pointers, but they have a fixed value, and the `[ ]' operator is also
allowed on pointers:

```c
int a[10];
int *p = a;
*p++ = 1;
for (int i=1; i<10; i++)
    *p++ = p[-1];
```

Or equivalently:

```c
int a[10];
a[0] = 1;
int *p = a+1;
for (int i=1; i<10; i++){
    *p = *(p-1);
    p = p + 1;
}
```

## Strings

Strings don't have a special type, they are `char *`. Strings end with a '\0' character.

For example, the string:
```c
const char *greeting = "Hello";
```
defines a pointer to an array of characters:

`greeting` -> | `H` | `e` | `l` | `l` | `o` | `\0` |

## The printf() function

The function `printf()` prints a string to the standard output, with format strings replaced by the value of extra
parameters. Most important format strings:

name     | printf format |  description
-------  | ------------: | ----
int      |  %d           | integer
long int | %ld           | long integer
char     | %c            | character
double   | %f            | floating-point number (IEEE 754-1985)
char *   | %s            | pointer to char (strings are char arrays ending with '\0' character)


Example:
```c
printf(“The square root of %d is %f\n”, 3, sqrt(3));
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
int main()
{
    return 0;
}
```

A C compiler recognizes a few other types of `main()` function as well, but that is beyond this tutorial.

## Compiling and running a C program

To compile a program `hello.c` to an executable file `hello`, use:
```shell script
gcc hello.c -o hello
```
The resulting program can then be run with:
```shell script
./hello
```
You need the `./` in front because for security reasons the current directory is not in the search path.

It is recommended to let the compiler generate some warnings about questionable program code. A good start is:
```shell script
gcc -W -Wall hello.c -o hello
```
Note that for the workshop a set of rules for the `make` program is provided, so for the example program you can simply
something like:
```shell script
make hello
```
And the compiler will be run with the proper flags.