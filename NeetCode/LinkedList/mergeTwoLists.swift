/**
Definition for singly-linked list.
class ListNode {
    var val: Int
    var next: ListNode?
    init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}

Constraints

1. 0 <= The length of the each list <= 100.
2. -100 <= Node.val <= 100

 */

// Recursion
// Time: O(n + k)
// Space: O(n + k)
// n: length of list1
// k: length of list2
func mergeTwoLists_recursive(_ list1: ListNode?, _ list2: ListNode?) -> ListNode? {
    var head: ListNode?

    if let list1, let list2, list1.val <= list2.val {
        head = list1
        head?.next = mergeTwoLists(head?.next, list2)
    } else if let list1, let list2, list1.val > list2.val {
        head = list2
        head?.next = mergeTwoLists(list1, head?.next)
    } else if let list1 {
        return list1
    } else if let list2 {
        return list2
    }

    return head
}

// No Recursion
// Time: O(n + k)
// Space: O(1)
func mergeTwoLists(_ list1: ListNode?, _ list2: ListNode?) -> ListNode? {
    var head: ListNode = ListNode(0)
    var cList1: ListNode? = list1
    var cList2: ListNode? = list2

    var current: ListNode? = head
    while current != nil {
        if (cList1 != nil && cList2 != nil && cList1!.val <= cList2!.val) || (cList1 != nil && cList2 == nil) {
            current?.next = cList1
            cList1 = cList1?.next
        } else if (cList1 != nil && cList2 != nil && cList1!.val > cList2!.val) || (cList2 != nil && cList1 == nil) {
            current?.next = cList2
            cList2 = cList2?.next
        }
        current = current?.next
    }

    return head.next
}