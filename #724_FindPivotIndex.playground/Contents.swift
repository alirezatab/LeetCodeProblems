/*
    [1, 7, 3, 6, 5, 6] // get total = 28
    [1, 7, 3, 6, 5, 6] // leftSum = 0,
     ^                 // leftSum + arr[i] = total - leftSome
                       // 0+1 == 28-0 //no --> so leftSum = 1
    [[1, 7, 3, 6, 5, 6]] // 1+7 = 28-1 // no --> leftSum = 8
         ^
    [[1, 7, 3, 6, 5, 6]] // 8+3 = 28-8 // no --> leftSum = 11
            ^
    [[1, 7, 3, 6, 5, 6]] // 11+6 = 28-11 // no --> leftSum = 11
               ^
    get toalSum by looping the array
 
    left sum = 0
    for loop through array  1 to last item
        if leftSum + arr[i] == totalSum = left Sum
            return i
        else
            update leftSum
    nothing found... so return -1
 */

/*
 Runtime: 168 ms, faster than 100.00% of Swift online submissions for Find Pivot Index.
 Memory Usage: 6.3 MB, less than 100.00% of Swift online submissions for Find Pivot Index.
 */

class Solution {
    func pivotIndex(_ nums: [Int]) -> Int {
        guard nums.count > 0 else {return -1}
        
        var totalSum = 0
        for num in nums {
            totalSum += num
        }
        
        var leftSum = 0
        for i in 0..<nums.count {
            if leftSum + nums[i] == totalSum - leftSum {
                return i
            } else {
                leftSum += nums[i]
            }
        }
        return -1
    }
}
