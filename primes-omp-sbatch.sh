#!/bin/bash
#SBATCH -t 10:00 -N 1 -p normal --mem=10M

export OMP_NUM_THREADS=`nproc --all`

$HOME/lab/parallel-demo/primes
