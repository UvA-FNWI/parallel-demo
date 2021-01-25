# Assignment: OpenMP Primes

Count the number of primes in a range of integers using OpenMP to speed up the computation.

- The source code in `primes-omp.c` is a functioning sequential program to do this computation
- The `is_prime()` function in `primes-omp.c` determines whether a given number is a prime. This is the dominant
  computation of the program.
- Now add one or more OpenMP annotations to parallelize the program
- Compile your code to a runnable program with:
```bash
make primes-omp
```
- Submit a job with
```bash
sbatch primes-omp-sbatch.sh
```
- Look at `slurm-xxxx.out` for the result of the run (there should be 67001 primes)
- Write down the number of workers used, and the computation time
- Edit the specification `OMP_NUM_THREADS` in `primes-mpi-sbatch.sh` to run with a different number of threads,
and make a speedup table. The default expression evaluates to 16 on the Lisa nodes.

