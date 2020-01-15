#!/bin/bash -e
#SBATCH -t 10:00 -N 1 --mem=10M


mpirun $HOME/lab/parallel-demo/primes-mpi
