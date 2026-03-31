/*
Constraints

1. 3 <= nums.length <= 1000
2. -10^5 <= nums[i] <= 10^5

Clarification questions

1. The output should or should not contain any duplicate triplets?
2. Does the order of the result matted? The order of the triplets?

*/

// Brute force
// Time: O(n^3)
// Spcae: O(n^2)
// Further optimizations
// 1. Handling edge-cases to not depend on the given constrains like empty input array
func threeSum_bruteForce(_ nums: [Int]) -> [[Int]] {
    let sortedNums = nums.sorted()
    var threeSums: Set<[Int]> = Set()

    for i in 0...nums.count-3 {
        for j in i+1...nums.count-2 {
            for k in j+1...nums.count-1 {
                if sortedNums[i] + sortedNums[j] + sortedNums[k] == 0 {
                    threeSums.insert([sortedNums[i], sortedNums[j], sortedNums[k]])
                }
            }
        }
    }
    return Array(threeSums)
}

// Time: O(n^2)
// Space: O(n)
func threeSum(_ nums: [Int]) -> [[Int]] {
    var threeSums: [[Int]] = []
    let sortedNums = nums.sorted()

    var index = 0
    while index <= sortedNums.count - 3 {
        var left = index+1
        var right = sortedNums.count - 1
        while left < right {
            let threeSum = sortedNums[left] + sortedNums[right] + sortedNums[index]
            if threeSum > 0 {
                right -= 1
            } else if threeSum < 0 {
                left += 1
            } else {
                threeSums.append([sortedNums[index], sortedNums[left], sortedNums[right]])
                left += 1
                right -= 1

                while left < right && sortedNums[left] == sortedNums[left-1] {
                    left += 1
                }
                while left < right && sortedNums[right] == sortedNums[right+1] {
                    right -= 1
                }
            }
        }

        index += 1
        while index < sortedNums.count && sortedNums[index] == sortedNums[index-1] {
            index += 1
        }
    }

    return threeSums
}


struct TestCase {
    let nums: [Int]
    let result: [[Int]]

    init(_ nums: [Int], _ result: [[Int]]) {
        self.nums = nums
        self.result = result
    }
}
let testCases: [TestCase] = [
    .init([0,1,1], []),
    .init([0,0,0], [[0,0,0]]),
    .init([-1,0,1,2,-1,-4], [[-1,-1,2],[-1,0,1]]),
    .init([0,0,0,0], [[0,0,0]])
]
for testCase in testCases {
    let result = threeSum(testCase.nums)
    if result == testCase.result {
        print("✅ Passed: \(testCase.nums)")
    } else {
        print("❌ Failed: \(testCase.nums). Expected \(testCase.result), got \(result)")
    }
}