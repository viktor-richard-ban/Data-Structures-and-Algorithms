// Time: O(n + e)
// Space: O(n)
func findSmallestSetOfVertices(_ n: Int, _ edges: [[Int]]) -> [Int] {
    var nodes: [Bool] = Array(repeating: false, count: n)
    for edge in edges {
        nodes[edge[1]] = true
    }
    
    var vertices: [Int] = []
    for node in 0..<n where !nodes[node] {
        vertices.append(node)
    }

    return vertices
}