#include <vector>
#include <queue>
#include <iostream>

class Node {
public:
    int value;
    bool isVisited = false;
    std::vector<Node*> children;

    Node(int val) : value(val) {}
};

bool routeBetweenNodesBFS(Node* start, Node* end) {
    std::queue<Node*> nodes;
    nodes.push(start);

    while (nodes.size() > 0) {
        Node* currentNode = nodes.front();
        nodes.pop();
        currentNode->isVisited = true;

        std::cout << currentNode->value << std::endl;

        if (currentNode == end) {
            return true;
        }

        for (Node* child : currentNode->children) {
            if (!child->isVisited) {
                nodes.push(child);
            }
        }
    }

    return false;
}

bool routeBetweenNodesDFS(Node* start, Node* end) {
    start->isVisited = true;
    std::cout << start->value << std::endl;

    if (start == end) {
        return true;
    }

    bool found = false;
    for (Node* child : start->children) {
        if (!child->isVisited) {
            found |= routeBetweenNodesDFS(child, end);
        }
    }

    return found;
}

int main() {
    Node* start = new Node(0);;
    Node* second = new Node(1);
    Node* third = new Node(2);
    Node* fourth = new Node(3);
    Node* end = new Node(4);

    start->children = {second};
    second->children = {third};
    third->children = {fourth, start};
    fourth->children = {third};
    end->children = {fourth};

    std::cout << "BFS: " << std::endl << ((routeBetweenNodesBFS(start, end) == 1) ? "True" : "False") << std::endl;
    std::cout << std::endl;

    start->isVisited = false;
    second->isVisited = false;
    third->isVisited = false;
    fourth->isVisited = false;
    end->isVisited = false;
    start->children.push_back(end);
    std::cout << "BFS: " << std::endl << ((routeBetweenNodesBFS(start, end) == 1) ? "True" : "False") << std::endl;
    std::cout << std::endl;


    start->isVisited = false;
    second->isVisited = false;
    third->isVisited = false;
    fourth->isVisited = false;
    end->isVisited = false;
    std::cout << "DFS: " << std::endl << ((routeBetweenNodesDFS(start, end) == 1) ? "True" : "False") << std::endl;
}

/*
 Result of the code:

 BFS: 
0
1
2
3
False

BFS: 
0
1
2
3
False

DFS: 
0
1
2
3
False
 */