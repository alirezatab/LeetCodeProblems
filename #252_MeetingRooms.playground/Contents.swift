
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
         
         var startArr = [Int]()                 // var startTimeArr = Array(repeating:0, count: intervals.count)
         var endArr = [Int]()                   // var endTimeArr = Array(repeating:0, count: intervals.count)
         
         for interval in intervals {            // for i in 0..<intervals.count {
            startArr.append(interval.start)         // startTimeArr[i] = intervals[i].start
            endArr.append(interval.end)             // endTimeArr[i] = intervals[i].end
         }                                      // }
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

class Solution1 {
    func canAttendMeetings(_ intervals: [Interval]) -> Bool {
        guard intervals.count > 1 else {return true}
        
        //let startTimeArr = intervals.map{$0.start}.sorted()
        //let endTimeArr = intervals.map{$0.end}.sorted()
        
        var startTimeArr = Array(repeating:0, count: intervals.count)
        var endTimeArr = Array(repeating:0, count: intervals.count)
        for i in 0..<intervals.count {
            startTimeArr[i] = intervals[i].start
            endTimeArr[i] = intervals[i].end
        }
        startTimeArr.sort()
        endTimeArr.sort()
        
        var startIndex = 1
        var endIndex = 0
        
        
        while startIndex<startTimeArr.count && endIndex<endTimeArr.count {
            if endTimeArr[endIndex]>startTimeArr[startIndex] {return false}
            startIndex += 1
            endIndex += 1
        }
        return true
    }
}
