struct Item: Comparable {
    let points: [Int]

    // Time: O(1)
    // Space: O(1)
    static func < (left: Item, right: Item) -> Bool {
        let leftDist = left.points[0] * left.points[0] + left.points[1] * left.points[1]
        let rightDist = right.points[0] * right.points[0] + right.points[1] * right.points[1]
        return leftDist < rightDist
    }
}
// Time: O(n log k)
// Space: O(k)
func kClosest(_ points: [[Int]], _ k: Int) -> [[Int]] {
    var heap = Heap<Item>()
    for point in points {
        let item = Item(points: point)
        heap.insert(item)
        if heap.count > k {
            heap.removeMax()
        }
    }
    
    return heap.unordered.map { $0.points }
}