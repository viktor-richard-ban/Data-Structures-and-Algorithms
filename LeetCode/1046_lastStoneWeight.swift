// Time: O(n log n)
// Space: O(n)
func lastStoneWeight(_ stones: [Int]) -> Int {
    var heap = Heap(stones)

    while heap.count > 1 {
        let y = heap.popMax()!
        let x = heap.popMax()!
        if x != y {
            heap.insert(y-x)
        }
    }

    return heap.popMax() ?? 0
}