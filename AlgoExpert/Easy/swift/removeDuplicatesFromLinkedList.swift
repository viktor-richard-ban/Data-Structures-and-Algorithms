class LinkedList {
  var value: Int
  var next: LinkedList?

  init(_ value: Int) {
    self.value = value
  }

  func printNodes() {
    var node: LinkedList? = self
    var result = ""
    while node != nil {
      result += "\(node!.value)"
      node = node?.next
      if node != nil {
        result += " - "
      }
    }
    print(result)
  }
}

// Time: O(n) - Space: O(1)
func removeDuplicatesFromLinkedList(_ linkedList: LinkedList) -> LinkedList {
  var mutableLinkedList: LinkedList? = linkedList
  while mutableLinkedList?.next != nil {
    if mutableLinkedList?.value == mutableLinkedList?.next?.value {
      mutableLinkedList?.next = mutableLinkedList?.next?.next
      continue
    }
    mutableLinkedList = mutableLinkedList?.next
  }
  
  return linkedList
}

// Tests
let one = LinkedList(1)
let secondOne = LinkedList(1)
one.next = secondOne
let two = LinkedList(2)
secondOne.next = two

print("Before")
one.printNodes()
_ = removeDuplicatesFromLinkedList(one)
print("after")
one.printNodes()