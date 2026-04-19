// BFS
// Time: O(m * n)
// Space: O(m * n)
func numIslands(_ grid: [[Character]]) -> Int {
    var islands = 0
    var seen: [[Bool]] = Array(repeating: Array(repeating: false, count: grid[0].count), count: grid.count)
    let directions: [(Int, Int)] = [(1,0), (-1,0), (0,1), (0,-1)]

    func bfs(_ x: Int, _ y: Int) {
        var queue: [(Int, Int)] = [(x, y)]
        seen[y][x] = true
        while !queue.isEmpty {
            var newQueue: [(Int, Int)] = []
            for node in queue {
                for direction in directions {
                    let newX = node.0 + direction.0
                    let newY = node.1 + direction.1
                    if isValid(newX, newY) && grid[newY][newX] == "1" && !seen[newY][newX] {
                        seen[newY][newX] = true
                        newQueue.append((newX, newY))
                    }
                }
            }
            queue = newQueue
        }
    }

    func isValid(_ x: Int, _ y: Int) -> Bool {
        return y >= 0 && y < grid.count &&
            x >= 0 && x < grid[y].count
    }

    for y in 0..<grid.count {
        for x in 0..<grid[y].count where grid[y][x] == "1" && !seen[y][x] {
            bfs(x, y)
            islands += 1
        }
    }
    return islands
}

// DFS
// Time: O(m * n)
// Space: O(m * n)
func numIslands(_ grid: [[Character]]) -> Int {
    var islands = 0
    var grid = grid
    var directions: [(Int, Int)] = [(1,0), (-1,0), (0,1), (0,-1)]

    func dfs(_ x: Int, _ y: Int) {
        grid[y][x] = "X"
        for direction in directions {
            let newX = x + direction.0
            let newY = y + direction.1
            if isValid(newX, newY) && grid[newY][newX] == "1" {
                dfs(newX, newY)
            }
        }
    }

    func isValid(_ x: Int, _ y: Int) -> Bool {
        return y >= 0 && y < grid.count &&
            x >= 0 && x < grid[y].count
    }

    for y in 0..<grid.count {
        for x in 0..<grid[y].count where grid[y][x] == "1" {
            dfs(x, y)
            islands += 1
        }
    }
    return islands
}
