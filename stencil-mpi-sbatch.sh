#!/bin/bash -e
#SBATCH -t 2:00 -N 1 --mem=40M


mpirun $HOME/lab/parallel-demo/stencil-mpi
