/*
 Runtime: 224 ms, faster than 38.18% of Swift online submissions for Interval List Intersections.
 Memory Usage: 21.2 MB, less than 7.32% of Swift online submissions for Interval List Intersections.
 
 
 Time = o(A+B)
 Space = o(A+B)
 */
class Solution {
    func intervalIntersection(_ A: [[Int]], _ B: [[Int]]) -> [[Int]] {
        var i = 0
        var j = 0
        var res = [[Int]]()
        
        while i<A.count && j<B.count {
            let start = max(A[i][0], B[j][0])
            let end = min(A[i][1], B[j][1])
            
            if start<=end {
                res.append([start,end])
            }
            
            if A[i][1]<=B[j][1]{
                i+=1
            } else {
                j+=1
            }
        }
        
        return res
    }
}
