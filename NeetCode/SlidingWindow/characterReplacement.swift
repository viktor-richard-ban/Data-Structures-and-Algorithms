/*

Constraints

1 <= s.length <= 1000
0 <= k <= s.length

Input: s = "XYYX", k = 2
Output: 4

*/

// Time: O(n)
// Space: O(n)
func characterReplacement(_ s: String, _ k: Int) -> Int {
    var maxLength = 0
    var left = 0, maxF = 0
    var freq: [Character: Int] = [:]
    let chars: [Character] = Array(s)

    for (right, rightChar) in chars.enumerated() {
        freq[rightChar, default: 0] += 1
        maxF = max(maxF, freq[rightChar]!)

        while right - left + 1 - maxF > k {
            let leftChar = chars[left]
            freq[leftChar]! -= 1
            left += 1
        }

        maxLength = max(maxLength, right - left + 1)
    }

    return maxLength
}