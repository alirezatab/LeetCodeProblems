/*
 // this code does not maintaining the relative order of the non-zero elements.
 [0,1,0,3,12] if end is not 0, begining is 0, swap
  ^        ^
 [12,1,0,3,0] inc star, dec end
 ^   ^
 [12,1,0,3,0] if start is not 0, inc... then swap
 ^ ^
 [12,1,3,0,0]
 
 ------------------------------------------------------------------------
 
 init var start to 0
 init var end to endOf Index
 
 go thorugh the array while start < end
 if start != 0
 inc start
 if end == 0
 dec end
 else swap case start == 0 && and is >0
 inc start
 dec end
 
 // to keep order as close as possible
 *           while runner is not out of bound
 [0,1,0,3,12] init slow and runner to 0
  s
    r         if runner == 0, inc runner

 [0,1,0,3,12] if slow is 0 and runner != 0 swap
  s r
 
 [1,0,0,3,12] inc both fast and slow after swap
    s r
 
 [1,0,0,3,12] if runner == 0, inc runner
    s r
 [1,0,0,3,12] if slow is 0 and runner != 0 swap, inc both
    s   r
 
 [1,3,0,0,12] if slow is 0 and runner != 0 swap, inc both
      s    r
 
 [1,3,12,0,0]
         s    r -- out of bound... termnating condition for while loop
 
 init slow = 0
 init runner = 0
 
 go through array while runner is not out of bound
 if slow != 0
 slow += 1
 else if runner == 0
 runner += 1
 else
 swap elements
 move slow and runner += 1
 */

/*
func moveZeroes(_ nums: inout [Int]) {
    var j = 0;
    for i in 0..<nums.count {
        if (nums[i] != 0) {
            (nums[i], nums[j]) = (nums[j], nums[i])
            j += 1
        }
    }
}
 */

class Solution {
    
    func moveZeroes(_ nums: inout [Int]) {
        var slow = 0
        var runner = 1 // runner can start at 0
        
        guard nums.count > 1 else {return}
        
        while runner<nums.count && slow<nums.count {
            while nums[slow] != 0 {
                slow += 1
                runner = slow
                if slow >= nums.count {return}
            }
            while nums[runner] == 0 {
                runner += 1
                if runner >= nums.count {return}
            }
            
            if nums[slow] == 0 && nums[runner] != 0 {
                (nums[slow], nums[runner]) = (nums[runner], nums[slow])
                slow += 1
                runner += 1
            }
            
        }
    }
}


    
    /* other option -- misses up the original order but does less operations
     func moveZeroes(_ nums: inout [Int]) {
     var start = 0
     var end = nums.count-1
     
     while start<end {    // if two inner while loop can be faster
     if nums[start] != 0 {
     start += 1
     } else if nums[end] == 0 {
     end -= 1
     } else {
     (nums[start], nums[end]) = (nums[end], nums[start])
     start += 1
     end -= 1
     }
     
     }
     }
     */
    
    /*
 Runtime: 124 ms, faster than 6.62% of Swift online submissions for Move Zeroes.
 Memory Usage: 19.3 MB, less than 20.00% of Swift online submissions for Move Zeroes.
 
    class Solution {
        func moveZeroes(_ nums: inout [Int]) {
            var slow = 0
            var runner = 0
            
            guard nums.count > 1 else {return}
            
            while runner<nums.count && slow<nums.count {
                
                if nums[slow] == 0 && nums[runner] != 0 {
                    (nums[slow], nums[runner]) = (nums[runner], nums[slow])
                }
                
                while nums[slow] != 0 {
                    slow += 1
                    runner = slow
                    if slow >= nums.count {return}
                }
                while nums[runner] == 0 {
                    runner += 1
                    if runner >= nums.count {return}
                }
            }
        }
    }
}
 */
