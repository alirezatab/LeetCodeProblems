/*
 Runtime: 20 ms, faster than 100.00% of Swift online submissions for Search in Rotated Sorted Array.
 Memory Usage: 19.2 MB, less than 8.33% of Swift online submissions for Search in Rotated Sorted Array.
 
 Time: o(log N)
 space: o(1)
 */

class Solution {
    func search(_ nums: [Int], _ target: Int) -> Int {
        guard nums.count>0 else {return -1}
        guard nums.count != 1 else {return nums[0] == target ? 0 : -1}
        
        let rotatedIndex = findRotatedIndex(nums)
        
        if nums[rotatedIndex] == target {return rotatedIndex}
        if rotatedIndex == 0 {
            return search(nums, 0, nums.count-1, target)
        }
        if target>=nums[0] {
            return search(nums, 0, rotatedIndex, target)
        }
        return search(nums, rotatedIndex, nums.count-1, target)
    }
    
    private func findRotatedIndex(_ nums: [Int]) -> Int {
        var left = 0
        var right = nums.count-1
        guard nums[left] >= nums[right] else {return 0} // makes sure it is rotated Array
        
        while left <= right {
            let mid = (right+left)/2
            if nums[mid] > nums[mid+1] {
                return mid+1 //rotation found
            } else {
                if nums[mid]<nums[left] {
                    right = mid-1
                }else {
                    left = mid+1
                }
            }
        }
        return 0
    }
    
    private func search(_ nums: [Int], _ left: Int, _ right: Int, _ target: Int) -> Int {
        var l = left
        var r = right
        while l<=r {
            let mid = (r+l)/2
            
            if nums[mid] == target {
                return mid
            } else {
                if nums[mid] > target {
                    r = mid-1
                } else {
                    l = mid+1
                }
            }
        }
        return -1
    }
    
}
