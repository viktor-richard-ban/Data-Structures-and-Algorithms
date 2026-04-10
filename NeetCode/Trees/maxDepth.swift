/*
Constraints

0 <= The number of nodes in the tree <= 100.
-100 <= Node.val <= 100

* Definition for a binary tree node.
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
// Space: O(h)
// h: height of the tree
func maxDepth(_ root: TreeNode?) -> Int {
    guard let root else { return 0 }
    let leftDepth = maxDepth(root.left)
    let rightDepth = maxDepth(root.right)
    return 1 + max(leftDepth, rightDepth)
}

// Time: O(n)
// Space: O(w)
// w: max width of the tree
func maxDepth(_ root: TreeNode?) -> Int {
    guard let root else { return 0 }
    var depth = 0
    var nodes: [TreeNode] = [root]

    while !nodes.isEmpty {
        var newNodes: [TreeNode] = []
        for node in nodes {
            if let left = node.left {
                newNodes.append(left)
            }
            if let right = node.right {
                newNodes.append(right)
            }
        }
        nodes = newNodes
        depth += 1
    }

    return depth
}