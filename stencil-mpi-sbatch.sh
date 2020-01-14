#!/bin/bash
#SBATCH -t 2:00 -N 1 -p normal --mem=40M


mpirun $HOME/lab/parallel-demo/stencil-mpi
