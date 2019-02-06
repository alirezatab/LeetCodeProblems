/*
 Input:
 
 A = [[ 1, 0, 0],
     [-1, 0, 3]]
 
 B = [[ 7, 0, 0 ],
      [ 0, 0, 0 ],
      [ 0, 0, 1 ]]
 
 Output:
 
      |  1 0 0 |   | 7 0 0 |   |  7 0 0 |
 AB = | -1 0 3 | x | 0 0 0 | = | -7 0 3 |
                   | 0 0 1 |
 
 AB = | (1*7)+(0*0)+(0*0)       (1*0)+(0*0)+(0*0)     (1*0)+(0*0)+(0*1)   |
      | (-1*7)+(0*0)+(3*0)     (-1*0)+(0*0)+(3*0)    (-1*0)+(0*0)+(3*1)  |
 
      |  7 0 0 |
    = | -7 0 3 |
 
 multuple each colA with RowB,
    inc colB and multiple ColA * rowB[colB]
    where when colA in for loop inc... ColB shoud Inc too this colB = ColA
 
*/

/*
 Runtime: 84 ms, faster than 31.58% of Swift online submissions for Sparse Matrix Multiplication.
 Memory Usage: 4.3 MB, less than 50.00% of Swift online submissions for Sparse Matrix Multiplication.
 */

class Solution {
    func multiply(_ A: [[Int]], _ B: [[Int]]) -> [[Int]] {
        var res = [[Int]](repeating: [Int](repeating: 0, count:B[0].count), count: A.count)
        
        var minColA = 0
        let maxColA = A[0].count
        
        for rowA in 0..<A.count {
            for colB in 0..<B[0].count {
                var val = 0
                while minColA<maxColA {
                    val += (A[rowA][minColA]*B[minColA][colB])
                    minColA += 1
                }
                minColA = 0
                res[rowA][colB] = val
            }
        }
        
        return res
    }
}

