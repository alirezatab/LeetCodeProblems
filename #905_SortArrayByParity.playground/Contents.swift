/**
 diagram pattern / psudo found
 
 [3,1,2,4]
 i j
 i   j swap
 i    j
 [3,2,1,4]
 j     i swap
 
 [11,8,1,2,3,5,9,6,7]  // i is even, j is odd
 i j swap            // when swap, inc eve and odd
 [8,11,1,2,3,5,9,6,7]  // no swap, inc by odd by one
 i j
 i   j swap
 [8,2,1,11,3,5,9,6,7]  inc i & j
 i          j
 
 clean psudo
 init evenPtr to index 0
 init oddPtr to index 1
 
 while oddPtr in less that upperBound index
 compare even*OddPtrValue
 if odd is even && even is odd
 swap odd and even value at index
 inc both even and odd ptr
 else
 inc only odd by one
 
 
 
 
 // [2,4,1,6]
 // [O,E]
 
 //[2,1,4,6]
 //  [O,E]
 //[2,4,1,6]
 [O,E]
 
 */

class Solution {
    
    func sortArrayByParity(_ A: [Int]) -> [Int] {
        var copyArr = A
        guard copyArr.count > 0 || copyArr.count == 1 else {return copyArr}
        
        var leftPtr = 0
        //var rightPtr = 1
        
        for var rightPtr in 1..<copyArr.count { //84ms
            //while rightPtr < copyArr.count { //92ms ~ 88ms
            if copyArr[leftPtr]%2 == 0 && copyArr[rightPtr]%2 == 1 {
                rightPtr += 1
                leftPtr += 1
            } else if copyArr[leftPtr]%2 == 1 && copyArr[rightPtr]%2 == 1 {
                rightPtr += 1
            } else {
                self.swap(&copyArr, indexOne: leftPtr, indexTwo: rightPtr)
                rightPtr += 1
                leftPtr += 1
            }
        }
        
        return copyArr
    }
    
    func swap(_ arr: inout [Int], indexOne: Int, indexTwo: Int) {
        let temp = arr[indexOne]
        arr[indexOne] = arr[indexTwo]
        arr[indexTwo] = temp
        
    }
}

// another version cause rightPtr inc is not always needed
/**
 diagram pattern / psudo found
 
 [3,1,2,4]
 i j
 i   j swap
 i    j
 [3,2,1,4]
 j     i swap
 
 [11,8,1,2,3,5,9,6,7]  // i is even, j is odd
 i j swap            // when swap, inc eve and odd
 [8,11,1,2,3,5,9,6,7]  // no swap, inc by odd by one
 i j
 i   j swap
 [8,2,1,11,3,5,9,6,7]  inc i & j
 i          j
 
 clean psudo
 init evenPtr to index 0
 init oddPtr to index 1
 
 while oddPtr in less that upperBound index
 compare even*OddPtrValue
 if odd is even && even is odd
 swap odd and even value at index
 inc both even and odd ptr
 else
 inc only odd by one
 
 
 
 
 // [2,4,1,6]
 // [O,E]
 
 //[2,1,4,6]
 //  [O,E]
 //[2,4,1,6]
 [O,E]
 
 */

class Solution1 {
    
    func sortArrayByParity(_ A: [Int]) -> [Int] {
        var copyArr = A
        guard copyArr.count > 0 || copyArr.count == 1 else {return copyArr}
        
        var leftPtr = 0
        //var rightPtr = 1
        
        for var rightPtr in 1..<copyArr.count { //84ms
            //while rightPtr < copyArr.count { //92ms ~ 88ms
            if copyArr[leftPtr]%2 == 0 && copyArr[rightPtr]%2 == 1 {
                leftPtr += 1
            } else if copyArr[leftPtr]%2 == 1 && copyArr[rightPtr]%2 == 1 {
                rightPtr += 1
            } else {
                self.swap(&copyArr, indexOne: leftPtr, indexTwo: rightPtr)
                leftPtr += 1
            }
        }
        
        return copyArr
    }
    
    func swap(_ arr: inout [Int], indexOne: Int, indexTwo: Int) {
        let temp = arr[indexOne]
        arr[indexOne] = arr[indexTwo]
        arr[indexTwo] = temp
        
    }
}
