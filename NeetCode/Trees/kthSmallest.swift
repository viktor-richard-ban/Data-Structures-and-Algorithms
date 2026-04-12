/*

Constraints

1 <= k <= The number of nodes in the tree <= 1000.
0 <= Node.val <= 1000

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
// h: height of tree - min: log n, max: n
func kthSmallest(_ root: TreeNode?, _ k: Int) -> Int {
    var counter = 0
    var result = -1

    func dfs(_ root: TreeNode?) {
        guard let root,
         counter < k else { return }

        dfs(root.left)

        counter += 1
        if counter == k {
            result = root.val
            return
        }
        
        dfs(root.right)
    }

    dfs(root)
    return result
}