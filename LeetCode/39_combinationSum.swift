// Time: O(k^(target / minVal))
// Space: O(target / min + S * (target / min))
// S is the number of solutions (exponential in worst case)
func combinationSum(_ candidates: [Int], _ target: Int) -> [[Int]] {
    let candidates = candidates.sorted()
    var combinations: [[Int]] = []

    func backtrack(_ combination: [Int], _ i: Int, _ sum: Int) {
        if sum == target {
            combinations.append(combination)
            return
        }

        for j in i..<candidates.count {
            let num = candidates[j]
            if sum + num > target { break }
            var newCombindation = combination
            newCombindation.append(num)
            backtrack(newCombindation, j, sum + num)
        }
    }

    backtrack([], 0, 0)
    return combinations
}