#!/bin/bash
#SBATCH -t 2:00 -N 1 -p normal --mem=10M


mpirun /home/reeuwijk/lab/parallel-demo/stencil-mpi
