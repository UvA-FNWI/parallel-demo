/**
 * Simple demo program for MPI: a stencil operation.
 */

#include <stdio.h>
#include <mpi.h>
#include <stdbool.h>
#include <stdlib.h>
#include <math.h>


#define COLUMNS_PER_PROCESSOR (10)
#define ROWS (100)
#define COLUMN_SIZE (ROWS+2)
#define ITERATIONS (100)

#define ARRAY_SIZE (COLUMN_SIZE*(COLUMNS_PER_PROCESSOR+2))

/* Data is stored column-wise in a one-dimensional array. Thus the next element in a column is
 * adjacent, the next element in a row is COLUMN_SIZE elements further.
 */
double cells1[ARRAY_SIZE];
double cells2[ARRAY_SIZE];

int compute_index(const int row, const int column)
{
    return COLUMN_SIZE*(column+1) + (row+1);
}

/**
 * Given an array to fill, put zeroes everywhere, plus a few scattered non-zero values.
 * @param cells The array to fill
 */
void fill_cells(double *cells)
{
    for(int i=0; i<ARRAY_SIZE; i++){
        cells[i] = 0.0;
    }
    cells[compute_index(2, 2)] = 100.0;
    cells[compute_index(ROWS/4, COLUMNS_PER_PROCESSOR/4)] = 50.0;
    cells[compute_index(ROWS/2, COLUMNS_PER_PROCESSOR/2)] = -1000.0;
}

/**
 * Send a column of data to the given processor.
 *
 * @param proc  The processor to send the column to.
 * @param cells The array to take the column from.
 * @param col The number of the column to send.
 */
void send_column(const int proc, const double *cells, const int col) {
    MPI_Send(&cells[compute_index(0, col)], ROWS, MPI_DOUBLE, proc, 0, MPI_COMM_WORLD);
}

/**
 * Receive a column of data from the given processor. Note that since the data is stored on the borders of
 * the normal array, the column numbers look odd, namely -1 and COLUMNS_PER_PROCESSOR. This is as designed,
 * and the array is large enough to hold the data.
 *
 * @param proc  The processor to receive the column from.
 * @param cells The array to write the column to.
 * @param col The number of the column to put the received data.
 */
void recv_column(int proc, double *cells, const int col) {
    MPI_Recv(&cells[compute_index(0, col)], ROWS, MPI_DOUBLE, proc, MPI_ANY_TAG, MPI_COMM_WORLD,
             MPI_STATUS_IGNORE);
}

void run_stencil(const double *old_cells, double *new_cells)
{
    for(int row = 0; row<ROWS; row++){
        int ix = compute_index(row, 0);
        for(int col = 0; col<COLUMNS_PER_PROCESSOR; col++){
            new_cells[ix] = 0.5 * old_cells[ix] + 0.125 * (old_cells[ix-1] + old_cells[ix+1] + old_cells[ix+COLUMN_SIZE] + old_cells[ix-COLUMN_SIZE]);
            ix++;
        }
    }
}

int main(int argc, char *argv[]) {
    int rank;
    int size;

    /* Start up MPI */
    MPI_Init(&argc, &argv);
    MPI_Comm_rank(MPI_COMM_WORLD, &rank);
    MPI_Comm_size(MPI_COMM_WORLD, &size);
    printf("Running as processor %d\n", rank);

    int left_neighbour = rank-1;
    int right_neighbour = rank+1;

    fill_cells(cells1);
    double *old_cells = cells1;
    double *new_cells = cells2;
    const double start = MPI_Wtime();
    for(int iter=0; iter<ITERATIONS; iter++){
        // Communication goes here.
        run_stencil(old_cells, new_cells);
        {
            // Swap the role of the two arrays.
            double *tmp = old_cells;
            old_cells = new_cells;
            new_cells = tmp;
        }
    }
    const double finish = MPI_Wtime();
    printf("Processor %d has finished. This took %.1f seconds\n", rank, finish-start);
    MPI_Finalize();

    return 0;
}
