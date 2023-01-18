#!/bin/bash -e
#SBATCH -t 1:00 -N 1 --mem=200M

srun --mpi=pmi2 ./stencil-mpi
