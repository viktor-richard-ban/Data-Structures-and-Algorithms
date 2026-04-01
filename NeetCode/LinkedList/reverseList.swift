/*
Constraints

1. 0 <= The length of the list <= 1000.
2. -1000 <= Node.val <= 1000

*/

class ListNode {
    var val: Int
    var next: ListNode?
    init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}

// Time: O(n)
// Time: O(1)
func reverseList(_ head: ListNode?) -> ListNode? {
    var current = head
    var last: ListNode?
    var next = current?.next
    while current != nil {
        next = current?.next
        current?.next = last
        last = current
        current = next
    }
    return last
}

let first = ListNode(0)
let second = ListNode(1)
first.next = second
let third = ListNode(2)
second.next = third

var current: ListNode? = reverseList(first)
while current != nil {
    print(current!.val)
    current = current?.next
}