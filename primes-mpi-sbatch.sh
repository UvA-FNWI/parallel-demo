#!/bin/bash -e
#SBATCH -t 3:00 -n 16 --mem=100M

srun --mpi=pmi2 ./primes-mpi
