#include <iostream>
#include <string>

using namespace std;

void print(int matrix[3][5]);

// find() takes O(N) since it preforms linear search
// Time: O(n)
// Space: O(n)
// n: size of s1s1
bool isSubstring(string s1, string s2) {
    if (s1.size() == s2.size() && s1.size() > 0) {
        string s1s1 = s1 + s1;
        return s1s1.find(s2) != string::npos;
    }
    return false;
}

int main() {
    cout << "s1: waterbottle, s2: erbottlewa -> " << isSubstring("waterbottle", "erbottlewat") << endl;
}

/*
 Result of the code:

 s1: waterbottle, s2: erbottlewa -> 1
 */