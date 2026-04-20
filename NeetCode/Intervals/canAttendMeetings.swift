// Time: O(n log n)
// Space: O(n)
func canAttendMeetings(_ intervals: [Interval]) -> Bool {
    guard intervals.count > 0 else { return true }
    let sortedIntervals = intervals.sorted { $0.start < $1.start }

    for index in 1..<sortedIntervals.count {
        if sortedIntervals[index-1].end > sortedIntervals[index].start {
            return false
        }
    }

    return true
}