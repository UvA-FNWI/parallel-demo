#!/bin/bash -e
#SBATCH --partition=thin_course
#SBATCH -t 1:00 --ntasks=1 --mem=10M

./hello
