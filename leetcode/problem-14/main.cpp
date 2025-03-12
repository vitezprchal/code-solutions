#include <vector>
#include <string>

using namespace std;

string longestCommonPrefix(vector<string>& strs) {
    if(strs.empty()) return "";

    size_t i = strs.size() > 1 ? 1 : 0;
    size_t j = 0;
    size_t substring = 0;

    auto char_last = strs.at(0).at(0);

    while (true) {
        if (i >= strs.size()) {
            j++;
            i = 0;
            substring++;

            if (j >= strs.at(0).size()) {
                break;
            }

            char_last = strs.at(i).at(j);
        }

        const auto now = strs.at(i);

        if(j >= now.size()) break;

        const auto c = now.at(j);

        if (char_last != c) {
            break;
        }

        char_last = c;
        i++;
    }

    return strs.at(0).substr(0, substring);
}

int main() {
    return 0;
}
