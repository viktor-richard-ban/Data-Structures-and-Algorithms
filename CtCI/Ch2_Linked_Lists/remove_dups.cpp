#include <unordered_set>
#include <iostream>

class Node {
public:
    int value;
    Node* next;

    Node(int val) : value(val) {}
};

// Time: O(n) - Space: O(n)
void removeDups(Node* head) {
    std::unordered_set<int> set;
    Node* node = head;

    set.insert(node->value);
    
    while (node->next != nullptr) {
        if (set.contains(node->next->value)) {
            node->next = node->next->next;
        } else {
            set.insert(node->next->value);
            node = node->next;
        }
    }
}

int main() {
    Node* head = new Node(2);
    Node* second = new Node(1);
    head->next = second;
    Node* third = new Node(1);
    second->next = third;
    Node* fourth = new Node(1);
    third->next = fourth;

    removeDups(head);

    Node* node = head;
    while (node != nullptr) {
        std::cout << node->value << " ";
        node = node->next;
    }
    std::cout << std::endl;
}

/*
 Result of the code:
 
2 1 
 */