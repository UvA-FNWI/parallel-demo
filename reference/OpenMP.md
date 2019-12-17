# OpenMP

A quick reference of the OpenMP constructs that are relevant for this tutorial

## Basics

In all files referencing OpenMP functions, the following line is needed:

```c
#include <omp.h>
```

### #pragma annotations

```c
#pragma omp atomic
```

The pragma should be followed by an *update* statement. This statement will be executed atomically. The update statement
is one of: `x <op>= <expr>;`, where `<op>` is one of the operators `+`, `-`, `*`, `/`, `%`, `&`, `|`,
`&&`, `||`, `<<`, or `>>`.

Example:
```c
#pragma atomic
total += local_sum;
```

```c
#pragma omp master
```

The subsequent structured block is executed only by the master thread of the team.

### Helper functions and variables

```c
int omp_get_max_threads(void)
```

Returns the number of threads used by OpenMP.

```shell script
OMP_NUM_THREADS
```

An environment variable. If set when the program is started, this specifies the maximum number
of threads that can be used by OpenMP.

## Types


## Compiling and running an OpenMP program

## Further reading