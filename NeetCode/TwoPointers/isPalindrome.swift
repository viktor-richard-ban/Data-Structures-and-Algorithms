/*
Constraints

1. 1 <= s.length <= 1000
2. s is made up of only printable ASCII characters.
3. It is also case-insensitive and ignores all non-alphanumeric characters.
4. Alphanumeric characters consist of letters (A-Z, a-z) and numbers (0-9).

Clarification questions

1. An input with only spaces should be considered palindrome?

*/

// Time: O(n)
// Space: O(n)
func isPalindrome(_ s: String) -> Bool {
    let characters = Array(s)
    var l = 0 
    var r = s.count - 1

    while l < r {
        // Skipping non alphanumeric characters from left
        while characters[l].isAlphanumeric() == false && l < r {
            l += 1
        }
        // Skipping non alphanumeric characters from right
        while characters[r].isAlphanumeric() == false && l < r {
            r -= 1
        }

        // Compare lowercase characters
        if characters[l].lowercased() != characters[r].lowercased() {
            return false
        }

        l += 1
        r -= 1
    }

    return true
}

// Time: O(n)
// Space: O(1)
func isPalindrome_index(_ s: String) -> Bool {
    var l = s.startIndex
    var r = s.index(before: s.endIndex)

    while l < r {
        // Skipping non alphanumeric characters from left
        while l < r && !s[l].isAlphanumeric() {
            l = s.index(after: l)
        }
        // Skipping non alphanumeric characters from right
        while l < r && !s[r].isAlphanumeric() {
            r = s.index(before: r)
        }

        // Compare lowercase characters
        if s[l].lowercasedASCII != s[r].lowercasedASCII {
            return false
        }

        l = s.index(after: l)
        r = s.index(before: r)
    }

    return true
}

extension Character {
    // ASCII
    // 0: 48 - 9: 57
    // A: 65 - Z: 90
    // a: 97 - z: 122
    var lowercasedASCII: Character {
        guard let v = asciiValue else { return self }
        if (65...90).contains(v) {
            return Character(UnicodeScalar(v + 32))
        }
        return self
    }

    func isAlphanumeric() -> Bool {
        guard let asciiValue = self.asciiValue else { return false }
        return (48...57).contains(asciiValue) ||
                (65...90).contains(asciiValue) ||
                (97...122).contains(asciiValue)
    }
}

struct TestCase {
    let s: String
    let result: Bool

    init(_ s: String, _ result: Bool) {
        self.s = s
        self.result = result
    }
}
let testCases: [TestCase] = [
    .init("Was it a car or a cat I saw?", true),
    .init("tab a cat", false),
    .init("  ", true),
    .init("0aA0", true),
    .init("a", true),
    .init("a    a", true),
]
for testCase in testCases {
    let result = isPalindrome_index(testCase.s)
    if result == testCase.result {
        print("✅ Passed: \(testCase.s)")
    } else {
        print("❌ Failed: \(testCase.s). Expected \(testCase.result), got \(result)")
    }
}