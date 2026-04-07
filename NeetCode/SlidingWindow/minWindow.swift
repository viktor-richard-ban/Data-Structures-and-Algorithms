/*

Constraints

1 <= s.length <= 1000
1 <= t.length <= 1000
s and t consist of uppercase and lowercase English letters.

*/

// Time: O(s + t)
// Space: O(s + c)
// s: length of s
// t: length of t
// c: number of unique characters in t
func minWindow(_ s: String, _ t: String) -> String {
    let chars = Array(s)
    let tChars: [Character: Int] = characterFrequencies(of: t)
    var sChars: [Character: Int] = [:]
    var have = 0, need = tChars.count
    var minLeft: Int?, minRight: Int?
    var left = 0

    for (right, sChar) in s.enumerated() {
        sChars[sChar, default: 0] += 1
        if let count = tChars[sChar], sChars[sChar, default: 0] == count {
            have += 1
        }
        
        while have == need {
            let length = right - left + 1
            var minLength = Int.max
            if let minLeft, let minRight {
                minLength = minRight - minLeft + 1
            }
            if length < minLength {
                minLeft = left
                minRight = right
            }

            let leftChar = chars[left]
            sChars[leftChar, default: 0] -= 1
            if let count = tChars[leftChar], sChars[leftChar, default: 0] < count {
                have -= 1
            }
            left += 1
        }
    }

    if let minLeft, let minRight {
        let range = minLeft...minRight
        return String(chars[range])
    }
    return ""
}

private func characterFrequencies(of str: String) -> [Character: Int] {
    var frequencies: [Character: Int] = [:]
    for char in str {
        frequencies[char, default: 0] += 1
    }
    return frequencies
}