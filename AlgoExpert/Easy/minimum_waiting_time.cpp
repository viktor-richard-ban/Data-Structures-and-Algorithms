#include <vector>
#include<algorithm>
#include <iostream>

using namespace std;

// Time: O(n log n),  Space: O(n)
int minimumWaitingTime(vector<int> queries) {
  sort(queries.begin(), queries.end());

  int sum = 0;
  int index = 0;

  for (int query : queries) {
    sum += query * (queries.size() - (index + 1));;
    index++;
  }
  
  return sum;
}

// Time: O(n log n),  Space: O(n)
int minimumWaitingTime2(vector<int> queries) {
  sort(queries.begin(), queries.end());

  int sum = 0;
  int index = 0;

  for (int query : queries) {
    sum += query * (queries.size() - (index + 1));;
    index++;
  }
  
  return sum;
}

int main() {
    vector<int> array = {3, 2, 1, 2, 6};
    cout << minimumWaitingTime(array) << endl;
    cout << minimumWaitingTime2(array) << endl;
}

/*
 Result of code:
 
 17
 17
 */