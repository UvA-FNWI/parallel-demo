#!/bin/bash -e
#SBATCH -t 1:00 -N 1 --mem=10M

export OMP_NUM_THREADS=`nproc --all`

$HOME/lab/parallel-demo/hello
