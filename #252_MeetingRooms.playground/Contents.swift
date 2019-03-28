
//Definition for an interval.
public class Interval {
    public var start: Int
    public var end: Int
    public init(_ start: Int, _ end: Int) {
        self.start = start
        self.end = end
    }
}

/*
 Runtime: 80 ms, faster than 100.00% of Swift online submissions for Meeting Rooms.
 Memory Usage: 19.1 MB, less than 50.00% of Swift online submissions for Meeting Rooms.
 */

class Solution {
    func canAttendMeetings(_ intervals: [Interval]) -> Bool {
        guard intervals.count > 1 else {return true}
        
        /*
         first initail verbose way
         
         var startArr = [Int]()
         var endArr = [Int]()
         
         for interval in intervals {
         startArr.append(interval.start)
         endArr.append(interval.end)
         }
         startArr.sort()
         endArr.sort()
         */
        
        /*
         apple map and sorted is faster
         */
        let startArr = intervals.map({$0.start}).sorted()
        let endArr = intervals.map({$0.end}).sorted()
        
        var i = 1
        var j = 0
        while i<startArr.count && j<endArr.count {
            if startArr[i] < endArr[j] {
                return false
            }
            i+=1
            j+=1
        }
        
        return true
    }
}
