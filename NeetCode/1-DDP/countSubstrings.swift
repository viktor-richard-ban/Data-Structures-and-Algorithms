// Time: O(n^2)
// Space: O(n)
func countSubstrings(_ s: String) -> Int {
    let characters = Array(s)
    var result = 0

    for i in 0..<characters.count {
        let single = countPalindrome(characters, i, i)
        result += single

        let double = countPalindrome(characters, i, i+1)
        result += double
    }

    return result
}

private func countPalindrome(_ s: [Character], _ l: Int, _ r: Int) -> Int {
    var l = l, r = r
    var result = 0

    while l >= 0 && r < s.count && s[l] == s[r] {
        l -= 1
        r += 1
        result += 1
    }
    
    return result
}