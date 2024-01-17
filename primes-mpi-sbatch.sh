#!/bin/bash -e
#SBATCH --partition=thin_course
#SBATCH -t 3:00 --ntasks=16 --mem=100M

module purge
module load 2023
module load MPICH/4.1.2-GCC-12.3.0

srun --mpi=pmi2 ./primes-mpi
