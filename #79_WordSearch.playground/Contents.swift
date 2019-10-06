/*
 Runtime: 524 ms, faster than 33.59% of Swift online submissions for Word Search.
 Memory Usage: 21.9 MB, less than 66.67% of Swift online submissions for Word Search.
 
 Time: o(M*N*4^s) m = number of row, n = number of col, s is for length of string - for each option, we have 4 recrusive option
 
 */

class Solution {
    func exist(_ board: [[Character]], _ word: String) -> Bool {
        
        for row in 0..<board.count {
            for col in 0..<board[0].count {
                if searchMatrix(board, row, col, word, 0) {
                    return true
                }
            }
        }
        return false
    }
    
    func searchMatrix(_ board: [[Character]], _ row: Int, _ col: Int, _ word: String, _ index: Int) -> Bool {
            
        if index >= word.count {return true}
        
        if row<0 || row>=board.count || col<0 || col>=board[0].count {return false}
        
        let char = word[word.index(word.startIndex, offsetBy: index)]
        if board[row][col] == "-" || board[row][col] != char {
            return false
        }
        
        var boardCopy = board
        boardCopy[row][col] = "-"
        
        let ans = searchMatrix(boardCopy, row+1, col, word, index+1) ||
                    searchMatrix(boardCopy, row-1, col, word, index+1) ||
                    searchMatrix(boardCopy, row, col+1, word, index+1) ||
                    searchMatrix(boardCopy, row, col-1, word, index+1)
        
        return ans
    }
}
