// Time: O(n log n)
// Space: O(n)
func connectSticks(_ sticks: [Int]) -> Int {
    var heap = Heap<Int>(sticks)
    var cost = 0
    
    while heap.count > 1 {
        let first = heap.popMin()!
        let second = heap.popMin()!
        cost += first + second
        heap.insert(first + second)
    }
    
    return cost
}