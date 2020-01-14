#!/bin/bash
#SBATCH -t 1:00 -N 1 -p normal --mem=10M

#export OMP_NUM_THREADS=`nproc --all`
#export OMP_NUM_THREADS=16

$HOME/lab/parallel-demo/hello-omp
