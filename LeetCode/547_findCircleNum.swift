// Time: O(n^2)
// Space: O(n)
func findCircleNum(_ isConnected: [[Int]]) -> Int {
    var seen: Set<Int> = Set()
    var provinces = 0

    func dfs(_ index: Int) {
        if seen.contains(index) { return }
        seen.insert(index)            
        for (connectionIdx, isConnected) in isConnected[index].enumerated() where !seen.contains(connectionIdx) && isConnected == 1 {
            dfs(connectionIdx)
        }
    }

    for cityIdx in 0..<isConnected.count where !seen.contains(cityIdx) {
        dfs(cityIdx)
        provinces += 1
    }
    return provinces
}