// Time: O(n + e)
// Space: O(n)
func cloneGraph(_ node: Node?) -> Node? {
    guard let node else { return nil }
    var nodes: [Int:Node] = [:]

    func dfs(_ root: Node?) -> Node? {
        guard let root else { return nil }
        if let copy = nodes[root.val] { return copy }
        let copy = Node(root.val)
        nodes[root.val] = copy

        for neighbor in root.neighbors {
            guard let neighbor else { continue }
            copy.neighbors.append(dfs(neighbor))
        }

        return copy
    }

    dfs(node)
    return nodes[node.val]
}