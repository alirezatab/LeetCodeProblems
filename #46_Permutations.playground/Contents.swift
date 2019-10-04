/*
 Runtime: 20 ms, faster than 91.39% of Swift online submissions for Permutations.
 Memory Usage: 20.9 MB, less than 16.67% of Swift online submissions for Permutations.
 
 Time: o(N!)
 Space: o(N!) ??
 */
class Solution {
    func permute(_ nums: [Int]) -> [[Int]] {
        var numsCopy = nums
        var res = [[Int]]()
        
        func backTrack(_ cur: Int,_ numsArr: inout [Int]) {
            if cur == nums.count {
                res.append(numsArr)
            }
            for i in cur..<nums.count {
                
                (numsArr[cur], numsArr[i]) = (numsArr[i], numsArr[cur])

                backTrack(cur+1, &numsArr)
                
                // to backtrack and reverse the arr to its orignal from
                (numsArr[cur], numsArr[i]) = (numsArr[i], numsArr[cur])
            }
        }
        
        backTrack(0, &numsCopy)
        return res
    }
}
