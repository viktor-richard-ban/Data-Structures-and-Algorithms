#include <string>
#include <map>
#include <iostream>

using namespace std;

static map<int, string> dictionary = {
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

string englishInt(int number);
string parseRest(string rest) {
    string formattedRest = englishInt(stoi(rest));
    if (formattedRest != "" && stoi(rest) != 0) {
        return " " + formattedRest;
    }
    return "";
}


// Time: O(log n)
// Space: O(log n)
// n: number of characters in the input number
// since we parse this input number character by character
string englishInt(int number) {
    if (number == 0) return "Zero";
    
    string result = "";
    string value = to_string(number);
    if (number < 0) {
        result += "Negative ";
        number = -number;
        value = value.substr(1, value.size()-1);
    }

    auto dictItem = dictionary.find(number);
    if (number > 999) {
        // thousand
        // drop the last three characters, parse them separately
        string first = value.substr(0, value.size()-3);
        string rest = value.substr(value.size()-3, value.size()-1);

        result += englishInt(stoi(first));
        result += " Thousand";
        result += parseRest(rest);
    } else if (number > 99) {
         // hundred
         // drop last two characters, parse them separately
        string first = value.substr(0, 1);
        string rest = value.substr(1, value.size()-1);

        result += englishInt(stoi(first));
        result += " Hundred";
        result += parseRest(rest);
    } else if (number > 20) {
        // out of dictionary boundaries
        // drop last character, add 1 zero, parse it separately
        string first = value.substr(0, 1);
        first += "0";
        dictItem = dictionary.find(stoi(first));
        string rest = value.substr(1, value.size()-1);
        result += dictItem->second;
        result += parseRest(rest);
    } else if (number > 0 && dictItem != dictionary.end()) {
        // can be found in the dictionary
        // simply parse it
        result += dictItem->second;
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