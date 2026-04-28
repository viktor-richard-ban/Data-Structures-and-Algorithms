// Time: O(V + E)
// Space: O(V + E)
// With assumption that queue is a Deque
func countComponents(_ n: Int, _ edges: [[Int]]) -> Int {
    var adj: [Int: [Int]] = [:]
    for edge in edges {
        adj[edge[0], default: []].append(edge[1])
        adj[edge[1], default: []].append(edge[0])
    }

    var components = 0
    var visited: [Bool] = Array(repeating: false, count: n)
    for node in 0..<n where visited[node] == false {
        bfs(node, adj, &visited)
        components += 1
    }

    return components
}

private func bfs(_ node: Int, _ adj: [Int:[Int]], _ visited: inout [Bool]) {
    var queue: [Int] = [node]
    visited[node] = true

    while !queue.isEmpty {
        let current = queue.removeFirst()
        for child in adj[current, default: []] where visited[child] == false {
            queue.append(child)
            visited[child] = true
        }
    }
}