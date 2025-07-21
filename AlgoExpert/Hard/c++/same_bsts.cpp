#include <vector>
#include <iostream>

using namespace std;

vector<int> elementsLessThan(int value, vector<int> array);
vector<int> elementsHigherThanOrEqualTo(int value, vector<int> array);

// Time: O(n^2)   Space: O(n^2)
// n: number of nodes
// Space optimization is possible. We can pass the same array with min and max parameters that would make space complexity O(d)
// d: depth of tree
bool sameBsts(vector<int> arrayOne, vector<int> arrayTwo) {
  if (arrayOne.size() != arrayTwo.size()) { return false; }
  if (arrayOne.size() == 0) { return true; }
  if (arrayOne[0] != arrayTwo[0]) { return false; }

  vector<int> leftOne = elementsLessThan(arrayOne[0], arrayOne);
  vector<int> rightOne = elementsHigherThanOrEqualTo(arrayOne[0], arrayOne);

  vector<int> leftTwo = elementsLessThan(arrayOne[0], arrayTwo);
  vector<int> rightTwo = elementsHigherThanOrEqualTo(arrayOne[0], arrayTwo);;
  
  return sameBsts(leftOne, leftTwo) && sameBsts(rightOne, rightTwo);
}

vector<int> elementsLessThan(int value, vector<int> array) {
  vector<int> elements;

  for (int i = 1; i < array.size(); i++) {
    if (array[i] < value) {
      elements.push_back(array[i]);
    }
  }

  return elements;
}

vector<int> elementsHigherThanOrEqualTo(int value, vector<int> array) {
  vector<int> elements;

  for (int i = 1; i < array.size(); i++) {
    if (array[i] >= value) {
      elements.push_back(array[i]);
    }
  }

  return elements;
}

int main() {
    vector<int> arrayOne = {10, 15, 8, 12, 94, 81, 5, 2, 11};
    vector<int> arrayTwo = {10, 8, 5, 15, 2, 12, 11, 94, 81};
    cout << sameBsts(arrayOne, arrayTwo) << endl;
}

/*
 Result of code:
 
 1
 */