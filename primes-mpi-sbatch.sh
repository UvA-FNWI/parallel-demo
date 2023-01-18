#!/bin/bash -e
#SBATCH -t 3:00 -N 1 --mem=100M
#SBATCH --reservation=uva_course

mpirun ./primes-mpi
