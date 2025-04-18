#include <vector>
using namespace std;

class BST {
 public:
  int value;
  BST* left;
  BST* right;

  BST(int val);
};

// Time: O(n)   Space: O(d)
void inOrderTraverse(BST* tree, vector<int>& array) {
  if (tree == nullptr) { return; }
  inOrderTraverse(tree->left, array);
  array.push_back(tree->value);
  inOrderTraverse(tree->right, array);
}

// Time: O(n)   Space: O(d)
void preOrderTraverse(BST* tree, vector<int>& array) {
  if (tree == nullptr) { return; }
  array.push_back(tree->value);
  preOrderTraverse(tree->left, array);
  preOrderTraverse(tree->right, array);
}

// Time: O(n)   Space: O(d)
void postOrderTraverse(BST* tree, vector<int>& array) {
  if (tree == nullptr) { return; }
  postOrderTraverse(tree->left, array);
  postOrderTraverse(tree->right, array);
  array.push_back(tree->value);
}
