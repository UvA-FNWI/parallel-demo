#!/bin/bash
#SBATCH -t 40:00 -N 1 -p normal --mem=10M

#export OMP_NUM_THREADS=`nproc --all`
export OMP_NUM_THREADS=2


/home/reeuwijk/lab/parallel-demo/primes
