// Time: O(m * n)
// Space: O(m * n)
func pacificAtlantic(_ heights: [[Int]]) -> [[Int]] {
    let directions: [(Int, Int)] = [(1, 0), (-1, 0), (0, 1), (0, -1)]
    func dfs(_ r: Int, _ c: Int, _ collection: inout Set<[Int]>) {
        if collection.contains([r,c]) { return }
        collection.insert([r,c])
        for direction in directions {
            let newR = r + direction.0
            let newC = c + direction.1
            if isValid(newR, newC) && heights[newR][newC] >= heights[r][c] {
                dfs(newR, newC, &collection)
            }
        }
    }

    func isValid(_ r: Int, _ c: Int) -> Bool {
        return r >= 0 && r < heights.count &&
            c >= 0 && c < heights[r].count
    }

    var pacificSet: Set<[Int]> = Set()
    var atlanticSet: Set<[Int]> = Set()
    for cIndex in 0..<heights[0].count {
        dfs(0, cIndex, &pacificSet)
        dfs(heights.count-1, cIndex, &atlanticSet)
    }
    for rIndex in 0..<heights.count {
        dfs(rIndex, 0, &pacificSet)
        dfs(rIndex, heights[0].count-1, &atlanticSet)
    }

    return Array(pacificSet.intersection(atlanticSet))
}