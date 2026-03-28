#include <iostream>
#include <unordered_set>

using namespace std;

void print(int matrix[3][5]);

// Time: O(M + N)
// Space: O(1)
void zeroMatrix(int matrix[3][5]) {
    for (int y = 0; y < 3; y++) {
        for (int x = 0; x < 5; x++) {
            if (matrix[y][x] == 0) {
                matrix[y][0] = 0;
                matrix[0][x] = 0;
            }
        }
    }

    for (int y = 0; y < 3; y++) {
        for (int x = 0; x < 5; x++) {
            if (matrix[y][0] == 0 || matrix[0][x] == 0) {
                matrix[y][x] = 0;
            }
        }
    }

    print(matrix);
}

void print(int matrix[3][5]) {
    for (int y = 0; y < 3; y++) {
        for (int x = 0; x < 5; x++) {
            cout << matrix[y][x] << ", ";
        }
        cout << endl;
    }
}

int main() {
    int matrix[3][5] = {
        {5,1,2,3,4},
        {5,4,3,2,0},
        {1,1,1,1,1}
    };
    zeroMatrix(matrix);
}

/*
 Result of the code:
 */