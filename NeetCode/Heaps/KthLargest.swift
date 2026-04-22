class KthLargest {
    let k: Int
    var nums: [Int]

    // Time: O(1)
    // Space: O(1)
    init(_ k: Int, _ nums: [Int]) {
        self.k = k
        self.nums = nums
    }

    // Time: O(n log n)
    // Space: O(n)
    func add(_ val: Int) -> Int {
        nums.append(val)
        nums.sort { $0 > $1 }
        while nums.count > k {
            nums.removeLast()
        }
        return nums[k-1]
    }
}