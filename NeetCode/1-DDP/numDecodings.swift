// Time: O(n)
// Space: O(n)
func numDecodings(_ s: String) -> Int {
    var memo: [ArraySlice<Character>: Int] = [:]
    func dp(_ chars: ArraySlice<Character>) -> Int {
        if let chached = memo[chars] { return chached }
        if chars.count == 1 && chars[0] > "0" || chars.count == 0 { return 1 }
        let lastIndex = chars.count - 1, lastLastIndex = chars.count - 2
        var result = 0
        
        // Cut two
        if chars.count >= 2 && (chars[lastLastIndex] == "1" ||
                chars[lastLastIndex] == "2" && chars[lastIndex] <= "6") {
            result += dp(chars[0..<chars.count-2])
        }

        // Cut one
        if chars[lastIndex] > "0" {
            result += dp(chars[0..<chars.count-1])
        }

        memo[chars] = result
        return result
    }
    let chars: [Character] = Array(s)
    return dp(chars[0..<chars.count])
}