#!/bin/bash -e
#SBATCH --partition=thin_course
#SBATCH -t 1:00 --ntasks=16

module purge
module load 2023
module load MPICH/4.1.2-GCC-12.3.0

mpirun ./stencil-mpi
