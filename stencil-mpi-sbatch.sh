#!/bin/bash -e
#SBATCH -t 2:00 -N 1 --mem=100M

mpirun ./stencil-mpi
