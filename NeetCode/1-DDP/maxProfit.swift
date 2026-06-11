// Time: O(n)
// Space: O(1)
func maxProfit(_ prices: [Int]) -> Int {
    var buy = prices[0], best = 0
    for i in 1..<prices.count {
        if prices[i] < buy {
            buy = prices[i]
        } else {
            best = max(best, prices[i] - buy)
        }
    }
    return best
}

// Time: O(n^2)
// Space: O(1)
func maxProfit(_ prices: [Int]) -> Int {
    var best = 0
    for i in 0..<prices.count {
        for j in i+1..<prices.count {
            let currentTransaction = prices[j] - prices[i]
            best = max(best, currentTransaction)
        }
    }
    return best
}