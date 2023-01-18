#!/bin/bash -e
#SBATCH -t 4:00 -n 16 --mem=100M

export OMP_NUM_THREADS=`nproc --all`

./primes-omp
