/*
Constraints

1. 1 <= nums.length <= 10^4.
2. -1000 <= nums[i] <= 1000
3. 1 <= k <= number of distinct elements in nums.

The test cases are generated such that the answer is always unique.
You may return the output in any order.

Clarification questions

1. Since the answer is guaranteed to be unique, I don’t need tie-breaking logic, correct? - Yes
2. Is the nums array sorted? - No it is NOT sorted

*/

// Time: O(n + m log m)
// Space: O(m)
// Improvements:
// - Proper error handling in order to remove force unwraps
func topKFrequent_dict(_ nums: [Int], _ k: Int) -> [Int] {
    // calculate frequencies for each numbers - dictionary
    let frequencies: [Int: Int] = frequencies(nums)
    // create a list from the keys (unique nums)
    // sort them based in the frequencies
    var uniqueNums: [Int] = Array(frequencies.keys)
    uniqueNums.sort(by: { lhs, rhs in
        frequencies[lhs]! > frequencies[rhs]!
    })

    // return the first k key from the array
    return Array(uniqueNums.prefix(k))
}

func frequencies(_ nums: [Int]) -> [Int: Int] {
    var frequencies: [Int: Int] = [:]
    for num in nums {
        frequencies[num, default: 0] += 1
    }
    return frequencies
}

// Time: O(n)
// Space:  O(n)
func topKFrequent(_ nums: [Int], _ k: Int) -> [Int] {
    // Calculate frequencies by groups
    // [1,2,3,3]
    // 1 -> [1,2]
    // 2 -> [3]
    let frequencies = frequencies(nums)
    let frequenciesByGroups = frequenciesByGroups(frequencies, counter: nums.count)
    var topK: [Int] = []
    var counter = nums.count
    while topK.count != k {
        // Since it is garanteed to have always one solution
        topK += frequenciesByGroups[counter]   
        counter -= 1
    }

    return topK
}

func frequenciesByGroups(_ frequencies: [Int: Int], counter: Int) -> [[Int]] {
    var frequenciesByGroups = [[Int]](repeating: [], count: counter + 1)
    for (value, frequency) in frequencies {
        frequenciesByGroups[frequency].append(value)
    }
    return frequenciesByGroups
}

struct TestCase {
    let nums: [Int]
    let k: Int
    let result: [Int]

    init(_ nums: [Int], _ k: Int, _ result: [Int]) {
        self.nums = nums
        self.k = k
        self.result = result
    }
}
let testCases: [TestCase] = [
    .init([1,2,2,3,3,3], 2, [2,3]),
    .init([7,7], 1, [7]),
    .init([-1,2], 2, [-1,2]),
    .init([0], 1, [0]),
]
for testCase in testCases {
    let result = topKFrequent(testCase.nums, testCase.k)

    if Set(result) == Set(testCase.result) {
        print("✅ Passed: \(testCase.nums))")
    } else {
        print("❌ Failed: \(testCase.nums), \(testCase.k). Expected \(testCase.result), got \(result)")
    }
}