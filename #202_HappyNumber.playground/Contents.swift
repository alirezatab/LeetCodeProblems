/*
 
 108
 while val < 10 ... keep deviding
 use dic... to go through and if a value that has been met before, means infinite loop and reutrn false
 
 */




// Set or disctionary
/*
 using set causes 0.00% - additional space
 Runtime: 12 ms, faster than 72.73% of Swift online submissions for Happy Number.
 Memory Usage: 3.9 MB, less than 0.00% of Swift online submissions for Happy Number.
 */

class Solution {
    func isHappy(_ n: Int) -> Bool {
        
        var set = Set<Int>()
        
        var num = n
        var sum = 0
        repeat {
            sum = 0
            while num != 0 {
                let reminder = num%10
                num = num/10
                sum += (reminder*reminder)
            }
            if set.contains(sum) {
                return false
            }
            set.insert(sum)
            num = sum
        } while sum != 1
        
        return true
    }
}

// fast slow ptr
/*
 cause of small recrusion, space is still 0
 Runtime: 8 ms, faster than 100.00% of Swift online submissions for Happy Number.
 Memory Usage: 3.8 MB, less than 100.00% of Swift online submissions for Happy Number.
 Memory Usage: 3.9 MB, less than 0.00% of Swift online submissions for Happy Number.
 */
class Solution1 {
    func isHappy(_ n: Int) -> Bool {
        
        var slow = n
        var fast = n
        
        repeat {
            slow = squareNumber(slow)
            fast = squareNumber(squareNumber(fast))
            
            if fast == 1 {
                return true
            }
        } while slow != fast
        
        return false
    }
    
    func squareNumber(_ number: Int ) -> Int {
        var sum = 0
        var num = number
        while num != 0 {
            let reminder = num%10
            num = num/10
            sum += (reminder*reminder)
        }
        return sum
    }
}
