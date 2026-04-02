// Brute force
// Time: O(n^2)
// Space: O(1)
func productExceptSelf_bruteForce(_ nums: [Int]) -> [Int] {
    var result = nums

    for iIndex in 0..<nums.count {
        var product = 1
        for jIndex in 0..<nums.count {
            if iIndex == jIndex { continue }
            product *= nums[jIndex]
        }
        result[iIndex] = product
    }

    return result
}

// Time: O(n)
// Space: O(1)
func productExceptSelf(_ nums: [Int]) -> [Int] {
    var result = [Int](repeating: 1, count: nums.count)
    var product = 1
    for index in 0..<nums.count {
        result[index] = product
        product *= nums[index]
    }

    product = 1
    for index in stride(from: nums.count - 1, through: 0, by: -1) {
        result[index] *= product
        product *= nums[index]
    }

    return result
}

var nums = [1,2,4,6]
print(productExceptSelf(nums))
nums = [-1,0,1,2,3]
print(productExceptSelf(nums))