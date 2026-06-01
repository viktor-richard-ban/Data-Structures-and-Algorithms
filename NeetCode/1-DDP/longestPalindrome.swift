// Time: O(n^2)
// Space: O(n)
func longestPalindrome(_ s: String) -> String {
    let characters = Array(s)
    var result: ArraySlice<Character> = []

    for i in 0..<characters.count {
        let single = longestPalindrome(characters, i, i)
        if result.count < single.count {
            result = single
        }

        let double = longestPalindrome(characters, i, i+1)
        if result.count < double.count {
            result = double
        }
    }

    return String(result)
}

private func longestPalindrome(_ s: [Character], _ l: Int, _ r: Int) -> ArraySlice<Character> {
    guard l >= 0 && r < s.count && s[l] == s[r] else { return [] }
    var l = l, r = r

    while l >= 0 && r < s.count && s[l] == s[r] {
        l -= 1
        r += 1
    }
    
    return s[l+1...r-1]
}