/**
 * Simple demo program for MPI: a master/worker program that searches for prime numbers in a range of numbers.
 */

#include <stdio.h>
#include <mpi.h>
#include <stdbool.h>
#include <stdlib.h>
#include <math.h>


/**
 * Given a value 'n', return {\code true} iff the value is prime.
 *
 * @param n The value to examine.
 * @return {\code true} iff the value is prime.
 */
bool is_prime(long int n) {
    if (n < 2) {
        return false;
    }
    if ((n % 2) == 0) {
        return n == 2;
    }
    const long int top = (long int) ceil(sqrt(n));
    bool res = true;
    for (long int k = 3; k < top; k += 2) {
        if ((n % k) == 0) {
            res = false;
            break;
        }
    }
    return res;
}


/**
 * Given a value to send and a worker to send the value to, send
 * a message ordering the worker to compute whether the given value
 * is prime. The special value '0' means that the worker should quit.
 * The worker will send a message to the master with the verdict.
 *
 * @param worker  The worker to send the message to.
 * @param val The value to examine.
 */
void send_work_command(int worker, long int val) {
    // printf("send_work_command: worker=%d val=%lu\n", worker, val);
    MPI_Send(&val, 1, MPI_UINT64_T, worker, 0, MPI_COMM_WORLD);
}


/**
 * Given a result to send, send a message telling the master that
 * the value it sent is prime or not. Note that the value for which the
 * result has been computed is not sent, since nobody cares about it.
 *
 * @param result The result.
 */
void send_result(int result) {
    MPI_Send(&result, 1, MPI_INT, 0, 0, MPI_COMM_WORLD);
}


/**
 * Wait for the next value to compute. The value zero means that the worker should quit.
 *
 * @param val A pointer to the value to fill with the received value.
 */
void await_command(long int *val) {
    MPI_Recv(val, 1, MPI_INT64_T, 0, MPI_ANY_TAG, MPI_COMM_WORLD,
             MPI_STATUS_IGNORE);
}


/**
 * Wait for the next result from a worker.
 *
 * @param worker A pointer to the variable that will hold the worker that sent the result.
 * @param result A pointer to the variable that will hold the result.
 */
void await_result(int *worker, int *result) {
    MPI_Status status;
    MPI_Recv(result, 1, MPI_INT, MPI_ANY_SOURCE, MPI_ANY_TAG, MPI_COMM_WORLD,
             &status);
    *worker = status.MPI_SOURCE;
}


/**
 * The code to run as master: send jobs to the workers, and await their replies.
 *
 * @param workers The number of workers
 * @param startval  The first value to examine.
 * @param nval The number of values to examine.
 * @return The number of values in the specified range.
 */
int run_as_master(const int workers, const long int startval, const long int nval) {
    int primes = 0;
    const long int endval = startval + nval;
    long int val = startval;

    if (val == 2) {
        // Handling 2, (the only even prime) is messy, so we cheat, and just count it in immediately.
        primes++;
        val++;
    }
    if ((val % 2) == 0) {
        // If we start with an even number, skip it. Note that we already dealt with 2 above.
        val++;
    }

    // TODO: Insert your code here.

    return primes;
}

/**
 * The code to run as worker: receive jobs, execute them, and terminate when told to.
 */
void run_as_worker(void) {
    // TODO: Insert your code here.
}

int main(int argc, char *argv[]) {
    int rank;
    int size;

    const long int base = 10000000000001UL;
    const long int r = 4000000;

    /* Start up MPI */
    MPI_Init(&argc, &argv);
    MPI_Comm_rank(MPI_COMM_WORLD, &rank);
    MPI_Comm_size(MPI_COMM_WORLD, &size);

    const bool am_master = 0 == rank;

    if (am_master) {
        printf("Running as master\n");
        const double start = MPI_Wtime();
        int primes = run_as_master(size - 1, base, r);
        const double finish = MPI_Wtime();
        printf("Master has finished. There are %d primes between %ld and %ld, this took %.1f seconds\n", primes, base, base + r, finish-start);
    } else {
        printf("Running as worker %d\n", rank);
        run_as_worker();
        printf("Worker %d has finished\n", rank);
    }

    MPI_Finalize();

    return 0;
}
