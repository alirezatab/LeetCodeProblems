/*
[1,1,1,2,2,3] 1. if value@ s&f are the same and value @s and slow-1 is the same
   s f            inc fast only

[1,1,1,2,2,3] 2. if value@ s&f are not the same
   s   f         inc s, and copy value of fast into slow
                    inc fast

[1,1,1,2,2,3]  [1,1,2,2,2,3]
     s f            s f

[1,1,2,2,2,3]  3. if value @s and s-1 is not the same
     s   f       inc slow

[1,1,2,2,2,3] rule 1. inc fast
       s f

[1,1,2,2,2,3] rule 2
         s f
[1,1,2,2,3,3]


[0,0,1,1,1,1,2,3,3]
   s f
     s
[0,0,1,1,1,1,2,3,3] rule 2
     f
       s
[0,0,1,1,1,1,2,3,3] rule 3
       f
       s
[0,0,1,1,1,1,2,3,3] rule 2
             f
         s
[0,0,1,1,2,1,2,3,3] rule 2 and 3
             f
           s
[0,0,1,1,2,3,2,3,3] rule 3
                 f
             s
[0,0,1,1,2,3,3,3,3] rule 2
                   f
*/
/*
 Runtime: 32 ms, faster than 100.00% of Swift online submissions for Remove Duplicates from Sorted Array II.
 Memory Usage: 19 MB, less than 33.33% of Swift online submissions for Remove Duplicates from Sorted Array II.
 */

class Solution {
    func removeDuplicates(_ nums: inout [Int]) -> Int {
        guard nums.count>2 else {return nums.count}
        
        var slow = 1
        
        for fast in 2..<nums.count {
            if nums[slow] != nums[fast] || nums[slow] != nums[slow-1] {
                slow += 1
                nums[slow] = nums[fast]
            }
        }
        return slow+1
    }
}
