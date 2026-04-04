/*

Constraints

1. 1 <= Length of the list <= 1000.
2. 1 <= Node.val <= 1000

Example

Input: [0, 1, 2, 3, 4, 5, 6]
Output: [0, 6, 1, 5, 2, 4, 3]

*/


// Time: O(n^2)
// Space: O(n)
func reorderList_recursive(_ head: ListNode?) {
    guard head != nil else { return }
    let oldNext = head?.next
    
    // Find last - 1 node
    var newLast = head
    while newLast?.next?.next != nil {
        newLast = newLast?.next
    }
    if newLast === head { return }
    
    let last = newLast?.next
    newLast?.next = nil

    head?.next = last
    last?.next = oldNext
    reorderList(oldNext)
}

// Time: O(n)
// Space: O(1)
func reorderList(_ head: ListNode?) {
    // Find middle node (slow)
    var slow = head
    var fast = head
    while fast?.next != nil && fast?.next?.next != nil {
        slow = slow?.next
        fast = fast?.next?.next
    }
    var secondHalf = slow?.next
    slow?.next = nil


    // Reverse the second half of the list
    var last: ListNode?
    while secondHalf != nil {
        var next = secondHalf?.next
        secondHalf?.next = last
        last = secondHalf
        secondHalf = next
    }

    // Until left doesn't reach the end, move elements to the right side to the left
    var left = head
    var right = last
    while right != nil {
        let newR = right?.next
        let newL = left?.next
        left?.next = right
        right?.next = newL
        left = newL
        right = newR
    }
}