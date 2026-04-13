/*
Constraints

The number of nodes in the tree is in the range [0, 1000].
-1000 <= Node.val <= 1000

*/

// Time: O(n)
// Space: O(h)
// h: height of the tree

func isBalanced(_ root: TreeNode?) -> Bool {
    return dfs(root) != -1
}

func dfs(_ root: TreeNode?) -> Int {
    guard let root else { return 0 }
    let leftDepth = dfs(root.left)
    if leftDepth == -1 { return -1 }
    let rightDepth = dfs(root.right)
    if rightDepth == -1 { return -1 }
    if abs(leftDepth - rightDepth) > 1 {
        return -1
    }

    return max(leftDepth, rightDepth) + 1
}