/*

Constraints

0 <= The number of nodes in both trees <= 100.
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
// Space: O(h)
// h: height of the tree - worst: O(n), best: O(log n)
func isSameTree(_ p: TreeNode?, _ q: TreeNode?) -> Bool {
    if p == nil && q == nil { return true }
    if let p, let q, p.val == q.val {
        let isLeftSame = isSameTree(p.left, q.left)
        let isRightSame = isSameTree(p.right, q.right)
        return isLeftSame && isRightSame
    }
    return false
}