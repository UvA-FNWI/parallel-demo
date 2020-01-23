#!/bin/bash -e
#SBATCH -t 10:00 -N 1 --mem=100M

export OMP_NUM_THREADS=`nproc --all`

./primes-omp
