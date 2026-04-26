// Time: O(n)
// Space: O(n)
func minCostClimbingStairs(_ cost: [Int]) -> Int {
    var memo: [Int] = Array(repeating: -1, count: cost.count)

    func dp(_ i: Int) -> Int {
        guard i < cost.count else { return 0 }
        guard memo[i] == -1 else { return memo[i] }
        memo[i] = cost[i] + min(dp(i + 1), dp(i + 2))
        return memo[i]
    }

    return min(dp(0), dp(1))
}

// Time: O(n)
// Space: O(1)
func minCostClimbingStairs(_ cost: [Int]) -> Int {
    var left = cost[0]
    var right = cost[1]

    for i in 2..<cost.count {
        let tmp = right
        right = min(left, right) + cost[i]
        left = tmp
    }

    return min(left, right)
}