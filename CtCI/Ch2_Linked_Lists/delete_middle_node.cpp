#include <iostream>

class Node {
public:
    int value;
    Node* next = nullptr;

    Node(int val) : value(val) {}

    void print() {
        Node* node = this;
        while (node->next != nullptr) {
            std::cout << node->value << " - ";
            node = node->next;
        }
        std::cout << node->value << std::endl;
    }
};

// Time: O(1)
// Space: O(1)
void deleteMiddleNode(Node* node) {
    if (node == nullptr || node->next == nullptr) return;
    node->value = node->next->value;
    node->next = node->next->next;
}

int main() {
    Node* head = new Node(1);
    Node* second = new Node(2);
    head->next = second;
    Node* third = new Node(3);
    second->next = third;
    Node* fourth = new Node(4);
    third->next = fourth;
    Node* fifth = new Node(5);
    fourth->next = fifth;

    std::cout << "From " << std::endl;
    head->print();

    std::cout << "To " << std::endl;
    deleteMiddleNode(third);
    head->print();

    std::cout << "To " << std::endl;
    deleteMiddleNode(fifth);
    head->print();
}

/*
Result of the code:
 
From 
1 - 2 - 3 - 4 - 5
To 
1 - 2 - 4 - 5
To 
1 - 2 - 4 - 5
*/