// Time: O(M * N * L^3)
// Space: O(M * N + L)
// M * N: local board
// L: length of the word
func exist(_ board: [[Character]], _ word: String) -> Bool {
    let word = Array(word)
    let directions: [[Int]] = [[-1,0], [1,0], [0,-1], [0,1]]
    var board = board
    func backtrack(_ x: Int, _ y: Int, _ iWord: Int) -> Bool {
        if iWord == word.count {
            return true
        }

        let tmp = board[y][x]
        board[y][x] = "#"
        for direction in directions {
            let newX = x + direction[0]
            let newY = y + direction[1]
            if isValid(newX, newY) && board[newY][newX] == word[iWord] {
                if backtrack(newX, newY, iWord+1) {
                    return true
                }
            }
        }
        board[y][x] = tmp

        return false
    }

    func isValid(_ newX: Int, _ newY: Int) -> Bool {
        guard newY >= 0 && newY < board.count,
            newX >= 0 && newX < board[newY].count else { return false }
        return true
    }

    for y in 0..<board.count {
        for x in 0..<board[y].count {
            if board[y][x] == word[0] {
                if backtrack(x, y, 1) {
                    return true
                }
            }
        }
    }
    return false
}