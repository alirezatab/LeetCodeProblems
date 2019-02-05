/*
    Runtime: 40 ms, faster than 100.00% of Swift online submissions for Two Sum II - Input array is sorted.
    Memory Usage: 5 MB, less than 0.00% of Swift online submissions for Two Sum II - Input array is sorted.
 */

class Solution {
    func twoSum(_ numbers: [Int], _ target: Int) -> [Int] {
        
        var start = 0
        var end = numbers.count-1
        
        while start<end {
            if numbers[start] + numbers[end] == target {
                return [start+1, end+1]
            } else if numbers[start] + numbers[end] > target {
                end -= 1
            } else {
                start += 1
            }
        }
        return []
    }
}
