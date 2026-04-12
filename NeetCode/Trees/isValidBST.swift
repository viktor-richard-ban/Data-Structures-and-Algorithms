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
func isValidBST(_ root: TreeNode?) -> Bool {
    func isValidBST(_ root: TreeNode?, _ min: Int, _ max: Int) -> Bool {
        guard let root else { return true }
        guard root.val > min, root.val < max else { return false }
        return isValidBST(root.left, min, root.val) && isValidBST(root.right, root.val, max)
    }

    return isValidBST(root, Int.min, Int.max)
}