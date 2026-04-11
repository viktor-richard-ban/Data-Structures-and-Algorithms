/*

Constraints

2 <= The number of nodes in the tree <= 100.
-100 <= Node.val <= 100
p != q
p and q will both exist in the BST.

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

// Time: O(h)
// Space: O(h)
// h: height of the tree
func lowestCommonAncestor(_ root: TreeNode?, _ p: TreeNode?, _ q: TreeNode?) -> TreeNode? {
    guard let root, let p, let q else { return nil }

    if root.val > p.val && root.val > q.val {
        return lowestCommonAncestor(root.left, p, q)
    } else if root.val < p.val && root.val < q.val {
        return lowestCommonAncestor(root.right, p, q)
    }

    return root
}