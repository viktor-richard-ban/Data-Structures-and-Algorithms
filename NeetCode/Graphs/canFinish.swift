// Time: O(N + P)
// Space: O(N + P)
// P: Number of prerequisites
// N: Number of courses
// removeFirst causes O(n) extra time complexity, deque should be used to make it O(1)
// time complexity consideres the solution uses deque
func canFinish(_ numCourses: Int, _ prerequisites: [[Int]]) -> Bool {
    // [dependencyOf: [course]]
    var dependencies: [Int: [Int]] = [:]
    var dependencyCounts = Array(repeating: 0, count: numCourses)
    for prerequisite in prerequisites {
        dependencies[prerequisite[1], default: []].append(prerequisite[0])
        dependencyCounts[prerequisite[0]] += 1
    }

    var queue: [Int] = []
    for course in 0..<numCourses {
        if dependencyCounts[course] == 0 {
            queue.append(course)
        }
    }

    var completed: Int = 0
    while !queue.isEmpty {
        let current = queue.removeFirst()
        for dependency in dependencies[current, default: []] {
            dependencyCounts[dependency] -= 1
            if dependencyCounts[dependency] == 0 {
                queue.append(dependency)
            }
        }
        completed += 1
    }
    return completed == numCourses
}