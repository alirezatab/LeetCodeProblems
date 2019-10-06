/**
 Time: o(N^2)
 Space: o(1)
 */

class Solution {
    func threeSum(_ nums: [Int]) -> [[Int]] {
        
        let sortedNums = nums.sorted()
        
        var res = [[Int]]()
        var index = 0
        
        while index < sortedNums.count-2 {
            var start = index+1
            var end = sortedNums.count-1
            
            while start<end {
                let sum = sortedNums[index] + sortedNums[start] + sortedNums[end]
                
                if sum == 0 {
                    res.append([sortedNums[index], sortedNums[start], sortedNums[end]])
                }
                
                if sum < 0 {
                    let copyStart = start
                    while start<end && sortedNums[start] == sortedNums[copyStart] {
                        start+=1
                    }
                } else {
                    let copyEnd = end
                    while start<end && sortedNums[end] == sortedNums[copyEnd] {
                        end-=1
                    }
                }
            }
            
            let copyIndex = index
            while index < sortedNums.count-2 && sortedNums[index] == sortedNums[copyIndex] {
                index += 1
            }
        }
        return res
    }
}
