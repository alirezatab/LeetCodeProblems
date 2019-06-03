// dic that message is key and value is time stamp
// if empty, insert message and timestamp, return true
// if not empty, get onld time stamp, check the difference aainst ne one and if less than 10, return false
// otherwise return true and update the data

/*
 foo 1 -> true
 bar 2 -> true
 
 foo -> grab 1 -> 3-1 < 10 -> return false
 bar -> grab 2 -> 8-2 < 10 -> return false
 foo -> grab 1 -> 10-1 < 10 -> return false
 foor -> grab 1 -> 11-1 < 10 -> retur true -- update with new timestamps 11
 */

/*
 Runtime: 340 ms, faster than 95.16% of Swift online submissions for Logger Rate Limiter.
 Memory Usage: 22.3 MB, less than 6.25% of Swift online submissions for Logger Rate Limiter.
 
 Time: o(1)
 space: o(N)
 */

class Logger {
    
    /** Initialize your data structure here. */
    var loggerDic: [String:Int]
    
    init() {
        self.loggerDic = [String:Int]()
    }
    
    /** Returns true if the message should be printed in the given timestamp, otherwise returns false.
     If this method returns false, the message will not be printed.
     The timestamp is in seconds granularity. */
    func shouldPrintMessage(_ timestamp: Int, _ message: String) -> Bool {
        if let oldTimeStamp = loggerDic[message] {
            let delta = timestamp - oldTimeStamp
            if delta < 10 {
                return false
            } else {
                loggerDic[message] = timestamp
                return true
            }
        }
        
        loggerDic[message] = timestamp
        return true
    }
}

/**
 * Your Logger object will be instantiated and called as such:
 * let obj = Logger()
 * let ret_1: Bool = obj.shouldPrintMessage(timestamp, message)
 */
