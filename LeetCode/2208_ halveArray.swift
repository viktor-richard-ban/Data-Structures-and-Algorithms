// Time: O(n log n)
// Space: O(n)
func halveArray(_ nums: [Int]) -> Int {
    var heap = Heap<Double>(nums.map { Double($0) })
    var operations: Int = 0
    var sum = Double(nums.reduce(0, +))
    let targetSum: Double = sum / 2

    while sum > targetSum {
        operations += 1

        let halvedValue = heap.popMax()! / 2
        sum -= halvedValue
        heap.insert(halvedValue)
    }

    return operations
}