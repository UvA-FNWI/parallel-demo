EXECUTABLES=hello primes-omp primes-mpi stencil-mpi

EXPENSIVE_JUNK += $(EXECUTABLES)

SRC = hello.c primes-omp.c primes-mpi.c stencil-mpi.c

JUNK +=

CFLAGS += -O3 -Wall -W --std=c11 -lm
OMP_CFLAGS = $(CFLAGS) -fopenmp
MPI_CFLAGS = $(CFLAGS) -lmpi

help:
	@echo "help\tShow this help text"
	@echo "all\tMake all executables"
	@echo "clean\tThrow away all files that are easy to produce again"
	@echo "empty\tThrow away all files that can be produced again"

all: $(EXECUTABLES)

clean:
	rm -rf $(JUNK)

empty:
	rm -rf $(JUNK) $(EXPENSIVE_JUNK)

hello: hello.c
	$(CC) $(CFLAGS) -o hello hello.c

primes-omp: primes-omp.c
	$(CC) $(OMP_CFLAGS) -o primes-omp primes-omp.c

primes-mpi: primes-mpi.c
	mpiCC $(MPI_CFLAGS) -o primes-mpi primes-mpi.c

stencil-mpi: stencil-mpi.c
	mpiCC $(MPI_CFLAGS) -o stencil-mpi stencil-mpi.c

