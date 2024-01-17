#!/bin/bash -e
#SBATCH --partition=thin_course
#SBATCH -t 1:00 --ntasks=16 --mem=200M

srun --mpi=pmi2 ./stencil-mpi
