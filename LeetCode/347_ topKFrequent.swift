// Time: O(n log k)
// Space: O(n + k)
func topKFrequent(_ nums: [Int], _ k: Int) -> [Int] {
    var frequencies: [Int:Int] = [:]
    for num in nums {
        frequencies[num, default: 0] += 1
    }

    var heap = Heap<Pair>()
    for (key, value) in frequencies {
        heap.insert(Pair(key, value))
        if heap.count > k {
            heap.removeMin()
        }
    }
    
    var result: [Int] = []
    while heap.count > 0 {
        result.append(heap.removeMin().num)
    }
    return result
}

struct Pair: Comparable {
    let num: Int
    let freq: Int

    init(_ num: Int, _ freq: Int) {
        self.num = num
        self.freq = freq
    }
    
    static func < (lhs: Pair, rhs: Pair) -> Bool {
        lhs.freq < rhs.freq
    }
}