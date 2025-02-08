class BST {
 public:
  int value;
  BST* left;
  BST* right;

  BST(int val);
  BST& insert(int val);
};

// Time: O(n)   Space: O(d)
// n: number of nodes
// d: depth of tree
bool validateSubtree(BST* tree, int min, int max) {
  if (tree == nullptr) {
    return true;
  }
  if (tree->value > max || tree->value < min) {
    return false;
  }

  bool isValidSubtree = true;
  isValidSubtree &= validateSubtree(tree->left, min, tree->value-1);
  isValidSubtree &= validateSubtree(tree->right, tree->value, max);
  return isValidSubtree;
}

bool validateBst(BST* tree) {
  return validateSubtree(tree, INT_MIN, INT_MAX);
}
