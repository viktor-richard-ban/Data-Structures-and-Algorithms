/*
Given an array of positive integers numbers and a positive integer target, write a function minimumSubArrayLength(target, numbers) that returns the minimum length of a contiguous subarray whose sum is greater than or equal to target. If no such subarray exists, return 0.

Example:
numbers = [2, 3, 1, 2, 4, 3]
target = 7
The subarray [4, 3] sums to 7
*/

// Time: O(n)
// Space: O(1)
func minimumSubArrayLength(_ target: Int, _ numbers: [Int]) -> Int {
	var minLength = Int.max
	var sum: Int = 0
    var left: Int = 0

    for right in 0..<numbers.count {
        sum += numbers[right]

        while sum >= target {
            let currentLength = right - left + 1
            minLength = min(minLength, currentLength)
            sum -= numbers[left]
            left += 1
        }
    }

	return minLength == Int.max ? 0 : minLength
}

struct TestCase {
    let nums: [Int]
    let target: Int
    let result: Int

    init(_ nums: [Int], _ target: Int, _ result: Int) {
        self.nums = nums
        self.target = target
        self.result = result
    }
}
let testCases: [TestCase] = [
    TestCase([5,1,2,3,4], 7, 2),
    TestCase([1,2,999,3,4,5,6], 999, 1),
    TestCase([5,1,2,3,4], 9, 3),
    TestCase([5,1,2,3,4], 15, 5),
    TestCase([5,1,2,3,4], 16, 0),
    TestCase([0,0,0], 99, 0)
]
for testCase in testCases {
    let result = minimumSubArrayLength(testCase.target, testCase.nums)
    if result == testCase.result {
        print("✅ Passed: \(testCase.nums), target: \(testCase.target)")
    } else {
        print("❌ Failed: \(testCase.nums), target: \(testCase.target) - Result: \(result)")
    }
}