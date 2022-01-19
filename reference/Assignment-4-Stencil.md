# Assignment: Stencil operations

- Edit the function `exchange_columns()` in `stencil-mpi.c`. Add code to send and receive columns according to the comments.
- Use the `MPI.md` next to this assignment text to look up MPI functions, or use the official reference at https://www.open-mpi.org/doc/current 
- Compile your code to a runnable program with:
```bash
make stencil-mpi
```
- Submit a job with
```bash
sbatch stencil-mpi-sbatch.sh
```
- Look at `slurm-xxxx.out` for the result of the run (25 iterations in less than a second)

