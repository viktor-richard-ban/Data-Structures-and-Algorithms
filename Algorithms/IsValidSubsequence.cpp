#include <vector>
#include <iostream>

using namespace std;

bool isValidSubsequence(vector<int> array, vector<int> sequence) {
  int index = 0;
  for(int i = 0; i < array.size(); i++) {
    if (array[i] == sequence[index])
      index += 1;
    
    if (sequence.size() == index)
      return true;
  }
  return false;
}

int main() {
    vector<int> array = {5, 1, 7, 4, 3, 9};
    vector<int> sequence = {1, 3, 9};
    cout << isValidSubsequence(array, sequence) << endl;
    
    sequence = {5, 1, 1};
    cout << isValidSubsequence(array, sequence) << endl;
}

/*
 Result of code:
 
 1
 0
 */
