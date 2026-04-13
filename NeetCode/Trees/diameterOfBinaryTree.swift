/*
Constraints

1 <= number of nodes in the tree <= 100
-100 <= Node.val <= 100

*/

// Time: O(n)
// Time: O(h)
func diameterOfBinaryTree(_ root: TreeNode?) -> Int {
    var diameter = 0

    func dfs(_ root: TreeNode?) -> Int {
        guard let root else { return 0 }
        let left = dfs(root.left)
        let right = dfs(root.right)
        diameter = max(diameter, left + right)
        return max(left, right) + 1
    }

    dfs(root)
    return diameter
}