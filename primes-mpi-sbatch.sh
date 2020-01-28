#!/bin/bash -e
#SBATCH -t 10:00 -N 1 --mem=100M
#SBATCH --reservation=uva_mpiomp_course

mpirun ./primes-mpi
