/*

Constraints

The number of nodes in the tree is in the range [2, 5000].
0 <= Node.val <= 105

*/

// Time: O(n)
// Space: O(h)
func maxAncestorDiff(_ root: TreeNode?) -> Int {
    guard let root else { return 0 }
    var maxAncestorDiff = 0

    func dfs(_ root: TreeNode?, _ minVal: Int, _ maxVal: Int) {
        guard let root else { return }
        let newMin = min(minVal, root.val)
        let newMax = max(maxVal, root.val)
        dfs(root.left, newMin, newMax)
        dfs(root.right, newMin, newMax)
        maxAncestorDiff = max(maxAncestorDiff, newMax - newMin)
    }
    
    dfs(root, root.val, root.val)
    return maxAncestorDiff
}