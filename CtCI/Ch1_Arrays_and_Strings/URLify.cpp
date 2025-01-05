#include <string>
#include <iostream>

using namespace std;

// We assume that the string has suddicent space at the end to hold the additional characters.
string urlify(string str, int length) {
    int index = length-1;
    int last = str.size() - 1;

    while (index >= 0) {
        while (str[index] != ' ') {
            str[last] = str[index];
            index--;
            last--;
        }

        str[last] = '0';
        str[last-1] = '2';
        str[last-2] = '%';
        last -= 3;

        if (str[index] != ' ') {
            return str;
        }

        while (str[index] == ' ') {
            index--;
        }
    }

    if (str[0] == ' ') {
        str[0] = '%';
        str[1] = '2';
        str[2] = '0';
    }

    return str;
}

int main() {
    string str = "Mr John Smith    ";
    int length = 13;
    cout << urlify(str, length) << endl;

    str = "apple";
    length = 5;
    cout << urlify(str, length) << endl;

    str = "      ";
    length = 2;
    cout << urlify(str, length) << endl;
}

/*
 Result of the code:
 */