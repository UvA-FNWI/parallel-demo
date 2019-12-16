EXE=prime

EXPENSIVE_JUNK += $(EXE) cmake-build-*

SRC = primes.c
OBJ = $(SRC:.c=.o)

JUNK += $(OBJ)

CFLAGS += -Xpreprocessor -fopenmp -O3 -Wall -W

LDFLAGS += -lomp

help:
	@echo "help\tShow this help text"
	@echo "all\tMake all executables"
	@echo "clean\tThrow away all files that are easy to produce again"
	@echo "empty\tThrow away all files that can be produced again"

all: $(EXE)

clean:
	rm -rf $(JUNK)

empty:
	rm -rf $(JUNK) $(EXPENSIVE_JUNK)

$(EXE): $(OBJ)
	$(CC) $(LDFLAGS) -o $(EXE) $(OBJ)
