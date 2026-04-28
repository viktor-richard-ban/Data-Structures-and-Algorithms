// Time: O(V + E)
// Space: O(V + E)
func validTree(_ n: Int, _ edges: [[Int]]) -> Bool {
    var adjacency: [Int:[Int]] = [:]
    for edge in edges {
        adjacency[edge[0], default: []].append(edge[1])
        adjacency[edge[1], default: []].append(edge[0])
    }

    var visited: Set<Int> = []
    func dfs(_ node: Int, _ prev: Int) -> Bool {
        if visited.contains(node) {
            return false
        } 
        visited.insert(node)

        for child in adjacency[node, default: []] {
            if child == prev {
                continue
            }
            if dfs(child, node) == false {
                return false
            }
        }
        return true
    }

    return dfs(0, -1) && visited.count == n
}