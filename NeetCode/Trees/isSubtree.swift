/*

Constraints

1 <= The number of nodes in both trees <= 100.
-100 <= root.val, subRoot.val <= 100

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

// Time: O(m * n)
// Space: O(h_root + h_subRoot)
// m: size of root
// n: size of subRoot
// h_: height of tree
func isSubtree(_ root: TreeNode?, _ subRoot: TreeNode?) -> Bool {
    guard let root, let subRoot else { return false }
    if isSameTree(root, subRoot) {
        return true
    }
    let isLeftSameTree = isSubtree(root.left, subRoot)
    let isRightSameTree = isSubtree(root.right, subRoot)
    return isLeftSameTree || isRightSameTree
}

private func isSameTree(_ p: TreeNode?, _ q: TreeNode?) -> Bool {
    if p == nil && q == nil { return true }
    if let p, let q, p.val == q.val {
        let isLeftSame = isSameTree(p.left, q.left)
        let isRightSame = isSameTree(p.right, q.right)
        return isLeftSame && isRightSame
    }
    return false
}