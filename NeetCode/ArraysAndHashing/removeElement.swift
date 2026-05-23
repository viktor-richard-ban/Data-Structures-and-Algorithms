// Time: O(n)
// Space: O(1)
func removeElement(_ nums: inout [Int], _ val: Int) -> Int {
    var removedElements = 0
    var l = 0, r = nums.count - 1

    while l <= r {
        if nums[l] == val {
            let tmp = nums[l]
            nums[l] = nums[r]
            nums[r] = tmp
            r -= 1
            removedElements += 1
        } else {
            l += 1
        }
    }

    return nums.count - removedElements
}