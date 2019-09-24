/*
 Runtime: 348 ms, faster than 20.00% of Swift online submissions for Next Greater Element II.
 Memory Usage: 23.1 MB, less than 100.00% of Swift online submissions for Next Greater Element II.
 
 time: o(2n)
 space: o(n)
 */

class Solution {
    func nextGreaterElements(_ nums: [Int]) -> [Int] {
        var stack = [(index: Int, value: Int)]()
        var res = Array(repeating: -1, count: nums.count)
        
        for rounds in 0..<2 {
            var i = nums.count-1
            while i>=0 {
                if !stack.isEmpty && nums[i] < stack.last!.value {
                    res[i] = stack.last!.value
                    stack.append((index:i, value: nums[i]))
                    i -= 1
                } else if !stack.isEmpty {
                    stack.removeLast()
                } else {
                    stack.append((index:i, value: nums[i]))
                    i -= 1
                }
            }
        }
        print(res)
        return res
    }
}
