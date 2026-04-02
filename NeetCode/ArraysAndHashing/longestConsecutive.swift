
// Time: O(n)
// Space: O(n)
func longestConsecutive(_ nums: [Int]) -> Int {
    var numSet = Set(nums)
    // [start: length]
    var ranges: [Int: Int] = [:]

    while !numSet.isEmpty {
        var current = numSet.removeFirst()
        var length = 1

        while numSet.contains(current + length) {
            numSet.remove(current + length)
            length += 1
        }

        let next = current + length
        if ranges[next] != nil {
            length += ranges[next]!
            ranges.removeValue(forKey: next)
        }
        ranges[current] = length
    }

    var longest = 0
    for key in ranges.keys {
        longest = max(longest, ranges[key]!)
    }
    return longest
}

// Time: O(n)
// Space: O(n)
func longestConsecutive_optimized(_ nums: [Int]) -> Int {
    var numSet = Set(nums)
    var longest = 0

    for num in numSet {
        if numSet.contains(num - 1) { continue }
        
        var currentLength = 0
        while numSet.contains(num + currentLength) {
            currentLength += 1
        }

        longest = max(longest, currentLength)
    }

    return longest
}