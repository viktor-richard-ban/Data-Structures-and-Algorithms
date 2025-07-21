#include <vector>
#include <algorithm>
#include <iostream>

using namespace std;

// Time: O(n^2)
// Space: O(n)
vector<vector<int>> threeNumberSum(vector<int> array, int targetSum) {
  vector<vector<int>> triplets;
  sort(array.begin(), array.end());

  for (int i = 0; i < array.size() - 2; i++) {
    int left = i + 1;
    int right = array.size() - 1;
    while (left < right) {
      int currentSum = array[i] + array[left] + array[right];
      if (currentSum > targetSum) {
        right--;
      } else if (currentSum < targetSum) {
        left++;
      } else {
        triplets.push_back({array[i], array[left], array[right]});
        left++;
        right--;
      }
    }
  }
  
  return triplets;
}

void print(vector<int> array) {
    cout << "{";
    for (size_t i = 0; i < array.size(); ++i) {
        cout << array[i];
        if (i != array.size() - 1) {
            cout << ", ";
        }
    }
    cout << "}";
}

int main() {
    vector<int> array = {12, 3, 1, 2, -6, 5, -8, 6};
    vector<vector<int>> threeNumberSums = threeNumberSum(array, 0);
    cout << "{";
    for (size_t i = 0; i < threeNumberSums.size(); ++i) {
        print(threeNumberSums[i]);
        if (i != threeNumberSums.size() - 1) {
            cout << ", ";
        }
    }
    cout << "}" << endl;
}