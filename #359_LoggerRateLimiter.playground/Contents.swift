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


/*
 dictionary format
 key     val
 m     timeStamp
 foo       1     -> if empty return true
 bar       2     -> if empty return true
 
 foo -> 3-1 < 10 -> rerun false
 bar -> 8-2 < 10 -> return false
 foo -> 10-1  <10 -> return false
 foo -> 11-1 !< 10 -> update dic then return true
 
 
 if not empty
 foo lookUp -> oldTimeStamp = 1 ->
 if newTimeStamp-oldTimeStamp >= 10
 dic[foo] = newTimeStamps
 return true
 retuen false
 */

/*
 Runtime: 340 ms, faster than 86.67% of Swift online submissions for Logger Rate Limiter.
 Memory Usage: 22.4 MB, less than 8.00% of Swift online submissions for Logger Rate Limiter.
 
 Time: o(1)
 space: o(N)
 
 a bit faster cause of the shorter code and less if else checks
 */

class Logger2 {
    
    var dic: [String:Int]
    
    init() {
        self.dic = [String:Int]()
    }
    
    /** Returns true if the message should be printed in the given timestamp, otherwise returns false.
     If this method returns false, the message will not be printed.
     The timestamp is in seconds granularity. */
    func shouldPrintMessage(_ timestamp: Int, _ message: String) -> Bool {
        if let oldTimestamp = dic[message] {
            let dif = timestamp - oldTimestamp
            if dif >= 10 {
                dic[message] = timestamp
                return true
            }
            return false
        }
        dic[message]=timestamp
        return true
    }
}

/**
 * Your Logger object will be instantiated and called as such:
 * let obj = Logger()
 * let ret_1: Bool = obj.shouldPrintMessage(timestamp, message)
 */
