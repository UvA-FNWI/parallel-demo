#!/bin/bash -e
#SBATCH -t 1:00 -N 1 --mem=100M
#SBATCH --reservation=course-jhlsrf011-0

./hello
