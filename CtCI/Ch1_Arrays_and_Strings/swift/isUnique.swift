/* 
Clarification questions

1. What character set should I assume: ASCII, Unicode, or only lowercase English letters?
2. Can the input be empty? I would normally return true for an empty string.
3. For the follow-up, does "no additional data structures" mean I also cannot create a copied/sorted version of the string?
*/


// Time: O(n^2)    Space: O(1)
func isUnique_bruteForce(_ str: String) -> Bool {
    for characterIndex in str.indices {
        var index = str.index(characterIndex, offsetBy: 1)
        while index < str.endIndex {
            if str[index] == str[characterIndex] {
                return false
            }
            index = str.index(after: index)
        }
    }
    return true
}

// Time: O(n)   Space: O(c) => O(1)
// c: number of unique characters => finite
func isUnique_set(_ str: String) -> Bool {
    var charactersSeen: Set<Character> = Set()
    for char in str {
        if charactersSeen.contains(char) {
            return false
        }
        charactersSeen.insert(char)
    }
    return true
}

// Time: O(n)   Space: O(128) => O(1)
// Assuming that input string contains ascii characters only
func isUnique_array(_ str: String) -> Bool {
    var characters = [Bool](repeating: false, count: 128)
    for char in str {
        let ascii = Int(char.asciiValue!)   // force unwrap, should be handled properly
        if characters[ascii] {
            return false
        }
        characters[ascii] = true
    }
    return true
}

// Time: O(N log N)     Space: O(1)
func isUnique_sort(_ str: String) -> Bool {
    guard str.count > 0 else { return true }
    let sorted = str.sorted()
    var lastChar: Character = sorted[sorted.startIndex]
    for index in 1..<sorted.count {
        let charIndex = sorted.index(sorted.startIndex, offsetBy: index)
        let character = sorted[charIndex]
        if lastChar == character {
            return false
        }
        lastChar = character
    }
    return true
}


let testCases: [String: Bool] = [
    "": true,    // edge case, question if this should be handled or not
    "aab": false,
    "abc": true
]

for (testCase, expectedResult) in testCases {
    let result = isUnique_sort(testCase)
    if result == expectedResult {
        print("Test passed")
    } else {
        print("Test failed")
    }
}