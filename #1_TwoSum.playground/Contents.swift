import UIKit

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

let solution = Solution()
print(solution.twoSum([2,7,11,15], 9))
