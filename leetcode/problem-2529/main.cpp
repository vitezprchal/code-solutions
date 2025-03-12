#include <stdio.h>
#include <string.h>
#include <vector>
#include <string>

using namespace std;

int maximumCount(vector<int>& nums) {
    int positive = 0;
    int negative = 0;

    for(int i = 0; i < nums.size(); i++) {

        int c = nums.at(i);

        if(c > 0)
            positive++;

        if(c < 0)
            negative++;
    }

    return std::max(positive, negative);
}

int main() {

    std::vector<int> example = {-2,-1,-1,1,2,3};

    maximumCount(example);

    return 0;
}
