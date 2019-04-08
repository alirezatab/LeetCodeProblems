/*
 Runtime: 8 ms, faster than 100.00% of Swift online submissions for Factor Combinations.
 Memory Usage: 18.9 MB MB, less than 100.00% of Swift online submissions for Factor Combinations.
 */
import Darwin

class Solution {
    func getFactors(_ n: Int) -> [[Int]] {
        var res = [[Int]]()
        guard n>3 else {return res}
        
        func createFactors(_ c: [Int], _ start: Int,_ end: Int) {
            
            let sqrtN = Int(sqrt(Double(end)))
            
            if start <= sqrtN {
                for i in start...sqrtN {
                    if end%i == 0 {
                        res.append(c+[i]+[end/i])
                        createFactors(c+[i], i, end/i)
                    }
                }
            }
        }
        
        createFactors([], 2, n)
        return res
    }
}
