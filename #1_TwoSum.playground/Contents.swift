import UIKit
/*
 check if two is in disctioanry,
 9-2 = 7
 add 8 to dectionary or set
 
 
 
 key  value
 7     0
 
 return 0, currentIndex
 
 */

class Solution {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        var dic = [Int:Int]()
        for i in 0..<nums.count {
            let num = nums[i]
            if dic[num] != nil {
                return [dic[num]!,i]
            }
            
            dic[target-num] = i
        }
        return []
    }
}
/*
Runtime: 32 ms, faster than 96.79% of Swift online submissions for Two Sum.
Memory Usage: 21.2 MB, less than 5.07% of Swift online submissions for Two Sum.
 
 a but faster than abve solution cause enumerated is faster than normal for-loop in swift
 
 Time: o(n)
 Space: o(n)
*/
 
class Solution1 {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        var dic = [Int:Int]()
        for (index, value) in nums.enumerated() {
            if let i = dic[value] {
                return [i, index]
            }
            dic[target-value] = index
        }
        return []
    }
}

/* Brute Force
class Solution {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        var finalArr: [Int] = []
        for i in 0..<nums.count-1 {
            for j in i+1..<nums.count {
                if nums[i]+nums[j] == target {
                    finalArr.append(i)
                    finalArr.append(j)
                    return finalArr
                }
            }
        }
        return []
    }
}
 */

let solution = Solution()
print(solution.twoSum([2,7,11,15], 9))
