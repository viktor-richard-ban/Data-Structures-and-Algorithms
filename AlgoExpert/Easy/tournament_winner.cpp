#include <vector>
#include <map>
#include <string>
#include <iostream>

using namespace std;

// Time: O(n), Space: O(k)  =>  n: competitions; k: teams
string tournamentWinner(
  vector<vector<string>> competitions, vector<int> results
) {
  map<string, int> points;
  int maxPoint = 0;
  string champion = "";
  
  for (int i = 0; i < results.size(); i++) {
    int result = (results[i] == 0) ? 1 : 0;
    string winner = competitions[i][result];

    if (points.find(winner) == points.end()) {
      points[winner] = 3;
    } else {
      points[winner] += 3;
    }

    if (points[winner] > maxPoint) {
      maxPoint = points[winner];
      champion = winner;
    }
  }
  
  return champion;
}

int main() {
    vector<vector<string>> competitions = {{"HTML", "C#"}, {"C#", "Python"}, {"Python", "HTML"}};
    vector<int> results = {0, 0, 1};
    cout << "Tournament winner: " << tournamentWinner(competitions, results) << endl;
}

/*
 Result of code:
 
Tournament winner: Python
 */