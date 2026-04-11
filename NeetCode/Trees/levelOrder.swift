/*

Constraints

0 <= The number of nodes in the tree <= 1000.
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
// Space: O(w)
// w: max width
func levelOrder(_ root: TreeNode?) -> [[Int]] {
    guard let root else { return [] }
    var result: [[Int]] = []
    var nodes: [TreeNode] = [root]

    while !nodes.isEmpty {
        var newNodes: [TreeNode] = []
        for node in nodes {
            if let left = node.left {
                newNodes.append(left)
            }
            if let right = node.right {
                newNodes.append(right)
            }
        }
        result.append(nodes.map { $0.val })
        nodes = newNodes
    }

    return result
}