// Time: O(n)
// Space: O(1)
func rob(_ nums: [Int]) -> Int {
    guard nums.count > 1 else { return nums[0] }
    guard nums.count > 2 else { return max(nums[0], nums[1]) }

    func maxReturn(_ start: Int, _ end: Int) -> Int {
        var left = 0
        var right = 0

        for i in start...end {
            let returnVal = max(left + nums[i], right)
            left = right
            right = returnVal
        }

        return max(left, right)
    }

    return max(maxReturn(0, nums.count-2),  maxReturn(1, nums.count-1))
}