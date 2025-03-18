#include <stdio.h>
#include <string.h>
#include <vector>
#include <string>

using namespace std;

long long repairCars(vector<int>& ranks, int cars) {
    long long l = 0;
    long long r = (long long)1 * cars * cars * ranks[0];

    while (l < r) {
        long long m = l + (r - l) / 2;
        long long c = 0;
        for (auto r : ranks){
            c += sqrt(1 * m / r);
        }
        if (c < cars)
            l = m + 1;
        else {
            r = m;
        }
    }
    return l;
}

int main() {
    std::vector<int> ranks = {4,2,3,1};
    int cars = 10;

    printf("%i", repairCars(ranks, cars));

    return 0;
}
