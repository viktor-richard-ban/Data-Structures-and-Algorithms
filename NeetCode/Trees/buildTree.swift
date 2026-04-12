/*

Constraints

1 <= inorder.length <= 1000.
inorder.length == preorder.length
-1000 <= preorder[i], inorder[i] <= 1000

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

// Time: O(n) balanced, O(n^2) worst-case
// Space: O(n + h) -> O(h)
func buildTree(_ preorder: [Int], _ inorder: [Int]) -> TreeNode? {
    var inorderIndices: [Int: Int] = [:]
    for (index, val) in inorder.enumerated() {
        inorderIndices[val] = index
    }

    func buildSubtree(_ preIndex: Int, _ left: Int, _ right: Int) -> TreeNode? {
        guard right < preorder.count && left <= right else { return nil }

        let root = TreeNode(preorder[preIndex])
        let rootNodeInorderIndex = inorderIndices[root.val]!

        root.left = buildSubtree(preIndex + 1, left, rootNodeInorderIndex - 1)
        let nextPreIndex = preIndex + rootNodeInorderIndex - left + 1
        root.right = buildSubtree(nextPreIndex, rootNodeInorderIndex + 1, right)

        return root
    }
    
    return buildSubtree(0, 0, inorder.count - 1)
}