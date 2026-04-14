/*

Constraints

0 <= number of nodes in the tree <= 100
-100 <= Node.val <= 100

* class TreeNode {
*     var val: Int
*     var left: TreeNode?
*     var right: TreeNode?
*     init(_ val: Int) {
*         self.val = val
*         self.left = nil
*         self.right = nil
*     }
* }

*/

// Time: O(n)
// Space: O(n)
func rightSideView(_ root: TreeNode?) -> [Int] {
    guard let root else { return [] }
    var result: [Int] = []
    var queue: [TreeNode] = [root]
    var lastIndexInRow = 0
    var index = 0
    
    while index < queue.count {
        let currentNode = queue[index]
        if let left = currentNode.left {
            queue.append(left)
        }
        if let right = currentNode.right {
            queue.append(right)
        }
        if lastIndexInRow == index {
            result.append(currentNode.val)
            lastIndexInRow = queue.count - 1
        }
        index += 1
    }

    return result
}

// Time: O(n)
// Space: O(w)
// w: max width in the tree
func rightSideView(_ root: TreeNode?) -> [Int] {
    guard let root else { return [] }
    var result: [Int] = []
    var queue: [TreeNode] = [root]
    
    while !queue.isEmpty {
        var newQueue: [TreeNode] = []
        for (index, node) in queue.enumerated() {
            if let left = node.left {
                newQueue.append(left)
            }
            if let right = node.right {
                newQueue.append(right)
            }
            if index == queue.count - 1 {
                result.append(node.val)
            }
        }
        queue = newQueue
    }

    return result
}