/*                                   val = arr[0] //assuming arr can not be empty
 nI                           nextIndex = 1
 [0, 0 ,1,1,1,2,2,3,3,4]          iterate through the array from 1 to las
 i                                if arr[i] > val
 swap -- nextIndex += 1 -- val = arr[nextIndex] // depends on swap hapens first or not. if first, nextIndex, if last, arr[i]
 
 nI                  // nothing happens, i gets inceremented
 [0, 0 ,1,1,1,2,2,3,3,4]
 i                // if statement happens
 
 nI               // if check satisfied
 [0, 1 ,0,1,1,2,2,3,3,4] // val = 1
 i
 
 nI               // nothing happens, i gets inceremented
 [0, 1 ,0,1,1,2,2,3,3,4] // val = 1
 i           // till if statement happens
 
 nI
 [0, 1 ,2 ,1,1,0,2,3,3,4]  //val = 2
 i
 nI
 [0, 1 ,2 ,1,1,0,2,3,3,4]  //val = 2
 i
 nI
 [0, 1 ,2 ,1,1,0,2,3,3,4]  //val = 2
 i
 [0, 1 ,2 ,3,1,0,2,1,3,4]  //val = 3
 
 nI
 [0, 1 ,2 ,3,1,0,2,1,3,4]  //val = 3
 i
 nI
 [0, 1 ,2 ,3,1,0,2,1,3,4]  //val = 3
 i
 
 nI  --> Ni = 5 and we can return that as the size of the array
 [0, 1 ,2 ,3,4,0,2,1,3,1]  //val = 4
 i
 */

/*
 Time: o(n) cause we have to go through every element of the array
 space: 0(1) swaps happen in place and no otehr space was created
 
 Runtime: 88 ms, faster than 42.06% of Swift online submissions for Remove Duplicates from Sorted Array.
 Memory Usage: 19.5 MB, less than 22.95% of Swift online submissions for Remove Duplicates from Sorted Array.
 */

class Solution {
    func removeDuplicates(_ nums: inout [Int]) -> Int {
        guard nums.count>0 else {return 0}
        guard nums.count>1 else {return 1}
        
        var val = nums[0]
        var slowRunner = 1
        for fastRunner in 1..<nums.count {
            if nums[fastRunner] > val {
                (nums[slowRunner],nums[fastRunner]) = (nums[fastRunner],nums[slowRunner])
                val = nums[slowRunner]
                slowRunner += 1
            }
        }
        return slowRunner
    }
}
