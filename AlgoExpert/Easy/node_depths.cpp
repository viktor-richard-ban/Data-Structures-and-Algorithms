#include <iostream>
#include <vector>
#include <utility>

using namespace std;

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
int nodeDepths(BinaryTree* root) {
    if (root == nullptr) return 0;

    int depth = 1;
    int depths = 0;
    vector<BinaryTree*> nodes;
    nodes.push_back(root);

    while (nodes.size() > 0) {
        vector<BinaryTree*> currentNodes;

        for (BinaryTree* node : nodes) {
            if (node->left != nullptr) {
                currentNodes.push_back(node->left);
            }
            if (node->right != nullptr) {
                currentNodes.push_back(node->right);
            }
        }

        nodes = currentNodes;
        depths += depth * currentNodes.size();
        depth++;
    }

    return depths;
}

int nodeDepths2(BinaryTree* root) {
    if (root == nullptr) return 0;
    
    int depths = 0;
    stack<pair<BinaryTree*, int>> nodes;
    nodes.push(pair(root, 0));

    while (!nodes.empty()) {
        pair<BinaryTree*, int> node = nodes.top();
        nodes.pop();

        depths += node.second;
        if (node.first->left != nullptr) {
            nodes.push(pair(node.first->left, node.second+1));
        }
        if (node.first->right != nullptr) {
            nodes.push(pair(node.first->right, node.second+1));
        }

    }

    return depths;
}

int main() {
    BinaryTree* root = new BinaryTree(1);
    root->left = new BinaryTree(2);
    root->left->left = new BinaryTree(4);
    root->left->left->left = new BinaryTree(8);
    root->left->left->right = new BinaryTree(9);
    root->left->right = new BinaryTree(5);
    root->right = new BinaryTree(3);
    root->right->left = new BinaryTree(6);
    root->right->right = new BinaryTree(7);

    cout << nodeDepths(root) << endl;
    cout << nodeDepths2(root) << endl;
}

/*
Result of code
16
16
*/