#include <iostream>
#include <vector>

using namespace std;

// Time: O(n),  Space: O(1)
// n = size of the input array
int majorityElement(vector<int> array) {
  int counter = 1;
  int element = array[0];

  for (int i = 1; i < array.size(); i++) {
    if (counter == 0) {
      element = array[i];
    }

    if (array[i] == element) {
      counter++;
    } else {
      counter--;
    }
  }
  
  return element;
}

// Time: O(n),  Space: O(1)
// n = size of the input array
int majorityElementBitManipulation(vector<int> array) {
  int element = 0;

  for (int currentBit = 0; currentBit<32; currentBit++) {
    int currentBitValue = 1 << currentBit;
    int onesCount = 0;

    for (int num : array) {
      if ((num & currentBitValue) != 0) {
        onesCount++;
      }
    }

    if (onesCount > array.size() / 2) {
      element += currentBitValue;
    }
  }
  
  return element;
}

int main() {
    vector<int> array = {1, 2, 3, 2, 2, 1, 2};
    cout << majorityElement(array) << endl;
    cout << majorityElementBitManipulation(array) << endl;
}

/*
 Result of code:
 
 2
 2
 */