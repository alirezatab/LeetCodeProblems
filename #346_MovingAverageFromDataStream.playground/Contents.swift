/*
 size is 3
 
 on next calls
 queue -- insert 1 on next -- sum = 1
 1/1 = 1 so return 1
 queue -- insert 10 on next -- sum = 11
 11/2 so return double
 queue -- insert 5 on next -- sum = 16
 16/3 so return double
 
 quque -- insert 3 on next
 check the size of queue, if bigger than self.size
 then deque, subtract the dequed value from sum
 deque 1, 16-1 = 15 = sum
 
 15+3 = 18 is the new sum
 1   18/3 and retur double
 */

/*
 Runtime: 112 ms, faster than 99.12% of Swift online submissions for Moving Average from Data Stream.
 Memory Usage: 22.1 MB, less than 5.68% of Swift online submissions for Moving Average from Data Stream.
 
 Time: o(1)
 Space: o(N) cause of the array
 */


class MovingAverage {
    
    /** Initialize your data structure here. */
    private let size: Int
    private var sum = 0
    private var queue = [Int]()
    
    init(_ size: Int) {
        self.size = size
    }
    
    func next(_ val: Int) -> Double {
        
        queue.append(val)
        
        if queue.count > self.size {
            sum -= queue.removeFirst()
        }
        
        sum += val
        
        return Double(sum)/Double(queue.count)
    }
}

/**
 * Your MovingAverage object will be instantiated and called as such:
 * let obj = MovingAverage(size)
 * let ret_1: Double = obj.next(val)
 */
