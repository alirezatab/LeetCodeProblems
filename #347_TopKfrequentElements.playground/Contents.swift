/*
 Runtime: 120 ms, faster than 27.32% of Swift online submissions for Top K Frequent Elements.
 Memory Usage: 21.7 MB, less than 100.00% of Swift online submissions for Top K Frequent Elements.
 

 Time: o(k + nlogn)
 space: o(n) -> dic, tempArr, ResArr
 */

/*
class Solution {
    func topKFrequent(_ nums: [Int], _ k: Int) -> [Int] {
        var dic = [Int:(num:Int,freq:Int)]()
        for num in nums {
            if let tuple = dic[num] {
                dic[num]!.freq = tuple.freq + 1
            } else {
                dic[num] = (num: num, freq: 1)
            }
        }
        
        var tempArray = [(num:Int,freq:Int)]()
        for val in dic.values {
            tempArray.append(val)
        }
        tempArray.sort(by: {$0.freq<$1.freq})

        var resArr = [Int]()
        for i in 0..<k {
            resArr.append(tempArray.last!.num)
            tempArray.removeLast()
        }
        return resArr
    }
}
*/

/*
 Runtime: 108 ms, faster than 72.68% of Swift online submissions for Top K Frequent Elements.
 Memory Usage: 23.1 MB, less than 100.00% of Swift online submissions for Top K Frequent Elements.
 
 Time: o(k + nlogn) -- however, leetcode says N + Nlogk ??
 space: o(n) -> dic, sortArr, ResArr
 */

class Solution {
    func topKFrequent(_ nums: [Int], _ k: Int) -> [Int] {
        var dic = [Int:Int]()
        for num in nums {
            if let value = dic[num] {
                dic[num] = value + 1
            } else {
                dic[num] = 1
            }
        }
        
        var sortedArr = dic.sorted{$0.value<$1.value}
        
        var resArr = [Int]()
        for _ in 0..<k {
            resArr.append(sortedArr.last!.key)
            sortedArr.removeLast()
        }
        return resArr
    }
}
