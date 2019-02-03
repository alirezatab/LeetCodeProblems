/*
 way1: create a hashtable based on the size of needle
 look throguh hash table to see  if keys match
 0(n) time, o(n) space
 
 way2: two pointers... inc one based on the size of needle... and check by icrementing both 0(n) time, o(1) space
 
 // can be done recruisively too but uses a stack
 use range
 hello
 ^ ^
 ll
 */

//Runtime: 20 ms, faster than 85.19% of Swift online submissions for Implement strStr().
//Memory Usage: 4.2 MB, less than 66.67% of Swift online submissions for Implement strStr().
class Solution {
    func strStr(_ haystack: String, _ needle: String) -> Int {
        if needle.count == 0 {return 0}
        if haystack.count < needle.count || haystack.count == 0 {return -1}
        
        var slowPtr = 0
        
        for index in needle.count-1..<haystack.count {
            let start = haystack.index(haystack.startIndex, offsetBy: slowPtr)
            let end = haystack.index(haystack.startIndex, offsetBy: index)
            
            if haystack[start...end] == needle {
                return slowPtr
            }
            
            slowPtr += 1
        }
        return -1
        
    }
}

/*
 Runtime: 24 ms, faster than 55.56% of Swift online submissions for Implement strStr().
 Memory Usage: 4.1 MB, less than 100.00% of Swift online submissions for Implement strStr().
 
class Solution {
    func strStr(_ haystack: String, _ needle: String) -> Int {
        if needle.count == 0 {return 0}
        if haystack.count < needle.count || haystack.count == 0 {return -1}
        
        let needleCount = needle.count
        var slowPtr = 0
        var runnerPtr = needleCount-1
        
        while runnerPtr < haystack.count {
            let start = haystack.index(haystack.startIndex, offsetBy: slowPtr)
            let end = haystack.index(haystack.startIndex, offsetBy: runnerPtr)
            
            if haystack[start...end] == needle {
                return slowPtr
            }
            
            slowPtr += 1
            runnerPtr += 1
        }
        return -1
        
    }
}
*/
