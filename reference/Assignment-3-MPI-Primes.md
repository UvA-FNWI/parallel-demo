# Assignment: MPI Primes

Count the number of primes in a range of integers using MPI and the master/worker pattern.
- Workers wait for a number to examine, compute is_prime(), send back result, repeat.
- A worker stops if it is sent the number 0.
- The master distributes work over the workers.
- The node with rank 0 is master, the other nodes are workers
- See `run_as_worker()` in `primes-mpi.c` for the implementation of a worker.
- Add the missing code to `run_as_master()` (three places), search for `/* insert communication */`
- Compile your code to a runnable program with:
```bash
make primes-mpi
```
- Submit a job with
```bash
sbatch primes-mpi-sbatch.sh
```
- Look at `slurm-xxxx.out` for the result of the run (there should be 67001 primes)
- Write down the number of workers used, and the computation time
- Edit the specification `-N 1` in `primes-mpi-sbatch.sh` to run with a different number of processors,
and make a speedup table.

