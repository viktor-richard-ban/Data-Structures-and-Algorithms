#include <iostream>
#include <vector>

using namespace std;

// Time: O(n),  Space: O(n)
// n = size of the input array
vector<int> sortedSquaredArray1(vector<int> array) {
  vector<int> sorted;

  int negIndex = -1;
  int nonNegIndex = array.size();
  for (int i=0; i<array.size(); i++) {
    if (array[i] < 0) {
      negIndex = i;
    }
    if (array[i] >= 0) {
      nonNegIndex = i;
      break;
    }
  }

  while (sorted.size() != array.size()) {
    int nextIndex;

    if (negIndex >= 0 && nonNegIndex < array.size()) {
      if (abs(array[negIndex]) < abs(array[nonNegIndex])) {
        nextIndex = negIndex;
        (negIndex > 0) ? negIndex-- : negIndex = -1;
      } else {
        nextIndex = nonNegIndex;
        (nonNegIndex < array.size() - 1) ? nonNegIndex++ : nonNegIndex = array.size();
      }
    } else if (negIndex >= 0) {
      nextIndex = negIndex;
      negIndex--;
    } else {
      nextIndex = nonNegIndex;
      nonNegIndex++;
    }
    
    int nextValue = pow(array[nextIndex], 2);
    sorted.push_back(nextValue); 
  }
  
  return sorted;
}

// Time: O(n),  Space: O(n)
// n = size of the input array
vector<int> sortedSquaredArray2(vector<int> array) {
  vector<int> sorted;
  int start = 0, end = array.size() - 1;

  while (sorted.size() != array.size()) {
    int nextIndex;

    if (abs(array[start]) > abs(array[end])) {
      nextIndex = start;
      start++;
    } else {
      nextIndex = end;
      end--;
    }
    
    int nextValue = pow(array[nextIndex], 2);
    sorted.insert(sorted.begin(), nextValue);
  }
  
  return sorted;
}

void printArray(vector<int> array) {
  for (int item : array) {
        cout << item << endl;
    }
}

int main() {
    cout << "Solution one:" << endl;
    vector<int> array = {-3,1,2};
    vector<int> result = sortedSquaredArray1(array);
    printArray(result);

    cout << "Optimized solution one:" << endl;

    result = sortedSquaredArray2(array);
    printArray(result);

    return 0;
}

/*
Result of code

Solution:
1
4
9
Optimized solution:
1
4
9
*/