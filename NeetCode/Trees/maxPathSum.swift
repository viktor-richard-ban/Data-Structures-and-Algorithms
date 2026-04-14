/*

Constraints

1 <= The number of nodes in the tree <= 1000.
-1000 <= Node.val <= 1000

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
func maxPathSum(_ root: TreeNode?) -> Int {
    var maxSum = Int.min

    @discardableResult        
    func dfs(_ root: TreeNode?) -> Int {
        guard let root else { return 0 }
        let left = max(dfs(root.left), 0)
        let right = max(dfs(root.right), 0)
        maxSum = max(maxSum, left + right + root.val)
        return root.val + max(left, right)
    }

    dfs(root)
    return maxSum
}