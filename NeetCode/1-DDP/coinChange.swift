// Time: O(n * amount)
// Space: O(amount)
func coinChange(_ coins: [Int], _ amount: Int) -> Int {
    var memo: [Int:Int] = [0:0]

    func dp(_ amount: Int) -> Int {
        if let cached = memo[amount] { return cached }
        var minCoin: Int = Int.max

        for coin in coins {
            let newAmount = amount - coin
            if newAmount >= 0 {
                let rest = dp(newAmount)
                if rest >= 0 {
                    minCoin = min(minCoin, 1 + rest)
                }
            }
        }

        memo[amount] = minCoin == Int.max ? -1 : minCoin
        return memo[amount]!
    }

    return dp(amount)
}