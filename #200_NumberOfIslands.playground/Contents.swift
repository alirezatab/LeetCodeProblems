

// DFS
/*
 Time complexity : O(M×N) where M is the number of rows and N is the number of columns.
 Space complexity : worst case O(M×N) in case that the grid map is filled with lands where DFS goes by M×N deep.
 */
class Solution {
    func numIslands(_ grid: [[Character]]) -> Int {
        guard grid.count>0 else {return 0}
        var copyGrid = grid
        var totalIslands = 0
        
        for row in 0..<grid.count {
            for col in 0..<grid[0].count {
                if copyGrid[row][col] == "1" {
                    totalIslands += 1
                    dfsTraverse(&copyGrid, row, col)
                }
            }
        }
        return totalIslands
    }
    
    func dfsTraverse(_ grid: inout [[Character]], _ row: Int, _ col: Int) {
        grid[row][col] = "0"
        
        if row-1>=0 && grid[row-1][col] == "1" {
            dfsTraverse(&grid, row-1, col)
        }
        if row+1<grid.count && grid[row+1][col] == "1" {
            dfsTraverse(&grid, row+1, col)
        }
        if col-1>=0 && grid[row][col-1] == "1" {
            dfsTraverse(&grid, row, col-1)
        }
        if col+1<grid[0].count && grid[row][col+1] == "1" {
            dfsTraverse(&grid, row, col+1)
        }
    }
}

/*
    below solution is simple but didnt work for below example
    [[1,1,1],
     [0,1,0],
     [1,1,1]]
*/

/*
class Solution {
    func numIslands(_ grid: [[Character]]) -> Int {
        guard grid.count>0 else {return 0}
        var totalIslands = 0
        
        for row in 0..<grid.count {
            for col in 0..<grid[0].count {
                if grid[row][col] == "1" &&
                    (row-1<0 || grid[row-1][col] == "0") &&
                    (col-1<0 || grid[row][col-1] == "0") {
                    totalIslands += 1
                }
            }
        }
        return totalIslands
    }
}
*/
