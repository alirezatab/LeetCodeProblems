/*
 var minRow = 0
 var maxRow = matrix.count-1
 var mincolum = 0
 var maxColumn = martix[0].count-1
 
 
 [[ 1, 2, 3 ], <---- min row ... save eacah element in the new arr, inc minrow
 [ 4, 5, 6 ],
 [ 7, 8, 9 ]]
 
 [1,2,3]
 *
 [[ 1, 2, 3 ],
 [ 4, 5, 6 ], <---- min row ... save eacah element in the new arr, inc minrow
 [ 7, 8, 9 ]]
 /\     go trhough last column starting ar min row that got inc... all the way to the end, dec max colum
 
 [1,2,3,6,9]
 
 [[ 1, 2, 3 ],
 [ 4, 5, 6 ], <---- min row
 [ 7, 8, 9 ]] <----- go through maxRow except last col, add all to the items into the array except max columns, dec maxRow
 /\
 
 [1,2,3,6,9, 8,7]
 
 [[ 1, 2, 3 ],
 [ 4, 5, 6 ], <---- min row , max row
 [ 7, 8, 9 ]]
 /\  /\
 go through first column, and only valid row, inc min col
 [1,2,3,6,9, 8,7,4]
 
 [[ 1, 2, 3 ],
 [ 4, 5, 6 ], <---- min row , max row
 [ 7, 8, 9 ]]
 /\
 add last item and done
 [1,2,3,6,9, 8,7,4,5]
 
 
 init minRow and Min col to 0
 init maxRow to matrix.count-1
 init maxCol to matrix[0].count -1
 init final array
 
 go through the matrix while minRow<=MaxRow && minCol<=maxCol
 
 iterator i that can be reseted
 go through min Row to end of array -- i = minCol <= maxCol
 append to new array(m[minRow][i])
 i+=1
 
 inc minRow
 itr i = minRow
 
 go through i <= maxRow
 m[i][maxCol] append
 i+=1
 
 dec MaxCol,
 i = maxCol
 
 go through maxRow while i>minCol
 m[maxRow][i] append
 i-=1
 
 dec maxRow, i = maxRow
 
 go through 1st col, while i>=minRow
 m[maxRow][minCol] append
 i+=1
 
 in minCol
 i = minCOl
 return fianl array
 */

/*
 Runtime: 8 ms, faster than 100.00% of Swift online submissions for Spiral Matrix.
 Memory Usage: 3.9 MB, less than 100.00% of Swift online submissions for Spiral Matrix.
 */

class Solution {
    func spiralOrder(_ matrix: [[Int]]) -> [Int] {
        
        guard matrix.count > 0 else {return [Int]()}
        
        var minCol = 0
        var maxCol = matrix[0].count-1
        var minRow = 0
        var maxRow = matrix.count-1
        var finalArr = [Int](repeating: 0, count: (matrix.count*matrix[0].count))
        var j = 0
        while minRow <= maxRow && minCol <= maxCol {
            
            for i in (minCol..<maxCol+1) {
                finalArr[j] = matrix[minRow][i]
                j+=1
            }
            minRow+=1
            
            for i in (minRow..<maxRow+1) {
                finalArr[j] = matrix[i][maxCol]
                j+=1
            }
            maxCol-=1
            
            for i in stride(from: maxCol, through:minCol, by:-1) where minRow <= maxRow {
                finalArr[j] = matrix[maxRow][i]
                j+=1
            }
            maxRow-=1
            
            for i in stride(from: maxRow, through:minRow, by: -1) where minCol <= maxCol {
                finalArr[j] = matrix[i][minCol]
                j+=1
            }
            minCol+=1
        }
        return finalArr
    }
}
