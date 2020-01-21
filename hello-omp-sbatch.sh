#!/bin/bash -e
#SBATCH -t 1:00 -N 1 --mem=100M

#export OMP_NUM_THREADS=`nproc --all`
#export OMP_NUM_THREADS=16

./hello-omp
