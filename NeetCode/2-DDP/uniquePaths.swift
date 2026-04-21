// Recursion
// Time: O(n * m)
// Space: O(n * m)
var memo: [String:Int] = [:]
func uniquePaths(_ m: Int, _ n: Int) -> Int {
    guard m > 1 && n > 1 else { return 1 }
    let memoKey = "\(n),\(m)"
    if let val = memo[memoKey] {
        return val
    }
    memo[memoKey] = uniquePaths(m - 1, n) + uniquePaths(m, n - 1)
    return memo[memoKey]!
}

// DP
// Time: O(n * m)
// Space: O(n * m)
func uniquePaths(_ m: Int, _ n: Int) -> Int {
    var dp = Array(repeating: Array(repeating: 1, count: n), count: m)

    for r in 1..<m {
        for c in 1..<n {
            dp[r][c] = dp[r-1][c] + dp[r][c-1]
        }
    }

    return dp[m - 1][n-1]
}

// DP optimized
// Time: O(n * m)
// Space: O(n)
func uniquePaths(_ m: Int, _ n: Int) -> Int {
    var dp = Array(repeating: 1, count: n)

    for r in 1..<m {
        for c in 1..<n {
            dp[c] = dp[c] + dp[c-1]
        }
    }

    return dp[n-1]
}