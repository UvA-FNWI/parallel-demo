#!/bin/bash -e
#SBATCH --partition=thin_course
#SBATCH -t 3:00 --ntasks=16 --mem=10M

srun --mpi=pmi2 ./primes-mpi
