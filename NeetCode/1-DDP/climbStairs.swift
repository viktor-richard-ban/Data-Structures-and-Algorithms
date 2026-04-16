/*

Constraints

1 <= n <= 45

*/

// Time: O(n)
// Space: O(n)
func climbStairs(_ n: Int) -> Int {
    var memory: [Int: Int] = [
        1: 1,
        2: 2
    ]
    func dfs(_ n: Int) -> Int {
        if let steps = memory[n] { return steps }
        var steps = dfs(n-1) + dfs(n-2)
        memory[n] = steps
        return steps
    }
    return dfs(n)
}

// Time: O(n)
// Space: O(1)
func climbStairs(_ n: Int) -> Int {
    var one = 1, two = 1

    for _ in 0..<n-1 {
        let tmp = one
        one = one + two
        two = tmp
    }

    return one
}