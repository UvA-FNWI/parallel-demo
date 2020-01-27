# Message Passing Interface (MPI)

A quick reference of the Message Passing Interface (MPI) constructs that are relevant for this tutorial.

## Basics

A program using MPI code has to add a line
```c
#include <mpi.h>
```
to the top of the source file, and add `-lmpi` to the compiler flags.

## Communicators, rank

Every MPI process belongs to one or more communication groups. The default communication group, called
`MPI_COMM_WORLD` contains all processes that participate in the computation. The communication group is passed
to almost all MPI functions.

Each group has a size (the total number of processors in the group), and all processors in the group

The following code can be used to get the rank and size:
```c
int rank, size;
MPI_Comm_rank(MPI_COMM_WORLD, &rank);
MPI_Comm_size(MPI_COMM_WORLD, &size);
```

## Send and receive

```c
double vector[SZ];
MPI_Status status;
MPI_Send(vector, SZ, MPI_Double, 2, 0, MPI_COMM_WORLD);
MPI_Recv(vector, SZ, MPI_Double, MPI_ANY_SOURCE, 0, MPI_COMM_WORLD, &status);
```

The `MPI_Send()` and `MPI_Recv()` functions are used to send and receive data.
For `MPI_Recv()` the sending rank may be `MPI_ANY_SOURCE`, which indicates data from any
sender will be accepted. The actual sender is put in a field in `&status`.
Similarly, receiver may specify `MPI_ANY_TAG`, tag is put in a field in status.

For small messages `MPI_Send()` will return immediately, for large messages an `MPI_Recv()` is needed to accept the
data before `MPI_Send()` returns.

## Combined Send/Receive

```c
double vector1[SZ], vector2[SZ];
MPI_Status status;
MPI_Sendrecv(vector1, SZ, MPI_Double, 2, 0,
             vector2, SZ, MPI_Double, 2, 0, MPI_COMM_WORLD, &status);
```

Here the send and receive are combined in one call.
The ordering of the operations is left to the implementation. This may avoid deadlock!
Send and receive buffers cannot overlap.
Source and destination may be different, also size and even data type.

## Collective communication patterns

The combined send/receive operation is the first *collective* communication function. There are more:
- Reduction: apply a reduction operator such as addition or max() to an array of data distributed over the members of a group.
- Broadcast: send the same data from one member to all members of a group
- Scatter: send a different piece of data from one member to all members of a group
- Gather: collect on one member all the different pieces of data that members of the group have
- AllGather: collect on all members all the different piece of data that all members of a group have


## Running an MPI program

To run an MPI program in SLURM or similar batch systems, it is best to just use a special helper program `mpirun`.
For example:
```shell script
#!/bin/bash -e
#SBATCH -t 10:00 -N 1 --mem=100M

mpirun ./primes-mpi
```

## Further reading

There are two main MPI implementations:

- Open MPI, see [https://open-mpi.org]
- MPICH, see [https://mpich.org]

See their websites for the official reference documentation of the MPI library.