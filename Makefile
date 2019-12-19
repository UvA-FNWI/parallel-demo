EXECUTABLES=hello hello-omp primes primes-mpi

EXPENSIVE_JUNK += $(EXECUTABLES) cmake-build-*

SRC = primes.c hello.c hello-omp.c primes-mpi.c

JUNK +=

CFLAGS += -O3 -Wall -W
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

$(EXE): $(OBJ)
	$(CC) $(CFLAGS) -o $(EXE) $(OBJ)


hello-omp: hello-omp.c
	$(CC) $(OMP_CFLAGS) -o hello-omp hello-omp.c

primes: primes.c
	$(CC) $(OMP_CFLAGS) -o primes primes.c -lm

primes-mpi: primes-mpi.c
	mpiCC $(MPI_CFLAGS) -o primes-mpi primes-mpi.c -lm

