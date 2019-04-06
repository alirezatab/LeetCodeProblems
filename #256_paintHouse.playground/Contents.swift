
class Solution {
    func minCost(_ costs: [[Int]]) -> Int {
        guard costs.count > 0 else {return 0}
        
        var finalCost = costs[0]
        
        for row in 1..<costs.count {
            var tempCost = [Int](repeating: 0, count: finalCost.count)
            
            for col in 0..<tempCost.count {
                var adjustedCol2 = col+2
                if adjustedCol2 == tempCost.count {
                    adjustedCol2 = 0
                }
                
                var adjustedCol1 = col+1
                if adjustedCol1 == tempCost.count {
                    adjustedCol1 = 0
                    adjustedCol2 = 1
                }
                
                tempCost[col] = min(finalCost[adjustedCol1], finalCost[adjustedCol2]) + costs[row][col]
                
            }
            finalCost = tempCost
        }
        
        return finalCost.min()!
    }
}

class Solution1 {
    func minCost(_ costs: [[Int]]) -> Int {
        guard costs.count > 0 else {return 0}
        
        var finalCost = costs[0]
        
        for row in 1..<costs.count {
            var tempCost = [Int](repeating: 0, count: finalCost.count)
            
            for col in 0..<tempCost.count {
                //min(finalCost[(col+1)%3], finalCost[(col+2)%3]) for
                tempCost[col] = min(finalCost[(col+1)%3], finalCost[(col+2)%3]) + costs[row][col]
                
            }
            finalCost = tempCost
        }
        
        return finalCost.min()!
    }
}
