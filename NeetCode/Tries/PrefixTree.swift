class PrefixTree {
    private class Node {
        var isWord: Bool = false
        var children: [Character: Node] = [:]

        func childWith(_ char: Character) -> Node? {
            return children[char]
        }
    }

    private var root: Node = Node()

    func insert(_ word: String) {
        let chars = Array(word)
        var node = root

        for char in chars {
            if let charNode = node.childWith(char) {
                node = charNode
            } else {
                let charNode = Node()
                node.children[char] = charNode
                node = charNode
            }
        }

        node.isWord = true
    }

    func search(_ word: String) -> Bool {
        let chars = Array(word)
        var node = root

        for char in chars {
            if let charNode = node.childWith(char) {
                node = charNode
            } else {
                return false
            }
        }
        return node.isWord
    }

    func startsWith(_ prefix: String) -> Bool {
        let chars = Array(prefix)
        var node = root

        for char in chars {
            if let charNode = node.childWith(char) {
                node = charNode
            } else {
                return false
            }
        }
        return true
    }
}
