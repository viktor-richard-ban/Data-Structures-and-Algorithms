import Collections

// Space: O(n)
class MedianFinder {
    // max heap
    var smaller = Heap<Int>()
    // min heap, contains equal or more elements
    var bigger = Heap<Int>()
    
    // Time: O(log n)
    func addNum(_ num: Int) {
        bigger.insert(num)
        smaller.insert(bigger.popMin()!)
        if smaller.count > bigger.count {
            bigger.insert(smaller.popMax()!)
        }
    }
    
    // Time: O(log n)
    func findMedian() -> Double {
        if smaller.count == bigger.count {
            return (Double(smaller.max!) + Double(bigger.min!)) / 2
        }
        return Double(bigger.min!)
    }
}
