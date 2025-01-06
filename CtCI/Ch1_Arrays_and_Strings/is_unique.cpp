#include <iostream>
#include <string>
#include <set>
#include <algorithm>

using namespace std;

class Solution {
public:
    
    // Time: O(n) - Space: O(c)
    bool isUnique_1(string str) {
        set<char> chars;
        for (int i = 0; i < str.length(); i++) {
            if (chars.find(str[i]) != chars.end()) {
                return false;
            }
            chars.insert(str[i]);
        }
        return true;
    }
    
    // Time: O(n log n) - Space: O(log n)*
    // * using quick sort
    bool isUnique_2(string str) {
        string sorted = str;
        sort(sorted.begin(), sorted.end());
        
        char last;
        for (int i = 0; i < sorted.length(); i++) {
            if (last == sorted[i]) {
                return false;
            }
            last = sorted[i];
        }
        return true;
    }
};

int main() {
    Solution s;
    cout << "isUnique_1: " << s.isUnique_1("asf") << endl;
    cout << "isUnique_2: " << s.isUnique_2("asf") << endl;
    
    cout << "isUnique_1: " << s.isUnique_1("asad") << endl;
    cout << "isUnique_2: " << s.isUnique_2("asad") << endl;
}

/*
 Result of the code:
 
 isUnique_1: 1
 isUnique_2: 1
 isUnique_1: 0
 isUnique_2: 0
 */
