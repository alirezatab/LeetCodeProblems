/*
 
 binary Search
 [1,3,5,6] // mid is 3 --> less than targer.. check left and right and if target between them or mach, return lower index o mathced indec
 
 if mid-1 && mid+1 is out of index, return count 0 or arr.count
 
 */

/*
 iteratively - binary search
 Runtime: 40 ms, faster than 95.65% of Swift online submissions for Search Insert Position.
 Memory Usage: 4.4 MB, less than 40.00% of Swift online submissions for Search Insert Position.
 */

class Solution {
    func searchInsert(_ nums: [Int], _ target: Int) -> Int {
        var start = 0
        var end = nums.count-1
        var mid = (end+start)/2
        
        guard nums.count > 0 else {return 0}
        
        while mid<nums.count && mid >= 0 {
            
            if nums[mid] == target {
                return mid
            } else if nums[mid] > target && mid-1 >= 0 {
                if nums[mid-1] == target{
                    return mid-1
                } else if nums[mid-1] < target  {
                    return mid
                }
                end = mid-1
            } else if nums[mid] < target && mid+1 < nums.count {
                if nums[mid+1] == target || nums[mid+1] > target {
                    return mid+1
                }
                start = mid+1
            } else if mid+1 >= nums.count && nums[mid] < target  {
                return mid+1
            } else {
                return 0
            }
            
            mid = (end+start)/2
        }
        return 0
    }
}

/*
 recrusively
 Runtime: 40 ms, faster than 95.65% of Swift online submissions for Search Insert Position.
 Memory Usage: 4.4 MB, less than 88.00% of Swift online submissions for Search Insert Position.
 */

class Solution1 {
    func searchInsert(_ nums: [Int], _ target: Int) -> Int {
        
        guard nums.count > 0 else {return 0}
        
        var start = 0
        var end = nums.count-1
        
        func binarySearch(_ start: Int, _ end: Int) -> Int {
            let mid = start + (end-start)/2
            
            if mid >= nums.count || mid<start {
                return 0
            }
            
            if nums[mid] == target {
                return mid
            } else if nums[mid] < target {
                if mid == end {
                    return mid+1
                }
                if nums[mid+1] > target {
                    return mid+1
                }
                
                return binarySearch(mid+1, end)
            } else {
                if mid == start && nums[mid] > target {
                    return 0
                }
                return binarySearch(start, mid-1)
            }
        }
        
        let val = binarySearch(start, end)
        if val < 0 {
            return 0
        } else if val >= nums.count {
            return nums.count
        }
        return val
    }
}
