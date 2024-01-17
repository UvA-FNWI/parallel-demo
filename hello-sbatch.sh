#!/bin/bash -e
#SBATCH --partition=thin_course
#SBATCH -t 1:00 -N 1 --mem=100M

./hello
