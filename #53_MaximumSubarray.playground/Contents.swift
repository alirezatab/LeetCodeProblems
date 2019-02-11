/*
 Fast Catch-up problem
 can be done with tabulation from begining or end
 
 [-2,1,-3,4,-1,2,1,-5,4] max = 4
 ^ max(4-5,-5)
 [-1,4]
 ^ max(-1+1, 1)
 [1,-1,4]
 ^ max(1+2, 2)
 [3,1,-1,4]
 ^ max(3-1, -1)
 [2,3,1,-1,4]
 ^ max(2+4, -1)
 [6,2,3,1,-1,4] Max is 6
 
 and so on....
 
 var maxSum is the last item of array
 start at end of array
 find the max of (arr[i]+ and one before [i-1] it) vs num at i-1
 if value found is more than maxSum, store it in maxSum
 also store value at arr[i-1]
 
 o(n)
 */

/*
 Runtime: 44 ms, faster than 100.00% of Swift online submissions for Maximum Subarray.
 Memory Usage: 4.7 MB, less than 86.76% of Swift online submissions for Maximum Subarray.
 */

class Solution {
    func maxSubArray(_ nums: [Int]) -> Int {
        var largestSum = nums[0]
        var sum = nums[0]
        
        for i in 1..<nums.count {
            sum = max(sum+nums[i],nums[i])
            if sum > largestSum {
                largestSum = sum
            }
        }
        return largestSum
    }
}

/*
 Runtime: 44 ms, faster than 100.00% of Swift online submissions for Maximum Subarray.
 Memory Usage: 4.7 MB, less than 98.53% of Swift online submissions for Maximum Subarray.
 */

class Solution1 {
    func maxSubArray(_ nums: [Int]) -> Int {
        var localMax = nums[0]
        var ultimateMax = nums[0]
        
        for i in 1..<nums.count {
            localMax = max(localMax+nums[i],nums[i])
            ultimateMax = max(ultimateMax, localMax)
        }
        return ultimateMax
    }
}
