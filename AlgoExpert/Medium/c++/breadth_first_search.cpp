#include <vector>
#include <queue>
using namespace std;

// Do not edit the class below except
// for the breadthFirstSearch method.
// Feel free to add new properties
// and methods to the class.
class Node {
 public:
  string name;
  vector<Node*> children;

  Node(string str) { name = str; }

  vector<string> breadthFirstSearch(vector<string>* array) {
    array->push_back(name);
    
    queue<Node*> nodes;
    for (Node* child : children) {
      nodes.push(child);
    }

    while (nodes.size() > 0) {
      Node* node = nodes.front();
      nodes.pop();

      array->push_back(node->name);

      for (Node* child : node->children) {
        nodes.push(child);
      }
    }
    
    return *array;
  }

  Node* addChild(string name) {
    Node* child = new Node(name);
    children.push_back(child);
    return this;
  }
};
