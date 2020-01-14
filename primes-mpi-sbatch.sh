#!/bin/bash
#SBATCH -t 10:00 -N 1 -p normal --mem=10M


mpirun $HOME/lab/parallel-demo/primes-mpi
