
//// First solution is not converting to String
/*
 get remainder of num and append it to an array -> num is devided by 10 and update Num
 121 reminder is 1, num is 12 --> [1]
 12 reminder is 2, num is 1 --> [1,2]
 1 reminder is 1, num is 0 --> [1,2,1]
 
 got thorough arr front and back to see if palindrome
 *   v
 [1,2,1] true
 V
 *
 [1,2,1] true
 
 base case, less than zero is not palindrome
 
 check if less than 0, return false ==> base case
 
 init an empty array
 copyNum = num
 while copyNum is not zero
 divide and get the remainder and update the number
 
 init var front
 init var back that is the sizeOfArr-1
 
 got throught the array while front<back
 if not same return false
 
 return true
 */

/*
 Runtime: 64 ms, faster than 60.89% of Swift online submissions for Palindrome Number.
 Memory Usage: 4.2 MB, less than 66.67% of Swift online submissions for Palindrome Number.
 
 Time = 0(n)
 space = 0(n)
 */

// Assumption, leading zeros will not be there. es: 01

class Solution {
    func isPalindrome(_ x: Int) -> Bool {
        guard x > -1 else {return false}
        
        var copyNum = x
        var arr = [Int]()
        
        while copyNum != 0 {
            let remainder = copyNum%10
            copyNum /= 10
            
            arr.append(remainder)
        }
        
        var front = 0
        var back = arr.count-1
        
        while front<back {
            if arr[front] != arr[back] {
                return false
            }
            front+=1
            back-=1
        }
        
        return true
    }
}


/*
 Runtime: 76 ms, faster than 40.59% of Swift online submissions for Palindrome Number.
 Memory Usage: 4.2 MB, less than 96.53% of Swift online submissions for Palindrome Number.
 
 Time = 0(n)
 space = 0(1)
 */

// convert to strig and use front/back window
class Solution1 {
    func isPalindrome(_ x: Int) -> Bool {
        let str = String(x)
        
        guard str.count > 1 else {return true}
        
        var start = 0
        var end = str.count-1
        
        while start<end {
            let sIndex = str.index(str.startIndex, offsetBy: start)
            let eIndex = str.index(str.startIndex, offsetBy: end)
            
            if str[sIndex] != str[eIndex] {
                return false
            }
            
            start+=1
            end-=1
        }
        
        return true
        
    }
}
