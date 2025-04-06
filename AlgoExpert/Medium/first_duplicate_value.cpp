#include <vector>
#include <iostream>

using namespace std;

// Time: O(n)
// Space: O(1)
int firstDuplicateValue(vector<int> array) {
  for (int i = 0; i < array.size(); i++) {
    int num = (array[i] > 0) ? array[i] : array[i] * -1;
    if (array[num-1] < 0) {
      return num;
    } else {
      array[num-1] *= -1;
    }
  }
  
  return -1;
}

int main() {
    vector<int> array = {1, 2, 3, 2, 2, 1, 2};
    cout << firstDuplicateValue(array) << endl;
}

/*
 Result of code:
 
 2
 */