// Time: O(n)
// Space: O(n)
func minReorder(_ n: Int, _ connections: [[Int]]) -> Int {
    var roads: Set<[Int]> = Set()
    var graph: [Int: [Int]] = [:]
    for connection in connections {
        graph[connection[0], default: []].append(connection[1])
        graph[connection[1], default: []].append(connection[0])
        roads.insert(connection)
    }

    var seen: Set<Int> = [0]
    func dfs(_ node: Int) -> Int {
        var result = 0
        for connection in graph[node]! where !seen.contains(connection) {
            if roads.contains([node, connection]) {
                result += 1
            }
            seen.insert(connection)
            result += dfs(connection)
        }
        return result
    }

    return dfs(0)
}