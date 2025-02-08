#include <vector>
#include <iostream>

class Node {
public:
    int value;
    Node* left;
    Node* right;

    Node(int val) : value(val) {}
    Node(int val, Node* left, Node* right) : value(val), left(left), right(right) {}
};

void bfs(Node* head) {
    if (head == nullptr) { return; }
    std::vector<Node*> nodes;
    nodes.push_back(head);

    while (nodes.size() > 0) {
        std::vector<Node*> newNodes;

        for (Node* node : nodes) {
            if (node == nullptr) {
                std::cout << "x" << " ";
                continue;
            }

            std::cout << node->value << " ";
            newNodes.push_back(node->left);
            newNodes.push_back(node->right);
        }

        std::cout << std::endl;

        nodes = newNodes;
    }
}

Node* minimalTree(std::vector<int> nodes) {
    if (nodes.size() == 0) {
        return nullptr;
    }

    int middleIndex = (nodes.size()) / 2;
    Node* head = new Node(nodes[middleIndex]);

    std::vector<int> leftNodes(nodes.begin(), nodes.begin() + middleIndex);
    head->left = minimalTree(leftNodes);

    std::vector<int> rightNodes(nodes.begin() + middleIndex + 1, nodes.end());
    head->right = minimalTree(rightNodes);

    return head;
}

int main() {
    Node* head = new Node(0);
    Node* one = new Node(1);
    Node* two = new Node(2);
    Node* three = new Node(3);
    Node* four = new Node(4);
    Node* five = new Node(5);

    head->left = one;
    head->right = two;
    one->left = three;
    one->right = four;
    two->left = five;

    bfs(head);
    std::cout << std::endl;

    std::vector<int> nodes = {2,4,6,8,10,20};
    bfs(minimalTree(nodes));
}

/*
 Result of the code:

0 
1 2 
3 4 5 x 
x x x x x x 

8 
4 20 
2 6 10 x 
x x x x x x 
 */