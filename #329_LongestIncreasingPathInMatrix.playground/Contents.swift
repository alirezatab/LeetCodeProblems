/*
 DFS (recrusice) + Memoization
 
 Runtime: 524 ms, faster than 82.14% of Swift online submissions for Longest Increasing Path in a Matrix.
 Memory Usage: 18.9 MB, less than 0.00% of Swift online submissions for Longest Increasing Path in a Matrix.
 */


class Solution {
    private let moves: [[Int]] = [[0,1],[1,0],[0,-1],[-1,0]]
    
    func longestIncreasingPath(_ matrix: [[Int]]) -> Int {
        guard matrix.count > 0 else {return 0}
        var longestPath = 0
        var cache = Array(repeating: Array(repeating: 0, count:matrix[0].count), count: matrix.count)
        
        for row in 0..<matrix.count {
            for col in 0..<matrix[0].count {
                longestPath = max(longestPath, traverseDFS(matrix, row, col, &cache))
                
            }
        }
        return longestPath
    }
    
    func traverseDFS(_ m: [[Int]], _ row: Int, _ col: Int, _ cache: inout [[Int]]) -> Int {
        
        if cache[row][col] != 0 {
            return cache[row][col] + 1
        }
        
        for direction in moves {
            let nextRow = row+direction[0]
            let nextCol = col+direction[1]
            
            if (nextRow>=0 && nextRow<m.count) &&
                (nextCol>=0 && nextCol<m[0].count) &&
                m[row][col]<m[nextRow][nextCol] {
                cache[row][col] = max(cache[row][col], traverseDFS(m, nextRow, nextCol, &cache))
            }
        }
        
        var val = cache[row][col]
        val += 1
        
        return val
    }
}
