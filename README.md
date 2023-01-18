# parallel-demo
Demonstration and practice code for a tutorial on the parallel programming frameworks
OpenMP and MPI. The files ending with '.sbatch.sh' are Slurm batch submission files.

## Required modules
Make sure you have done the equivalent of the following:
    module load 2022
    module load OpenMPI/4.1.4-GCC-11.3.0



## Hello world

File: hello.c
Simple 'Hello world' program to check that sequential compilation works.

## OpenMP

File: hello-omp.c
Simple 'Hello world' program with OpenMP multi-threading.

File: primes-omp.c
Count the number of primes in a given range of integers (the range is hard-coded in the program).
As provided this is a sequential program, but add one or two OpenMP annotations to it, and you have
a parallel program!

## MPI

File: primes-mpi.c
Another way to count primes, this times parallelized with MPI.

File: stencil-mpi.c
A stencil computation using MPI.