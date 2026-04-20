// Time: O(2^n)
// Space: O(n)
func rob(_ nums: [Int]) -> Int {
    func backtrack(_ i: Int) -> Int {
        guard i < nums.count else { return 0 }
        let yes = nums[i] + backtrack(i + 2)
        let no = backtrack(i + 1)
        return max(yes, no)
    }
    return backtrack(0)
}

// Memorization
// Time: O(n)
// Space: O(n)
func rob(_ nums: [Int]) -> Int {
    var memo: [Int] = Array(repeating: 0, count: nums.count)
    func backtrack(_ i: Int) -> Int {
        guard i < nums.count else { return 0 }
        guard memo[i] == 0 else { return memo[i] }
        let yes = nums[i] + backtrack(i + 2)
        let no = backtrack(i + 1)
        memo[i] = max(yes, no)
        return memo[i]
    }
    return backtrack(0)
}

// DP
// Time: O(n)
// Space: O(n)
func rob(_ nums: [Int]) -> Int {
    guard nums.count > 1 else { return nums[0] }
    var returns = nums

    for i in stride(from: nums.count-3, through: 0, by: -1) {
        let take = returns[i] + returns[i+2]
        returns[i] = max(take, returns[i+1])
    }

    return max(returns[0], returns[1])
}

// DP
// Time: O(n)
// Space: O(1)
func rob(_ nums: [Int]) -> Int {
    guard nums.count > 1 else { return nums[0] }
    var left = nums[0]
    var right = max(left, nums[1])
    guard nums.count > 2 else { return right }

    for i in 2..<nums.count {
        let maxReturn = max(left + nums[i], right)
        left = right
        right = maxReturn
    }

    return right
}