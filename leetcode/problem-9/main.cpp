#include <stdio.h>
#include <string.h>
#include <vector>
#include <string>

using namespace std;

bool isPalindrome(int x) {
    const auto s1 = to_string(x);
    const auto s2 = std::string(s1.rbegin(), s1.rend());

    return s1 == s2;
}

auto main() -> int {
    return 0;
}
