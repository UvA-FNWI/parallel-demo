EXECUTABLES=hello primes-omp primes-mpi stencil-mpi

EXPENSIVE_JUNK += $(EXECUTABLES) cmake-build-*

SRC = hello.c primes-omp.c primes-mpi.c stencil-mpi.c

JUNK += hello primes-omp primes-mpi stencil-mpi

CFLAGS += -O3 -Wall -W --std=c11
OMP_CFLAGS = $(CFLAGS) -fopenmp
MPI_CFLAGS = $(CFLAGS) -lmpi

LDFLAGS += -lomp

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
	$(CC) $(OMP_CFLAGS) -o primes primes.c -lm

primes-mpi: primes-mpi.c
	mpiCC $(MPI_CFLAGS) -o primes-mpi primes-mpi.c -lm

stencil-mpi: stencil-mpi.c
	mpiCC $(MPI_CFLAGS) -o stencil-mpi stencil-mpi.c -lm

