
/*
 Time:
 space:
 */

class Solution {
    func minCost(_ costs: [[Int]]) -> Int {
        var minCost = 0
        for row in 0..<costs.count {
            var localMin = costs[row][0]
            for col in 1..<costs[0].count {
                localMin = min(localMin, costs[row][col])
            }
            minCost += localMin
        }
        return minCost
    }
}
