#include <iostream>

using namespace std;

// Time: O(n)
// Space: O(1)
int bestSeat(vector<int> seats) {
    int maxZeros = 0;
    int bestIndex = -1;
    int zeros = 0;
    
    for (int i = 0; i < seats.size(); i++) {
        if (seats[i] == 1) {
            zeros = 0;
            continue;
        }

        zeros++;
        if (zeros > maxZeros) {
            float bestSeatIndex = (float)(i + (i-zeros)) / 2;
            maxZeros = zeros;
            bestIndex = round(bestSeatIndex);
        }
    }
    
    return bestIndex;
}

int main() {
    vector<int> array = {1,0,1,0,0,0,1,0,0,0,1};
    cout << bestSeat(array) << endl;
}

/*
 Result of code:
 
 4
 */