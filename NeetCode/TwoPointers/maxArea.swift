/*

Constraints

1. 2 <= height.length <= 1000
2. 0 <= height[i] <= 1000

*/

// Brute force
// Time: O(n^2)
// Space: O(1)
func maxArea_bruteForce(_ heights: [Int]) -> Int {
    var maxWater = 0

    for left in 0..<heights.count - 1 {
        for right in left+1..<heights.count {
            let distance = right - left
            let minHeight =  min(heights[left], heights[right])
            maxWater = max(maxWater, minHeight * distance)
        }
    }

    return maxWater
}

// Optimized
// Time: O(n)
// Space: O(1)
func maxArea(_ heights: [Int]) -> Int {
    var maxWater = 0
    var l = 0
    var r = heights.count - 1

    while l < r {
        let distance = r - l
        let minHeight = min(heights[l], heights[r])
        maxWater = max(maxWater, distance * minHeight)

        if heights[l] > heights[r] {
            r -= 1
        } else {
            l += 1
        }
    }
    
    return maxWater
}

struct TestCase {
    let heights: [Int]
    let result: Int

    init(_ heights: [Int], _ result: Int) {
        self.heights = heights
        self.result = result
    }
}
let testCases: [TestCase] = [
    .init([1,7,2,5,4,7,3,6], 36),
    .init([2,2,2], 4)
]
for testCase in testCases {
    let result = maxArea(testCase.heights)
    if result == testCase.result {
        print("✅ Passed: \(testCase.heights))")
    } else {
        print("❌ Failed: \(testCase.heights). Expected \(testCase.result), got \(result)")
    }
}