/*
Constraints

1. 0 <= strs.length < 100
2. 0 <= strs[i].length < 200
3. strs[i] contains any possible characters out of 256 valid ASCII characters.

Clarification questions

1. From the examples, we can see that empty string is accepted
2. From the constrains we can calculate the max length of the length of the concatenated strings - 99 * 199 ~= 2000 characters

Follow up: Could you write a generalized algorithm to work on any possible set of characters?

The solution below handles any character


*/

// Time: O(k)
// Space: O(k)
// k: length of all strings
func encode(_ strs: [String]) -> String {
    var result: [String] = []
    for str in strs {
        result.append("\(str.count)#\(str)")
    }
    return result.joined(separator: "")
}

// Time: O(k)
// Space: O(k)
// k: length of all strings
func decode(_ str: String) -> [String] {
    let characters: [Character] = Array(str)
    var decoded: [String] = []
    
    var counter = 0
    while counter < characters.count {
        var length = 0
        while characters[counter] != "#" {
            length = length * 10 + Int(String(characters[counter]))!
            counter += 1
        }
        counter += 1

        if length == 0 {
            decoded.append("")
            continue
        }

        var decodedWord: [String] = []
        for _ in 1...length {
            let char = String(characters[counter])
            decodedWord.append(char)
            counter += 1
        }
        
        decoded.append(decodedWord.joined(separator: ""))
    }

    return decoded
}

struct TestCase {
    let strs: [String]

    init(_ strs: [String]) {
        self.strs = strs
    }
}
let testCases: [TestCase] = [
    .init(["Hello","World"]),
    .init(["", "vn"]),
    .init(["", ""]),
    .init([""]),
    .init([])
]
for testCase in testCases {
    let encoded = encode(testCase.strs)
    let decoded = decode(encoded)

    if decoded == testCase.strs {
        print("✅ Passed: \(testCase.strs))")
    } else {
        print("❌ Failed: \(testCase.strs). Expected \(testCase.strs), got \(decoded)")
    }
}