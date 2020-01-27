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

```c
double omp_get_wtime(void);
```

Returns the elapsed wall clock time in seconds. The reference time (0.0) is an unspecified time in the past. Thus, only
time differences are useful. Typical use pattern:
```c
double start = omp_get_wtime(); 
// work to be timed ... 
double finish = omp_get_wtime(); 
printf("Work took %.2f seconds\n", finish - start);

```

```shell script
OMP_NUM_THREADS
```

An environment variable. If set when the program is started, this specifies the maximum number
of threads that can be used by OpenMP.

## Types


## Compiling and running an OpenMP program

An OpenMP program can be run like any sequential program. By default all the cores of the processor are used.
If the environment variable `OMP_NUM_THREADS` is defined, that specifies the number of threads to use. It is also
possible to set the number of threads from within the program.

## Further reading

The official OpenMP website is at: [https://openmp.org]