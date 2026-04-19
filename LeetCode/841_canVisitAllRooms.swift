// Time: O(n)
// Space: O(n)
func canVisitAllRooms(_ rooms: [[Int]]) -> Bool {
    var visited: Set<Int> = [0]
    var keys: [Int] = [0]

    while !keys.isEmpty {
        guard visited.count < rooms.count else { break }
        let room = keys.removeLast()
        for key in rooms[room] where !visited.contains(key) {
            keys.append(key)
            visited.insert(key)
        }
    }

    return visited.count == rooms.count
}