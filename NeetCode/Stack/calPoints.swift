func calPoints(_ operations: [String]) -> Int {
    var stack: [Int] = []
    var len: Int { stack.count }
    var result: Int = 0

    for operation in operations {
        switch operation {
            case "+":
                let sumOfTwo = stack[len-1] + stack[len-2]
                stack.append(sumOfTwo)
                result += sumOfTwo
            case "C":
                result -= stack.removeLast()
            case "D":
                let num = stack[len-1] * 2
                stack.append(num)
                result += num
            default:
                let num = Int(operation)!
                stack.append(num)
                result += num
        }
    }

    return result
}