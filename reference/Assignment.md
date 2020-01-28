# Assignment: matrix-vector multiplication

- Given a matrix M of size N x N and a vector V of size N, implement V = M x V

- Choose a memory layout and distribution of M and V for maximal efficiency of this computation.
Add code to repeat the computation R times, and to measure the overall execution time.

- Hint: the MPI collective communication functions may be helpful

- Hint: it may (or may not) be a good idea to replicate V over multiple processes

- Show speedup curves for 16 processes/threads and less, for different choices of R and N,
  so that execution time on 16 processes/threads is roughly 60 seconds. Under that constraint,
  explore different combinations of N and R, and discuss the results.

- Write a report containing the full, commented, code of the implementation, a motivation of your chosen distribution
and communication method, and a discussion of the performance.

- A passing grade requires at least a speedup of 8 on 16 processes/threads.

- 1 bonus point for (also?) using OpenMP

- 1 bonus point for the team with the largest N with an execution time of 60 seconds or less on 16 processes/threads.
Only full-matrix solutions are allowed.