#include <iostream>

class Node {
public:
    int value;
    Node* next;

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

// Time: O(n) - Space: O(1)
Node* partition(Node* head, int partition) {
    Node* lessThanXHead = nullptr;
    Node* lessThanXLast = nullptr;
    Node* greaterThanEqualXHead = nullptr;
    Node* greaterThanEqualXLast = nullptr;

    Node* node = head;
    while (node != nullptr) {
        if (node->value < partition) {
            if (lessThanXLast == nullptr) {
                lessThanXHead = node;
                lessThanXLast = node;
            } else {
                lessThanXLast->next = node;
                lessThanXLast = node;
            }
        } else {
            if (greaterThanEqualXLast == nullptr) {
                greaterThanEqualXHead = node;
                greaterThanEqualXLast = node;
            } else {
                greaterThanEqualXLast->next = node;
                greaterThanEqualXLast = node;
            }
        }
        node = node->next;
    }

    Node* newHead = lessThanXHead;
    if (newHead == nullptr) {
        newHead = greaterThanEqualXHead;
    } else {
        lessThanXLast->next = greaterThanEqualXHead;
    }

    greaterThanEqualXLast->next = nullptr;

    return newHead;
}



int main() {
    Node* head = new Node(3);
    Node* second = new Node(5);
    head->next = second;
    Node* third = new Node(8);
    second->next = third;
    Node* fourth = new Node(5);
    third->next = fourth;
    Node* fifth = new Node(10);
    fourth->next = fifth;
    Node* sixth = new Node(2);
    fifth->next = sixth;
    Node* seventh = new Node(1);
    sixth->next = seventh;

    std::cout << "From: " << std::endl;
    head->print();

    int x = 5;
    Node* newHead = partition(head, x);

    std::cout << "To: " << std::endl;
    newHead->print();
}

/*
 Result of the code:
 
From: 
3 - 5 - 8 - 5 - 10 - 2 - 1
To: 
3 - 2 - 1 - 5 - 8 - 5 - 10
 */