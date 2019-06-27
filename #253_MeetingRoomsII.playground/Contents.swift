/*
 [[0, 30],[5, 10],[15, 20]]
                if value@s < value@e
 [0,5,15]        increse count by 1
    s              increase startby 1
 [10,20,30]
  e
 
 count = 1
 [0,5,15]        increse count by 1
       s            increase startby 1
 [10,20,30]
  e
 
 count = 2
 [0,5,15]        if value@s > value@e
         s          inc e && s
 [10,20,30]
     e
 
 count = 0
 [2,7]
  s
 [4,10]
  e
 
 count = 1
 [2,7]
    s
 [4,10]
  e
 
 [2,7]
       s
 [4,10]
     e

 */

/*
 Runtime: 80 ms, faster than 98.45% of Swift online submissions for Meeting Rooms II.
 Memory Usage: 19.5 MB, less than 7.69% of Swift online submissions for Meeting Rooms II.
 
 Time: o(nlogn)
 Space: o(n)
 */

/**
 * Definition for an interval.
*/
public class Interval {
    public var start: Int
    public var end: Int
    public init(_ start: Int, _ end: Int) {
        self.start = start
        self.end = end
    }
}

class Solution {
    func minMeetingRooms(_ intervals: [Interval]) -> Int {
        guard intervals.count > 0 else {return 0}
        guard intervals.count > 1 else {return 1}
        
        let startTimes = intervals.map {$0.start}.sorted()
        let endTimes = intervals.map {$0.end}.sorted()
        
        var startTimeIndex = 0
        var endTimeIndex = 0
        var numberOfRooms = 0
        
        while startTimeIndex<startTimes.count && endTimeIndex<endTimes.count {
            if startTimes[startTimeIndex] < endTimes[endTimeIndex] {
                numberOfRooms+=1
            } else {
                endTimeIndex+=1
            }
            startTimeIndex+=1

        }
        
        return numberOfRooms
    }
}

/*
 [[0, 30],[5, 10],[15, 20]]
 
 startTime = [0,5,15]
 endTime = [30,10,20]
 
 sort both
 counter = 1
 i
 startTime = [0,5,15]
 j
 endTime = [10,20,30]
 
 if startTime[i] is < endTime[j], inc i
 
 i
 startTime = [0,5,15]
 j
 endTime = [10,20,30]
 
 else {counter+=1, inc j }
 
 startTime = [0,5,15]
 
 endTime = [10,20,30]
 
 
 
 */

class Solution1 {
    func minMeetingRooms(_ intervals: [[Int]]) -> Int {
        guard intervals.count > 0 else {return 0}
        guard intervals.count > 1 else {return 1}
        
        var startTimes = intervals.map {$0.first!}.sorted()
        var endTimes = intervals.map {$0.last!}.sorted()
        
        var startTimeIndex = 0
        var endTimeIndex = 0
        var numberOfRooms = 0
        
        while startTimeIndex<startTimes.count && endTimeIndex<endTimes.count {
            if startTimes[startTimeIndex] < endTimes[endTimeIndex] {
                numberOfRooms += 1
            } else {
                endTimeIndex += 1
            }
            startTimeIndex+=1
            
        }
        return numberOfRooms
    }
}
