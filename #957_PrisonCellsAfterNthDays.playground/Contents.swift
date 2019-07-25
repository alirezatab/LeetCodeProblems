/*
cells = [0,1,0,1,1,0,0,1], N = 7
         i * j -> if arr[i] == arr[j] -> arr[*] = occupied = 1
        [0,1,0,0,0,0,0,0]

        [0,1,0,1,1,0,0,1], N = 7
           i * j -> if arr[i] == arr[j] -> arr[*] = occupied = 1
        [0,1,1,0,0,0,0,0]

        [0,1,0,1,1,0,0,1], N = 7
             i * j -> if arr[i] != arr[j] -> arr[*] = not occupied = 0
        [0,1,1,0,0,0,0,0]

        [0,1,0,1,1,0,0,1], N = 7
               i * j -> if arr[i] != arr[j] -> arr[*] = not occupied = 0
        [0,1,1,0,0,0,0,0]

        [0,1,0,1,1,0,0,1], N = 7
                 i * j -> if arr[i] != arr[j] -> arr[*] = not occupied = 0
        [0,1,1,0,0,0,0,0]

two for loops, each elemet of arr + number of days

        [0,1,1,0,0,0,0,0], N = 6 -> dec number of days
         i * j -> if arr[i] != arr[j] -> arr[*] = not occupied = 0
        [0,0,1,0,0,0,0,0]

        [0,1,1,0,0,0,0,0], N = 6 -> dec number of days
           i * j -> if arr[i] != arr[j] -> arr[*] = not occupied = 0
        [0,0,0,0,0,0,0,0]

        [0,1,1,0,0,0,0,0], N = 6 -> dec number of days
               i * j -> if arr[i] != arr[j] -> arr[*] = occupied = 1
        [0,0,0,0,1,0,0,0]

        [0,1,1,0,0,0,0,0], N = 6 -> dec number of days
                 i * j -> if arr[i] != arr[j] -> arr[*] = occupied = 1
        [0,0,0,0,1,1,0,0]

        [0,1,1,0,0,0,0,0], N = 6 -> dec number of days
                   i * j -> if arr[i] != arr[j] -> arr[*] = occupied = 1
        [0,0,0,0,1,1,1,0]

        [0,0,0,0,1,1,1,0]
*/

/*
 Runtime: 12 ms, faster than 95.00% of Swift online submissions for Prison Cells After N Days.
 Memory Usage: 20.9 MB, less than 20.00% of Swift online submissions for Prison Cells After N Days.
 
 Time: o(2^N) where N is the number of the cells
 Space: o(n) thats what i think vs leetcode mentioning O(2^N∗N).
 */

class Solution {
    func prisonAfterNDays(_ cells: [Int], _ N: Int) -> [Int] {
        var pre = cells
        var resultArr = [Int](repeating: 0, count: cells.count)
        let repetedDays = (N-1)%14+1 // dont know how to drive this
        for _ in 0..<repetedDays { //N should suffice unless interviewr gives this formula
            for j in 1..<cells.count-1 {
                if pre[j-1] == pre[j+1] {
                    resultArr[j] = 1
                } else {
                    resultArr[j] = 0
                }
            }
            pre = resultArr
        }
        return resultArr
    }
}
