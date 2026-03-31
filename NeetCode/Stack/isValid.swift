/*
Constraints

1. 1 <= s.length <= 1000
2. Expecatable characters: '(', ')', '{', '}', '[' and ']'

Clarification questions

1. Should we optimize the solution like when length of s is odd we immediately return?

*/


// Time: O(n)
// Space: O(n)
// Further optimization ideas
// Handling edge-cases, returning result early
// Dictionary can be removed in this case, for data-driven solutions, or dynamic sets we should keep them
func isValid(_ s: String) -> Bool {
    let pairs: [Character: Character] = [
        ")": "(",
        "}": "{",
        "]": "[",
    ]
    var stack: [Character] = []

    for char in s {
        if let openingPair = pairs[char] {
            let lastChar = stack.popLast()
            if lastChar != openingPair {
                return false
            }
        } else {
            stack.append(char)
        }
    }

    return stack.isEmpty
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
    TestCase("[]", true),
    TestCase("([{}])", true),
    TestCase("[(])", false),
    TestCase("(((", false),
    TestCase(")", false)
]
for testCase in testCases {
    let result = isValid(testCase.s)
    if result == testCase.result {
        print("✅ Passed: \(testCase.s))")
    } else {
        print("❌ Failed: \(testCase.s). Expected \(testCase.result), got \(result)")
    }
}