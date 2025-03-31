#include <string>
#include <map>
#include <list>
#include <iostream>

using namespace std;

static const list<pair<int, string>> units = {
    {1000000000, "Billion"},
    {1000000, "Million"},
    {1000, "Thousand"}
};
static const map<int, string> dictionary = {
    {1, "One"},
    {2, "Two"},
    {3, "Three"},
    {4, "Four"},
    {5, "Five"},
    {6, "Six"},
    {7, "Seven"},
    {8, "Eight"},
    {9, "Nine"},
    {10, "Ten"},
    {11, "Eleven"},
    {12, "Twelve"},
    {13, "Thirteen"},
    {14, "Fourteen"},
    {15, "Fifteen"},
    {16, "Sixteen"},
    {17, "Seventeen"},
    {18, "Eighteen"},
    {19, "Nineteen"},
    {20, "Twenty"},
    {30, "Thirty"},
    {40, "Fourty"},
    {50, "Fifty"},
    {60, "Sixty"},
    {70, "Seventy"},
    {80, "Eighty"},
    {90, "Ninety"},
};

string convertBelowThousand(int number) {
    string result = "";

    if (number > 99) {
        // over or equal to one hundred, but less than one thousand
        string translation = dictionary.find(number / 100)->second;
        result += translation;
        result += " Hundred";
        number %= 100;
        if (number > 0) result+= " ";
    }
    
    if (number > 20) {
        // out of dictionary boundaries
        // drop last character, add 1 zero, parse it separately, we can find the result in the dictionary
        string translation = dictionary.find((int)(number / 10) * 10)->second;
        result += translation;
        number %= 10;
        if (number > 0) result+= " ";
    }
    
    if (number > 0) {
        // can be found in the dictionary
        // simply convert it
        string translation = dictionary.find(number)->second;
        result += translation;
    }

    return result;
}


// Time: O(log n)   // since the function processes each group of three digits
// Space: O(log n)
// n: number of characters in the input number
string englishInt(int number) {
    if (number == 0) return "Zero";
    
    string result = "";
    if (number < 0) {
        result += "Negative ";
        number = -number;
    }

    for (const auto& unit : units) {
        if (number >= unit.first) {
            result += convertBelowThousand(number / unit.first) + " " + unit.second;
            number %= unit.first;
            if (number > 0) result+= " ";
        }
    }
    
    if (number > 0) {
        result += convertBelowThousand(number);
    }

    return result;
}


int main() {
    cout << "0: " << englishInt(0) << endl;
    cout << "1: " << englishInt(1) << endl;
    cout << "20: " << englishInt(20) << endl;
    cout << "21: " << englishInt(21) << endl;
    cout << "5012: " << englishInt(5012) << endl;
    cout << "201000: " << englishInt(201000) << endl;
    cout << "-201000: " << englishInt(-201000) << endl;
    cout << "1234567890: " << englishInt(1234567890) << endl;
}

/*
 Result of the code:

 0: Zero
 1: One
 20: Twenty
 21: Twenty One
 5012: Five Thousand Twelve
 201000: Two Hundred One Thousand
 1234567890: One Thousand Two Hundred Thirty Four Thousand Five Hundred Sixty Seven Thousand Eight Hundred Ninety
 */