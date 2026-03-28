#include <string>
#include <map>
#include <cctype>
#include <iostream>

using namespace std;

// Time: O(n),   Space: O(c)
// n: number of characters in the input
// c: number of different characters
bool palindromePermutation(string str) {
    map<char, int> frequencies;

    int oddCounter = 0;
    for (char c : str) {
        char convertedC = tolower(c);
        if (convertedC < 'a' || convertedC > 'z') {
            continue;
        }
        if (frequencies.find(convertedC) == frequencies.end()) {
            frequencies[convertedC] = 1;
        } else {
            frequencies[convertedC]++;
        }

        if (frequencies[convertedC] % 2 == 1) {
            oddCounter++;
        } else {
            oddCounter--;
        }
    }

    return oddCounter <= 1;
}

int main() {
    string str = "Taco cat";
    cout << palindromePermutation(str) << endl;

    str = "I have a saa story";
    cout << palindromePermutation(str) << endl;

    str = "atco ctA";
    cout << palindromePermutation(str) << endl;
}

/*
 Result of the code:
 
1
0
1
 */