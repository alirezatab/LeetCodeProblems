/*
 Runtime: 352 ms, faster than 98.28% of Swift online submissions for Binary Search.
 Memory Usage: 7.8 MB, less than 94.12% of Swift online submissions for Binary Search.
 */

// iterative - space is 0(1) - time is o(logN)
class Solution {
    func search(_ nums: [Int], _ target: Int) -> Int {
        var start = 0
        var end = nums.count-1
        
        while start<=end {
            let middle = start+(end-start)/2
            
            if nums[middle] == target {
                return middle
            } else if nums[middle] > target { // search the first half
                end = middle-1
            } else { //search the righ half
                start = middle+1
            }
        }
        return -1
    }
}

// recrusive - space is 0(logN) - time is o(logN)
class Solution1 {
    func search(_ nums: [Int], _ target: Int) -> Int {
        var start = 0
        var end = nums.count-1
        
        func binarySearch(_ start:Int, _ end: Int) -> Int {
            guard start <= end else {return -1}
            
            let middle = start+(end-start)/2
            if nums[middle] == target {
                return middle
            } else if nums[middle] > target {  // search the first half
                return binarySearch(start, middle-1)
            } else { //search the righ half
                return binarySearch(middle+1, end)
            }
        }
        
        return binarySearch(start, end)
    }
}
