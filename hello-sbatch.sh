#!/bin/bash -e
#SBATCH -t 1:00 -N 1 --mem=100M
#SBATCH --reservation=uva_course

./hello
