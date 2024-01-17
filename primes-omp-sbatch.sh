#!/bin/bash -e
#SBATCH --partition=thin_course
#SBATCH -t 4:00 --ntasks=16 --mem=10M

# Also change the --ntasks= above to this number
export OMP_NUM_THREADS=16

./primes-omp
