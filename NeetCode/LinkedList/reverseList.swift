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
// Time: O(n)
func reverseList_recursive(_ head: ListNode?) -> ListNode? {
    func reverse(_ prev: ListNode?, _ head: ListNode?) -> ListNode? {
        let next = head?.next
        head?.next = prev

        if next == nil {
            return head
        }
        return reverse(head, next)
    }

    return reverse(nil, head)
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

var current: ListNode? = reverseList_recursive(first)
while current != nil {
    print(current!.val)
    current = current?.next
}