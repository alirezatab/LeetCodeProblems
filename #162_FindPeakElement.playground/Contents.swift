/*
 Runtime: 24 ms, faster than 98.14% of Swift online submissions for Find Peak Element.
 Memory Usage: 21 MB, less than 100.00% of Swift online submissions for Find Peak Element.
 
 Time: logN -> binary search
 Space: o(1) -> iteratively
 */

class Solution {
    func findPeakElement(_ nums: [Int]) -> Int {
        var start = 0
        var end = nums.count-1
        while start<end {
            var mid = (start+end)/2
            if nums[mid] > nums[mid+1] {
                end = mid
            } else {
                start = mid+1
            }
        }
        return start
    }
}
