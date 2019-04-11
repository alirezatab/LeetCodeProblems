/*
 Runtime: 904 ms, faster than 66.67% of Swift online submissions for K Closest Points to Origin.
 Memory Usage: 21 MB, less than 21.43% of Swift online submissions for K Closest Points to Origin.
 
 Time: o(nlogn) - go through each inner array onces and sort
 space: o(n+m) n being result array, m being the disctances tuple array
 */


import Darwin
class Solution {
    func kClosest(_ points: [[Int]], _ K: Int) -> [[Int]] {
        var res = [[Int]]()
        var distances = [(distance:Double, point:[Int])]()
        
        for point in points {
            let distance = calculateDistance(point)
            distances.append((distance: distance, point: point))
        }
        
        distances.sort {
            return $0.distance<$1.distance
        }
        
        for i in 0..<K {
            let closestPoint = distances[i].point
            res.append(closestPoint)
        }
        return res
    }
    
    func calculateDistance(_ point: [Int]) -> Double {
        return sqrt(pow(Double(point[0]), 2) + pow(Double(point[1]), 2))
    }
}
