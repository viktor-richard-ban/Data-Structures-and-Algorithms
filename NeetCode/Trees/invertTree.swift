/*
Constraints

0 <= The number of nodes in the tree <= 100.
-100 <= Node.val <= 100

*/

// Time: O(n)
// Space: O(h)
// h: height of the tree
func invertTree(_ root: TreeNode?) -> TreeNode? {
    guard let root else { return nil }
    let right = root.right
    root.right = invertTree(root.left)
    root.left = invertTree(right)
    return root
}

// Time: O(n)
// Space: O(n) - 
func invertTree(_ root: TreeNode?) -> TreeNode? {
    guard let root else { return nil }
    var nodes: [TreeNode] = [root]

    while !nodes.isEmpty {
        let node = nodes.removeLast()
        if let left = node.left {
            nodes.append(left)
        }
        if let right = node.right {
            nodes.append(right)
        }
        let right = node.right
        node.right = node.left
        node.left = right
    }

    return root
}