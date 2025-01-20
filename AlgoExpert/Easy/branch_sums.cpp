#include <iostream>
#include <vector>

using namespace std;

// This is the class of the input root. Do not edit it.
class BinaryTree {
 public:
  int value;
  BinaryTree* left;
  BinaryTree* right;

  BinaryTree(int value) {
    this->value = value;
    left = nullptr;
    right = nullptr;
  }
};

// Time: O(n),  Space: O(n)
// n = number of nodes
vector<int> branchSums(BinaryTree* root) {
  if (root->left == nullptr && root->right == nullptr) {
    return { root->value };
  }
  
  vector<int> sums;
  if (root->left != nullptr) {
    root->left->value += root->value;
    vector<int> leftSum = branchSums(root->left);
    sums.insert(sums.end(), leftSum.begin(), leftSum.end());
  }
  if (root->right != nullptr) {
    root->right->value += root->value;
    vector<int> rightSum = branchSums(root->right);
    sums.insert(sums.end(), rightSum.begin(), rightSum.end());
  }
  return sums;
}

// Only for testing purpose 
class TestBinaryTree : public BinaryTree {
 public:
  TestBinaryTree(int value) : BinaryTree(value){};

  BinaryTree* insert(vector<int> values, int i = 0) {
    if (i >= values.size()) return nullptr;
    vector<BinaryTree*> queue = {this};
    while (queue.size() > 0) {
      BinaryTree* current = queue[0];
      queue.erase(queue.begin());
      if (current->left == nullptr) {
        current->left = new BinaryTree(values[i]);
        break;
      }
      queue.push_back(current->left);
      if (current->right == nullptr) {
        current->right = new BinaryTree(values[i]);
        break;
      }
      queue.push_back(current->right);
    }
    insert(values, i + 1);
    return this;
  }
};

int main() {
    TestBinaryTree* tree = new TestBinaryTree(1);
    tree->insert({2, 3, 4, 5, 6, 7, 8, 9, 10});
    vector<int> sums = branchSums(tree);

    for (int sum : sums) {
        cout << sum << " ";
    }
    cout << endl;
}

/*
Result of code

15 16 18 10 11
*/