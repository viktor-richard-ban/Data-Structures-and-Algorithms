/*

Constraints

1. The number of nodes in the list is sz.
2. 1 <= sz <= 30
3. 0 <= Node.val <= 100
4. 1 <= n <= sz

*/


// Time: O(n)
// Space: O(1)
func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
    let dummy = ListNode(0)
    dummy.next = head

    var slow: ListNode? = dummy
    var fast: ListNode? = dummy
    for _ in 1...n {
        fast = fast?.next
    }

    while fast?.next != nil {
        slow = slow?.next
        fast = fast?.next
    }
    slow?.next = slow?.next?.next

    return dummy.next
}