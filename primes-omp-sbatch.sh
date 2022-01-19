#!/bin/bash -e
#SBATCH -t 4:00 -N 1 --mem=100M
#SBATCH --reservation=course-jhlsrf011-0

export OMP_NUM_THREADS=`nproc --all`

./primes-omp
