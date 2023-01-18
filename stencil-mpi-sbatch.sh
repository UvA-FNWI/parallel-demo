#!/bin/bash -e
#SBATCH -t 1:00 -n 16 --mem=200M

srun --mpi=pmi2 ./stencil-mpi
