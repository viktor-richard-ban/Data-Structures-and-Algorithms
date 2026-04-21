// Time: O(n^2)
// Space: O(n^2)
func lengthOfLIS(_ nums: [Int]) -> Int {
    var memo: [String:Int] = [:]
    func backtrack(_ i: Int, _ last: Int) -> Int {
        guard i < nums.count else { return 0 }
        let memoKey = "\(i) \(last)"
        if let val = memo[memoKey] {
            return val
        }
        
        let without = backtrack(i + 1, last)
        let with = last < nums[i] ? 1 + backtrack(i + 1, nums[i]) : Int.min
        memo[memoKey] = max(without, with)
        return memo[memoKey]!
    }

    return backtrack(0, Int.min)
}

// Time: O(n^2)
// Space: O(n)
func lengthOfLIS(_ nums: [Int]) -> Int {
    guard nums.count > 0 else { return 0 }
    var dp: [Int] = Array(repeating: 1, count: nums.count)
    var maxLength = 1

    for i in 1..<nums.count {
        for j in stride(from: i-1, through: 0, by: -1) where nums[j] < nums[i] {
            dp[i] = max(dp[i], dp[j] + 1)
        }
        maxLength = max(maxLength, dp[i])
    }

    return maxLength
}