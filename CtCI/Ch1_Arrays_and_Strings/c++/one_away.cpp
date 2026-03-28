#include <iostream>
#include <string>

using namespace std;

// Time: O(n),   Space: O(1)
bool one_away(string str1, string str2) {
    if (abs((double)str1.size() - str2.size()) > 1) { return false; }

    string longer = (str1.size() >= str2.size()) ? str1 : str2;
    string shorter = (str1.size() < str2.size()) ? str1 : str2;

    int longerI = -1, shorterI = -1;
    bool differenceFound = false;

    while (longerI < (int)longer.size() && shorterI < (int)shorter.size()) {
        longerI++;
        shorterI++;

        if (longer[longerI] == shorter[shorterI]) { continue; }
        if (differenceFound) { return false; } 
        differenceFound = true;

        if (longer.size() == shorter.size()) {
            continue;
        }

        longerI++;
        if (longer[longerI] != shorter[shorterI]) { return false; }
    }

    return true;
}

int main() {
    cout << "pale, ple -> " << one_away("pale", "ple") << endl;         // true
    cout << "pales, pale -> " << one_away("pales", "pale") << endl;     // true
    cout << "pale, bale -> " << one_away("pale", "bale") << endl;       // true
    cout << "pale, bake -> " << one_away("pale", "bake") << endl;       // false
    cout << "pales, pale -> " << one_away("pales", "pale") << endl;     // true
    cout << "pal, apal -> " << one_away("pal", "apal") << endl;         // true
    cout << "pale, plae -> " << one_away("pale", "plae") << endl;       // false
    cout << "pale, elap -> " << one_away("pale", "elap") << endl;       // false
}
