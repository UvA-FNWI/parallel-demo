#include <stdio.h>
#include <math.h>
#include <omp.h>
#include <stdbool.h>

/**
 * Given an integer 'n', return 'true' iff 'n' is prime.
 *
 * @param n The value to examine.
 * @return {\code true} iff the value is prime.
 */
static bool is_prime(long int n) {
    if (n < 2) {
        return false;  // By definition
    }
    if ((n % 2) == 0) {
        return n == 2;  // There is only one even prime: 2
    }
    const long int top = (long int) ceil(sqrt(n));
    for (long int k = 3; k <= top; k += 2) {
        if ((n % k) == 0) {
            return false;
        }
    }
    return true;
}

int main(void) {
    const long int base = 10000000000001L;
    const long int r = 2000000;
    int primes = 0;
    const double start = omp_get_wtime();
    for (long int n = base; n < base + r; n += 2) {
        bool prime = is_prime(n);
        if (prime) {
            primes++;
        }
    }
    double end = omp_get_wtime();
    double comp = end - start;
    printf("There are %d primes between %ld and %ld. This took %4.1fs to compute, using %d threads.\n", primes, base,
           base + r, comp, omp_get_max_threads());
    return 0;
}
