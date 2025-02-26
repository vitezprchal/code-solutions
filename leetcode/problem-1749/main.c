#include <stdio.h>
#include <stdlib.h>

// Using Kadane's algorithm

int max(int a, int b) { return a > b ? a : b; }

int min(int a, int b) { return a > b ? b : a; }

int maxAbsoluteSum(int *nums, int numsSize)
{
    int max_sum = 0;
    int min_sum = 0;

    int current_max = 0;
    int current_min = 0;

    for (int i = 0; i < numsSize; i++)
    {
        int now = nums[i];

        current_max = max(now, current_max + now);
        max_sum = max(max_sum, current_max);

        current_min = min(now, current_min + now);
        min_sum = min(min_sum, current_min);
    }

    return max(abs(max_sum), abs(min_sum));
}

int main()
{
    printf("Solution for Problem 1749\n");
    int example0[] = {1, -3, 2, 3, -4};
    int example1[] = {2, -5, 1, -4, 3, -2};

    printf("Example 0: %d\n", maxAbsoluteSum(example0, 5));
    printf("Example 1: %d\n", maxAbsoluteSum(example1, 6));

    return 0;
}
