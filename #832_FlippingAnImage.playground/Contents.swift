/**
 col
 row[[1,1,0],
 [1,0,1],
 [0,0,0]]
 
 col
 row[[0,1,1],
 [1,0,1], flip horizonatl is same
 [0,0,0]] flip horizonatl is same
 
 then invert
 [replace 0 with 1 and 1 with 0]
 col
 row[[1,0,0],
 [0,1,0], flip horizonatl is same
 [1,1,1]]
 
 ---------------------------------------------
 
 [[1,1,0,0], // swap each row can be two pointer index. from beg to end, swap till beg < end --> after swap, inver the values
 [1,0,0,1],
 [0,1,1,1],
 [1,0,1,0]]
 
 
 [[0,0,1,1],
 [1,0,0,1],
 [1,1,1,0],
 [0,1,0,1]]
 
 inver --> go through all and switch zero to ones
 [[1,1,0,0],
 [0,1,1,0],
 [0,0,0,1],
 [1,0,1,0]]
 */

// simpler way --> go through matrix and swap inner array
// then go through matrix again and invert o(2n^2)

// more complex as below, do all in place --> o(n^2)
class Solution {
    func flipAndInvertImage(_ A: [[Int]]) -> [[Int]] {
        var copyArr = A // cause argument is let/Constant
        guard copyArr.count > 0 else {return copyArr}
        
        var endIndex = copyArr[0].count-1
        
        for row in 0..<copyArr.count {
            for col in 0...(copyArr[0].count-1)/2 {
                self.swap(&copyArr[row], indexOne: col, indexTwo: endIndex)
                
                if copyArr[row][col] == 1 {
                    copyArr[row][col] = 0
                } else {
                    copyArr[row][col] = 1
                }
                
                if col != endIndex {
                    if copyArr[row][endIndex] == 1 {
                        copyArr[row][endIndex] = 0
                    } else {
                        copyArr[row][endIndex] = 1
                    }
                }
                
                
                endIndex -= 1
            }
            
            endIndex = copyArr[0].count-1
        }
        return copyArr
    }
    
    func swap(_ arr: inout [Int], indexOne: Int, indexTwo: Int) {
        let temp = arr[indexOne]
        arr[indexOne] = arr[indexTwo]
        arr[indexTwo] = temp
        
    }
}
