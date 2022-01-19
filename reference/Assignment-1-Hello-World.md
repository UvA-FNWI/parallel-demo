# Assignment: Hello World

This requires an account on the SurfSara *Lisa* cluster. Run a Hello World program to make sure
you can compile and run programs on that cluster. First log in on the Lisa, and then do:

```bash
> cd ~
> mkdir lab
> cd lab
> git clone https://github.com/CvR42/parallel-demo.git
> cd parallel-demo
> make hello
gcc -W -Wall hello.c -o hello
> ./hello
Hello, World!
```
This shows that you can compile programs on the Lisa. Now do:
```bash
> sbatch hello-sbatch.sh
Submitted batch job 14696
> squeue -u $LOGNAME
```
to submit this program to the execution queue, and then see what the
state of your program is.  Note the number that is assigned to your job,
in this example it is 14696. When the program has finished, do:
```bash
> cat slurm-14696.out
Hello, World!
```
To verify that the program has run properly.

Now edit the program to print "Hello, universe!", and then compile and submit it again.
This is to verify that you can also modify and run a program.

Note: For this workshop there is a special queue. Edit the hello-sbatch.sh
file and remove the reservation line if you want to run the examples at a
later moment.  Similar for the sbatch.sh files for the other assignments.
