/*
Given the below matrix, find the shortest path for a robot to get from top left to  bottom right 
(these are x, y coordinates FYI). The zeros in the matrix represent occupy-able positions and the ones are un-occupy-able positions. The robot cannot move diagonally. 

from: (0, 0)
to: (6, 4)

in:
[[0,1,0,1,1,0,1],
 [0,1,1,1,1,0,1],
 [0,0,0,1,1,0,1],
 [1,1,0,1,1,0,1],
 [0,1,0,0,0,0,0]]

 returns:
 [[0,0],[0,1],[0,2],[1,2],[2,2],[2,3],[2,4],[3,4],[4,4],[5,4],[6,4]]

 steps:
 [[0,0,0,0,0,0,0],
  [1,0,0,0,0,0,0],
  [2,3,4,0,0,0,0],
  [0,0,5,0,0,10,0],
  [0,0,6,7,8,9,10]]
*/

func shortestPath(input: [[Int]]) -> [[Int]] {
    guard input.count > 0 else { return [] }
    var steps: [[Int]] = Array(repeating: Array(repeating: -1, count: input[0].count), count: input.count)
    let directions: [(Int,Int)] = [(0,1),(0,-1),(1,0),(-1,0)]
    let maxY = input.count - 1, maxX = input[maxY].count - 1

    func isValid(_ x: Int, _ y: Int) -> Bool {
        return y >= 0 && y <= maxY &&
            x >= 0 && x <= maxX
    }

    func isDiscoverable(_ x: Int, _ y: Int) -> Bool {
        return input[y][x] == 0 && steps[y][x] == -1
    }

    var queue: [(Int,Int)] = [(0,0)]
    steps[0][0] = 0
    queueLoop: while !queue.isEmpty {
        var newQueue: [(Int,Int)] = []
        for item in queue {
            let x = item.0, y = item.1
            if y == maxY && x == maxX { break queueLoop }

            for direction in directions {
                let newX = item.0 + direction.0
                let newY = item.1 + direction.1
                if !isValid(newX, newY) || !isDiscoverable(newX, newY) { continue }
                steps[newY][newX] = steps[y][x] + 1
                newQueue.append((newX, newY))
            }
        }
        queue = newQueue
    }

    if steps[maxY][maxX] == -1 { return [] }

    var path: [[Int]] = []
    var findX = maxX, findY = maxY
    while true {
        path.append([findX,findY])
        guard findX > 0 || findY > 0 else { break }
        for direction in directions {
            let newX = findX + direction.0
            let newY = findY + direction.1
            if !isValid(newX, newY) { continue }
            if steps[newY][newX] == steps[findY][findX] - 1 {
                findX = newX
                findY = newY
                break
            }
        }
    }

    return path.reversed()
}

var input = [[0,1,0,1,1,0,1],
 [0,1,1,1,1,0,1],
 [0,0,0,1,1,0,1],
 [1,1,0,1,1,0,1],
 [0,1,0,0,0,0,0]]
print(shortestPath(input: input))
input = [[0,1,0,1,1,0,1],
 [0,1,1,1,1,0,1],
 [0,0,0,1,1,0,1],
 [1,1,0,1,1,0,1],
 [0,1,1,0,0,0,0]]
 print(shortestPath(input: input))
print(shortestPath(input: []))