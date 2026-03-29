/*
Clarification questions

1. Is the array sorted?
2. Can I use additional data structures?
3. "Only one valid answer exists." This means there is always one solution, right?

Assumtions:
1. Array is not sorted.
2. Additional data structures are allowed.
3. There is always ONE answer.
*/

// Time: O(n^2)
// Space: O(1)
func twoSum_bruteForce(_ nums: [Int], _ target: Int) -> [Int] {
    for i in 0..<nums.count-1 {
        for j in i+1..<nums.count {
            if nums[i] + nums[j] == target {
                return [i, j]
            }
        }
    }
    return []   // Should not be reached
}

// Memorization with dictionary
// Time: O(n)
// Space: O(n)
func twoSum_dict(_ nums: [Int], _ target: Int) -> [Int] {
    var indexByValue: [Int: Int] = [:]

    // for in nums 
    // check for target sum
    // num is saved with position ([num: index])
    for (index, num) in nums.enumerated() {
        let missingNum = target - num
        if let position = indexByValue[missingNum] {
            return [position, index]
        }
        indexByValue[num] = index
    }

    return []   // Should not be reached, since the problem guarantees exactly one solution
}

struct TestCase {
    let nums: [Int]
    let target: Int
    let result: [Int]

    init(_ nums: [Int], _ target: Int, _ result: [Int]) {
        self.nums = nums
        self.target = target
        self.result = result
    }
}
let testCases: [TestCase] = [
    TestCase([3,4,5,6], 7, [0,1]),      // first two
    TestCase([4,5,6], 10, [0,2]),
    TestCase([5,5], 10, [0,1]),         // same number, min input
    TestCase([4,1,2,7,6], 10, [0,4]),   // maximum distance
    TestCase([4,1,2,7,6], 8, [1,3]),
    TestCase([0,4,3,0], 0, [0,3]),      // zero handling
    TestCase([-3,4,3,90], 0, [0,2])     // negative handling
]
for testCase in testCases {
    let result = twoSum_dict(testCase.nums, testCase.target)
    if result == testCase.result {
        print("✅ Passed: \(testCase.nums), \(testCase.target)")
    } else {
        print("❌ Failed: \(testCase.nums), \(testCase.target). Expected \(testCase.result), got \(result)")
    }
}