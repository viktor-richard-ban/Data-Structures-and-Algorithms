/*

Constraints

1 <= nums.length <= 1000
-1000 <= nums[i] <= 1000
-1000 <= target <= 1000
All values of nums are unique.
nums is an ascending array that is possibly rotated.

*/

// Time: O(log n)
// Space: O(1)
func search(_ nums: [Int], _ target: Int) -> Int {
    var left = 0, right = nums.count - 1

    while left <= right {
        let mid = (right + left) / 2
        if nums[mid] == target {
            return mid
        }

        // right sorted side
        if nums[mid] < nums[right] {
            if nums[mid] < target && target <= nums[right] {
                left = mid + 1
            } else {
                right = mid - 1
            }
        // left sorted side
        } else {
            if nums[mid] > target && nums[left] <= target {
                right = mid - 1
            } else {
                left = mid + 1
            }
        }
    }

    return -1
}