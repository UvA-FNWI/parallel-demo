#!/bin/bash -e
#SBATCH -t 2:00 -N 1 --mem=200M


mpirun $HOME/lab/parallel-demo/stencil-mpi
