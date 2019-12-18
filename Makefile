EXECUTABLES=hello hello-omp primes

EXPENSIVE_JUNK += $(EXECUTABLES) cmake-build-*

SRC = primes.c hello.c hello-omp.c
OBJ = $(SRC:.c=.o)

JUNK += $(OBJ)

CFLAGS += -O3 -Wall -W
OMP_CFLAGS = $(CFLAGS) -fopenmp

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

