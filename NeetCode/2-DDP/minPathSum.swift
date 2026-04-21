// Time: O(n * m)
// Space: O(n * m)
func minPathSum(_ grid: [[Int]]) -> Int {
    var paths = grid
    let rows = grid.count
    let columns = grid[rows-1].count

    for r in 0..<rows {
        for c in 0..<columns {
            if r == 0 && c == 0 { continue }
            var top = Int.max, left = Int.max
            if r > 0 {
                top = paths[r-1][c]
            }
            if c > 0 {
                left = paths[r][c-1]
            }
            paths[r][c] = min(top, left) + grid[r][c]
        }
    }

    return paths[rows-1][columns-1]
}

// Time: O(n * m)
// Space: O(n)
// n: columns, m: rows
func minPathSum(_ grid: [[Int]]) -> Int {
    guard grid.count > 0 else { return 0 }
    let rows = grid.count
    let columns = grid[rows-1].count
    var dp = Array(repeating: 0, count: columns)

    for r in 0..<rows {
        for c in 0..<columns {
            if r == 0 && c == 0 {
                dp[c] = grid[r][c]
            } else if r == 0 {
                dp[c] = dp[c-1] + grid[r][c]
            } else if c == 0 {
                dp[c] = dp[c] + grid[r][c]
            } else {
                dp[c] = min(dp[c], dp[c-1]) + grid[r][c]
            }
        }
    }

    return dp[columns-1]
}