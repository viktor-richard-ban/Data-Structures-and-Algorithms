/*
Clarification questions

1. Is the input array sorted?
2. Can the array be empty or have only one element?
3. Am I allowed to use additional data structures like a Set?
*/

// Time: O(n^2)     Space: O(1)
func hasDuplicate_bruteForce(_ nums: [Int]) -> Bool {
    for i in 0..<nums.count {
        for j in i+1..<nums.count {
            if nums[i] == nums[j] {
                return true
            }
        }
    }
    return false
}

func hasDuplicate_set(_ nums: [Int]) -> Bool {
    var seenNums: Set<Int> = Set()
    for num in nums {
        if seenNums.contains(num) {
            return true
        }
        seenNums.insert(num)
    }
    return false
}

struct TestCase {
    let nums: [Int]
    let result: Bool

    init(_ nums: [Int], _ result: Bool) {
        self.nums = nums
        self.result = result
    }
}
let testCases: [TestCase] = [
    TestCase([1, 2, 3, 3], true),
    TestCase([1, 2, 3, 4], false)
]
for testCase in testCases {
    let result = hasDuplicate_set(testCase.nums)
    if result == testCase.result {
        print("Test passed")
    } else {
        print("Test failed")
    }
}