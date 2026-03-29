/*
Constraints

1. 1 <= strs.length <= 1000.
2. 0 <= strs[i].length <= 100
3. strs[i] is made up of lowercase English letters.

Clarification questions

1. The result can be returned in any order, that means we can return the groups and the items in the groups in any order.

*/

// Time: n k log k
// Space: n * k
// n: length of the array
// k: length of the longest string
func groupAnagrams_sort(_ strs: [String]) -> [[String]] {
    var dict: [String:[String]] = [:]
    
    for str in strs {
        let sorted = String(str.sorted())
        dict[sorted, default: []].append(str)
    }

    return Array(dict.values)
}

// Time: n * k
// Space: n
// n: length of the array
// k: length of the longest string
func groupAnagrams_dict(_ strs: [String]) -> [[String]] {
    var characterFrequencies: [[Character: Int]: [String]] = [:]
    
    for str in strs {
        let frequency = characterFrequency(of: str)
        characterFrequencies[frequency, default: []].append(str)
    }

    return Array(characterFrequencies.values)
}

func characterFrequency(of str: String) -> [Int] {
    var frequency: [Int] = [Int](repeating: 0, count: 26)

    for char in str {
        guard let ascii = char.asciiValue else { return [] }
        frequency[Int(ascii) - 97] += 1
    }

    return frequency
}

struct TestCase {
    let strs: [String]
    let result: [[String]]

    init(_ strs: [String], _ result: [[String]]) {
        self.strs = strs
        self.result = result
    }
}
let testCases: [TestCase] = [
    .init(["act","pots","tops","cat","stop","hat"], [["hat"],["act", "cat"],["stop", "pots", "tops"]]),
    .init(["x"], [["x"]]),
    .init([""], [[""]])
]
for testCase in testCases {
    let result = groupAnagrams_dict(testCase.strs)

    if result == testCase.result {
        print("✅ Passed: \(testCase.strs))")
    } else {
        print("❌ Failed: \(testCase.strs). Expected \(testCase.result), got \(result)")
    }
}