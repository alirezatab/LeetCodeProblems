/*
 Runtime: 12 ms, faster than 100.00% of Swift online submissions for Reverse Integer.
 Memory Usage: 3.9 MB, less than 31.03% of Swift online submissions for Reverse Integer.
 */

class Solution {
    func reverse(_ x: Int) -> Int {
        var copyX = x
        var finalNum = 0
        let INT_MAX = 2147483647
        let INT_MIN = -2147483648
        
        while copyX != 0 {
            let remainder = copyX%10
            copyX = copyX/10
            
            finalNum = (finalNum*10)+remainder
            
            if finalNum >= INT_MAX {
                return 0
            }
            if finalNum <= INT_MIN {
                return 0
            }
        }
        return finalNum
    }
    
}
