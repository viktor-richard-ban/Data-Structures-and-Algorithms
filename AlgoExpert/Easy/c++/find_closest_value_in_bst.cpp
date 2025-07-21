#include<algorithm>
#include <iostream>

using namespace std;

class BST {
 public:
  int value;
  BST* left;
  BST* right;

  BST(int val) : value(val), left(nullptr), right(nullptr) {}
  BST& insert(int val) {
    if (val < value) {
      if (left == nullptr) {
        left = new BST(val);
      } else {
        left->insert(val);
      }
    } else {
      if (right == nullptr) {
        right = new BST(val);
      } else {
        right->insert(val);
      }
    }
    return *this;
  }
};

int findClosestValueInBst(BST* tree, int target) {
  int closest = tree->value;

  if (tree->value < target && tree->right != NULL) {
    int rightClosest = findClosestValueInBst(tree->right, target);
    if (abs(rightClosest - target) < abs(closest - target)) {
      return rightClosest;
    }
  } else if (tree->value > target && tree->left != NULL) {
    int leftClosest = findClosestValueInBst(tree->left, target);
    if (abs(leftClosest - target) < abs(closest - target)) {
      return leftClosest;
    }
  }
  
  return closest;
}

int main() {
    BST root(10);

    // Insert 9 additional nodes
    root.insert(5)
      .insert(15)
      .insert(2)
      .insert(5)
      .insert(15)
      .insert(13)
      .insert(22)
      .insert(1)
      .insert(14);
    cout << findClosestValueInBst(&root, 12) << endl;
}

/*
 Result of code:
 
 1
 0
 */