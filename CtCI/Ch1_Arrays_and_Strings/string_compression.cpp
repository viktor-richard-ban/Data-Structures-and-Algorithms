#include <string>
#include <iostream>

using namespace std;

// Time: O(n^2) because each append operation potentially involves copying the entire compressed string to a new location in memory.
// Space; O(n)  if no characters repeat, the length of compressed is equal to the length of str
// n: size of str
string compress(string str) {
    int counter = 0;
    char current = str[0];
    string compressed = "";

    for (int index = 0; index < str.size(); index++) {
        if (current == str[index]) {
            counter++;
        } else {
            compressed += current;
            compressed += to_string(counter);
            counter = 0;
            current = str[index];
        }
    }
    compressed += current;
    compressed += to_string(counter);

    if (compressed.size() < str.size()) {
        str = compressed;
    }

    return str;
}

int main() {
    cout << "aabcccccaaa -> " << compress("aabcccccaaa") << endl;
    cout << "abcdefg -> " << compress("abcdefg") << endl;
    cout << "aaaaa -> " << compress("aaaaa") << endl;
    cout << "aaaaaaaaaabb -> " << compress("aaaaaaaaaabb") << endl;
}

/*
 Result of the code:
 
aabcccccaaa -> a2b1c5a3
abcdefg -> abcdefg
aaaaa -> a5
aaaaaaaaaabb -> a10b2
 */