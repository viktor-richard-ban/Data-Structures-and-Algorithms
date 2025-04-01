#include <iostream>

class Node {
public:
    int value;
    Node* next;

    Node(int val) : value(val) {}
};

// Time: O(n)
// Space: O(1)
// n: length of the list
Node* kthToLast(Node* head, int k) {
    Node* slow = head;
    Node* fast = head;
    for (int i = 0; i != k; i++) {
        fast = fast->next;
    }

    while (fast->next != nullptr) {
        slow = slow->next;
        fast = fast->next;
    }

    return slow;
}

struct Result {
    Node* node;
    int nth;

    Result(Node* node, int nth) {
        this->node = node;
        this->nth = nth;
    }
};

// Time: O(n)
// Space: O(n)
// n: length of the list
Result kthToLastRecursive(Node* head, int k) {
    if (head->next == nullptr) {
        return Result(head, 0);
    }
    Result result = kthToLastRecursive(head->next, k);
    if (result.nth == k) {
        return result;
    }
    result.node = head;
    result.nth++;
    return result;
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

    Node* node = head;
    while (node->next != nullptr) {
        std::cout << node->value << " - ";
        node = node->next;
    }
    std::cout << node->value << std::endl;

    Node* result = kthToLast(head, 2);
    std::cout << "2th to last: " << result->value << std::endl;
    Result recusiveResult = kthToLastRecursive(head, 2);
    std::cout << "2th to last recursively: " << recusiveResult.node->value << std::endl; 
}

/*
Result of the code:
 
1 - 2 - 3 - 4 - 5
2th to last: 3
2th to last recursively: 3
*/