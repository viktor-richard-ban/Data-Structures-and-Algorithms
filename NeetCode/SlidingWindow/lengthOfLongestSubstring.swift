/*

Constrains

0 <= s.length <= 1000
s may consist of printable ASCII characters

Input: s = "zxyzxyz"
Output: 3

*/

// Time: O(n)
// Space: O(c)
// c: number of unique characters
func lengthOfLongestSubstring(_ s: String) -> Int {
    var maxLength = 0
    var chars: [Int] = [Int](repeating: 0, count: 128)
    var left: Int = 0
 
    for (right, char) in s.enumerated() {
        let asciiValue = Int(char.asciiValue!)
        chars[asciiValue] += 1

        while chars[asciiValue] > 1 {
            let leftIndex = s.index(s.startIndex, offsetBy: left)
            let leftAsciiValue = Int(s[leftIndex].asciiValue!)
            chars[leftAsciiValue] -= 1
            left += 1
        }

        let currentLength = right - left + 1
        maxLength = max(maxLength, currentLength)
    }

	return maxLength
}

// Time: O(n)
// Space: O(s)
// s: length of s
func lengthOfLongestSubstring_array(_ s: String) -> Int {
    var maxLength = 0
    var frequencies:[Int] = [Int](repeating: 0, count: 128)
    var left: Int = 0
    let chars = Array(s)

    for (right, char) in chars.enumerated() {
        let asciiValue = Int(char.asciiValue!)
        frequencies[asciiValue] += 1

        while frequencies[asciiValue] > 1 {
            let leftAsciiValue = Int(chars[left].asciiValue!)
            frequencies[leftAsciiValue] -= 1
            left += 1
        }

        let currentLength = right - left + 1
        maxLength = max(maxLength, currentLength)
    }

    return maxLength
}

let str = "pwwkew"
print(lengthOfLongestSubstring_array(str))