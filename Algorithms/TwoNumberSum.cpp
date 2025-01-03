#include <vector>
#include <iostream>
#include <map>
#include <set>

using namespace std;

// Time: O(n^2), Space: O(1)
vector<int> twoNumberSum1(vector<int> array, int targetSum) {
  for(int i = 0; i < array.size(); i++) {
    for(int j = 0; j < array.size(); j++) {
      if (i == j)
        continue;

      if (array[i] + array[j] == targetSum)
         return {array[i], array[j]};
    }
  }
  return {};
}

// Time: O(2n), Space: O(n)
vector<int> twoNumberSum2(vector<int> array, int targetSum) {
    // map<remainedValue, onIndex>
    map<int, int> remainedValues;

    for(int i = 0; i < array.size(); i++) {
        remainedValues[targetSum - array[i]] = i;
    }

    for(int i = 0; i < array.size(); i++) {
        if (remainedValues.find(array[i]) != remainedValues.end() && remainedValues[array[i]] != i)
            return { array[i], targetSum - array[i]};
    }
      
    return {};
}

// Time: O(n), Space: O(n)
vector<int> twoNumberSum3(vector<int> array, int targetSum) {
    set<int> remainingValues;

    for (int i=0; i < array.size(); i++) {
        if (remainingValues.find(targetSum - array[i]) != remainingValues.end()) {
            return { array[i], targetSum - array[i] };
        }

        remainingValues.insert(array[i]);
    }

    return {};
}

// Time: O(n log n), Space: O(1)
vector<int> twoNumberSum4(vector<int> array, int targetSum) {
    int l = 0, r = array.size() - 1;
    sort(array.begin(), array.end());

    while (l < r) {
        if (array[l] + array[r] == targetSum) {
            return {array[l], array[r]};
        } else if (array[l] + array[r] > targetSum) {
            r--;
        } else {
            l++;
        }
    }

    return {};
}

int main() {
    vector<int> array = {5, 1, 7, 4, 3, 9};
    int targetSum = 10;
    
    vector<int> result = twoNumberSum1(array, targetSum);
    cout << "twoNumberSum1: ";
    for (int i = 0; i < result.size(); i++) {
        cout << result[i] << " ";
    }
    cout << endl;
    
    result = twoNumberSum2(array, targetSum);
    cout << "twoNumberSum2: ";
    for (int i = 0; i < result.size(); i++) {
        cout << result[i] << " ";
    }
    cout << endl;
    
    result = twoNumberSum3(array, targetSum);
    cout << "twoNumberSum3: ";
    for (int i = 0; i < result.size(); i++) {
        cout << result[i] << " ";
    }
    cout << endl;
    
    result = twoNumberSum4(array, targetSum);
    cout << "twoNumberSum4: ";
    for (int i = 0; i < result.size(); i++) {
        cout << result[i] << " ";
    }
    cout << endl;
}

/*
 Result of code:
 
 twoNumberSum1: 1 9
 twoNumberSum2: 1 9
 twoNumberSum3: 3 7
 twoNumberSum4: 1 9
 */
