struct Item: Comparable {
    let value: Int
    let distance: Int

    init(_ value: Int, _ distance: Int) {
        self.value = value
        self.distance = distance
    }

    static func <(left: Self, right: Self) -> Bool {
        left.distance == right.distance ? left.value < right.value : left.distance < right.distance
    }
}

// Time: O(n log k)
// Space: O(k)
func findClosestElements(_ arr: [Int], _ k: Int, _ x: Int) -> [Int] {
    var heap = Heap<Item>()
    for num in arr {
        let item = Item(num, abs(x-num))
        heap.insert(item)
        if heap.count > k {
            heap.removeMax()
        }
    }

    var result: [Int] = []
    while heap.count > 0 {
        result.append(heap.removeMin().value)
    }
    return result.sorted()
}

// Time: Olog (n-k))
// Space: O(k)
func findClosestElements(_ arr: [Int], _ k: Int, _ x: Int) -> [Int] {
    var left = 0, right = arr.count - k

    while left < right {
        let mid = left + (right - left) / 2
        if x - arr[mid] > arr[mid + k] - x {
            left = mid + 1
        } else {
            right = mid
        }
    }

    return Array(arr[left..<(left+k)])
}