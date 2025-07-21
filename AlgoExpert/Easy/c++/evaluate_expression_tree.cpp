#include <iostream>

// This is an input class. Do not edit.
class BinaryTree {
 public:
  int value;
  BinaryTree* left = nullptr;
  BinaryTree* right = nullptr;

  BinaryTree(int value) { this->value = value; }
};

// Time: O(n),  Space: O(h)
// n = size of the input array
// h = height of the tree
int evaluateExpressionTree(BinaryTree* tree) {
  if (tree->value == -1) {
    return evaluateExpressionTree(tree->left) + evaluateExpressionTree(tree->right);
  } else if (tree->value == -2) {
    return evaluateExpressionTree(tree->left) - evaluateExpressionTree(tree->right);
  } else if (tree->value == -3) {
    return evaluateExpressionTree(tree->left) / evaluateExpressionTree(tree->right);
  } else if (tree->value == -4) {
    return evaluateExpressionTree(tree->left) * evaluateExpressionTree(tree->right);
  }
  return tree->value;
}

int main() {
    BinaryTree* root = new BinaryTree(-1);
    root->left = new BinaryTree(-2);
    root->left->left = new BinaryTree(-4);
    root->left->left->left = new BinaryTree(2);
    root->left->left->right = new BinaryTree(3);
    root->left->right = new BinaryTree(2);
    root->right = new BinaryTree(-3);
    root->right->left = new BinaryTree(8);
    root->right->right = new BinaryTree(3);

    std::cout << evaluateExpressionTree(root) << std::endl;
}

/*
 Result of code:
 
 6
 */