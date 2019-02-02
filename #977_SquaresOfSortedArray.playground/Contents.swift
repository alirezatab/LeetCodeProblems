    //Time NlogN
    //space N or o(1)
    /** space can be o(1)if i square and replace it in place
     [-4,-1,0,3,10]
     [16,1,0,9,100]
     then sort --> logN
     [0,1,9,16,100]
     
     ////////////////////////////////////////////
     //Time N
     //Space N
     if negative inc till last negative or 0
     [-4,-1]
     [0,3,9]
     [-4,-1,0,3,10]
     0 <-- ^ ^ --> 9
     1 <-- ^   ^ --> 9
     16<--^       ^ --> 9
     16<--^          ^ --> 100
     // so compare and place smaller in new array
     decrement the one pointer that moved... but then if goes out of bound, only increment the other pointer
     [0, 1, 9, 16, 100]
     
     create two pointers
     crate new array
     loop through array till you find first last negative and 0 and assign first pointer
     assign second pointer to the one after the next pointer
     
     square both values at index and compare
     lowest value goes into resultArray
     then dec lowest pointer
     
     till one goes out of bound, then inc or dec the rest and append to result
     */
    
class Solution {
    
    func sortedSquares(_ A: [Int]) -> [Int] {
        var result = [Int]()
        var left = 0
        var right = 0
        var LeftValSquared = Int()
        var rightValSquare = Int()
        
        if A.count == 1 {
            result.append(A[0]*A[0])
            return result
        }
        
        while A[left] < 0 && left < A.count {
            left += 1
        }
        if A[left] > 0 {
            left -= 1
        }
        
        right = left+1
        
        while left > -1 && right < A.count {
            LeftValSquared = A[left]*A[left]
            rightValSquare = A[right]*A[right]
            
            if LeftValSquared < rightValSquare {
                result.append(LeftValSquared)
                left -= 1
            } else {
                result.append(rightValSquare)
                right += 1
            }
        }
        
        while left > -1 {
            LeftValSquared = A[left]*A[left]
            result.append(LeftValSquared)
            left -= 1
        }
        
        while right < A.count {
            rightValSquare = A[right]*A[right]
            result.append(rightValSquare)
            right += 1
        }
        
        return result
    }
}
    
var testArray = [-4,-1,0,3,10]
let sol = Solution()
print(sol.sortedSquares(testArray))
    
testArray = [-7,-3,2,3,11]
print(sol.sortedSquares(testArray))
