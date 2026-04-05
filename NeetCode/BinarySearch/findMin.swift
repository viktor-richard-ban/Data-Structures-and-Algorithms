/*

Constraints

1 <= nums.length <= 1000
-1000 <= nums[i] <= 1000
Assuming all elements in the rotated sorted array nums are unique, return the minimum element of this array.

*/

// Time: O(log n)
// Space: O(1)
func findMin(_ nums: [Int]) -> Int {
    var left = 0
    var right = nums.count - 1

    while left != right {
        let mid = Int((left + right) / 2)
        if nums[mid] > nums[right] {
            left = mid + 1
        } else {
            right = mid
        }
    }

    return nums[left]
}