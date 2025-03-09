#include <stdbool.h>
#include <stdio.h>
#include <stdlib.h>

int numberOfAlternatingGroups(int *colors, int colorsSize, int k)
{
    int values = 0;
    int alternating = 1;
    int last = colors[0];

    for (int i = 1; i < colorsSize + k - 1; i++)
    {
        int now = colors[i % colorsSize];

        if (now == last)
        {
            alternating = 1;
            last = now;
            continue;
        }

        alternating++;

        if (alternating >= k)
        {
            values++;
        }

        last = now;
    }

    return values;
}

int main()
{
    int colors[] = {0, 1, 0, 0, 1, 0, 1};
    int colors_size = sizeof(colors) / sizeof(colors[0]);

    int n = numberOfAlternatingGroups(colors, colors_size, 6);

    printf("%d\n", n);

    return 0;
}
