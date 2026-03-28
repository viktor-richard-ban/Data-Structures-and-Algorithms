// Time: O(n)       Space: O(n)
// n: number of characters in strings
func isAnagram_dict(_ s: String, _ t: String) -> Bool {
    guard s.count == t.count else { return false }
    var characters: [Character: Int] = [:]

    // fill the dict with characters and their occurances
    for char in s {
        characters[char, default: 0] += 1
    }

    // decrease character counter in dict
    // when counter is 0, remove it from dict
    for char in t {
        guard characters[char] != nil else { return false }
        characters[char, default: 0] -= 1
        if characters[char] == 0 {
            characters.removeValue(forKey: char)
        }
    }

    return true
}

// Lowercased English letters: max 26 different characters
// ascii a: 97 - z: 122
// Time: O(n)       Space: O(1)
func isAnagram_array(_ s: String, _ t: String) -> Bool {
    guard s.count == t.count else { return false }
    var characters = [Int](repeating: 0, count: 26)

    for index in 0..<s.count {
        let sIndex = s.index(s.startIndex, offsetBy: index)
        let tIndex = t.index(t.startIndex, offsetBy: index)
        guard let sAscii = s[sIndex].asciiValue,
            let tAscii = t[tIndex].asciiValue else { return false }
        characters[Int(sAscii) - 97] += 1
        characters[Int(tAscii) - 97] -= 1
    }

    for charCounter in characters {
        if charCounter != 0 {
            return false
        }
    }
    return true
}

struct TestCase {
    let s: String
    let t: String
    let result: Bool

    init(_ s: String, _ t: String, _ result: Bool) {
        self.s = s
        self.t = t
        self.result = result
    }
}
let testCases: [TestCase] = [
    TestCase("racecar", "carrace", true),
    TestCase("jar", "jam", false),
    TestCase("a", "b", false),
    TestCase("a", "a", true),
    TestCase("", "", true),
    TestCase("abba", "aba", false),
]
for testCase in testCases {
    let result = isAnagram_array(testCase.s, testCase.t)
    if result == testCase.result {
        print("✅ Passed: \(testCase.s), \(testCase.t)")
    } else {
        print("❌ Failed: \(testCase.s), \(testCase.t). Expected \(testCase.result), got \(result)")
    }
}