// Space: O(100)
class MyHashMap {
    private var storage: [[[Int]]] = Array(repeating: [], count: 100)

    // Amortized O(1)
    // Space: O(1)
    func put(_ key: Int, _ value: Int) {
        let hashedKey = hash(key)
        // If found, update it
        for index in 0..<storage[hashedKey].count {
            if storage[hashedKey][index][0] == key {
                storage[hashedKey][index][1] = value
                return
            }
        }

        // If not found, add it
        storage[hashedKey].append([key, value])
    }

    // Amortized O(1)
    // Space: O(1)
    func get(_ key: Int) -> Int {
        let hashedKey = hash(key)
        let pairs = storage[hashedKey]
        for pair in pairs {
            if pair[0] == key {
                return pair[1]
            }
        }
        return -1
    }

    // Amortized O(1)
    // Space: O(1)
    func remove(_ key: Int) {
        let hashedKey = hash(key)
        storage[hashedKey].removeAll(where: { $0[0] == key })
    }

    // Time: O(1)
    // Space: O(1)
    private func hash(_ key: Int) -> Int {
        key % storage.count
    }
}