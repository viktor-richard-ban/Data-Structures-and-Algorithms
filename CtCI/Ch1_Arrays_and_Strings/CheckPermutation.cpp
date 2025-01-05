#include <string>
#include <map>
#include <iostream>

using namespace std;

bool checkPermutation(string str1, string str2) {
    if (str1.size() != str2.size()) {
        return false;
    }

    map<char, int> frequency;
    for (char c : str1) {
        if (frequency.find(c) != frequency.end()) {
            frequency[c] += 1;
        } else {
            frequency[c] = 1;
        }
    }

    for (char c : str2) {
        if (frequency.find(c) == frequency.end()) {
            return false;
        }
        frequency[c] -= 1;
        if (frequency[c] < 0) {
            return false;
        }
    }

    return true;
}



int main() {
    string str1 = "I have a asd story";
    string str2 = "I have a sad story";
    cout << checkPermutation(str1, str2) << endl;

    str2 = "I have a saa story";
    cout << checkPermutation(str1, str2) << endl;
}

/*
 Result of the code:
 
1
0
 */