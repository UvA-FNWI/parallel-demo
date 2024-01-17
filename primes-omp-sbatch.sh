#!/bin/bash -e
#SBATCH --partition=thin_course
#SBATCH -t 4:00 --ntasks=16 --mem=100M

export OMP_NUM_THREADS=`nproc --all`

./primes-omp
