# Assignment: matrix-vector multiplication

- This is a group assignment

- Assignments are submitted through Canvas, deadlines are handled by Canvas
  
- Code should be of decent quality: documented, commented, proper error handling, proper use of the C language
  
- Given a vector V of size N and a matrix M of size NxN, with elements of type `double`, implement V = M x V

- Except perhaps during intialisation, each element of M should reside on only one processor.

- Choose a memory layout and distribution of M and V for maximal efficiency of this computation.

- Add code to repeat the computation R times, and to measure the overall execution time.
Each iteration should use the V from the previous iteration.

- Hint: the MPI collective communication functions may be helpful

- Hint: it may (or may not) be a good idea to replicate V over multiple processes. Replication of M is not allowed.

- Hint: debug your code with something predictable, such as an identity matrix and a vector [0, 1, 2, 3, ... ]

- Show speedup curves for 16 processes/threads and less, for different choices of R and N,
  so that execution time on 16 processes/threads is roughly 60 seconds. Under that constraint,
  explore different combinations of N and R, and discuss the results.

- Write a report containing the full code of the implementation, a motivation of your chosen distribution
and communication methods, and a discussion of the speedup curve.

- A passing grade requires at least a speedup of 8 on 16 processes/threads.

- 1 bonus point for achieving some or all of the speedup with OpenMP, provided that you show the contribution of OpenMP to the overall execution time

- 1 bonus point for the team with the largest N with an execution time of 60 seconds or less on 16 processes/threads.


Note:

You are welcome to use the helper files from the workshop for this
assignment, but the reservation that you used during the workshop will
not be valid any more.  In the 'sbatch' files, Just remove the line with
'--reservation='. Hint: the Lisa has a special queue for small test jobs.
