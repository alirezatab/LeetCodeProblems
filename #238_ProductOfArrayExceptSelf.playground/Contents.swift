/*
arr1[1,2,3,4]
    --------> val = multiple all elements
arr2[24,24,24,24] -> initilize a new array to the val... with same size of original array

    for loop the array again,
arr1[1,2,3,4]
// match the index --> and divide arr2[i]/arr1[i]
arr2[24,24,24,24]

     V
arr1[1,2,3,4]
arr2[24,24,24,24]

       V
arr1[1,2,3,4]
arr2[24,12,24,24]

         V
arr1[1,2,3,4]
arr2[24,12,8,24]

           V
arr1[1,2,3,4]
arr2[24,12,8,6]
    

*/

class Solution {
    func productExceptSelf(_ nums: [Int]) -> [Int] {
        var totalMul = 1
        var zeroCounter = 0
        for num in nums {
            if num != 0 {
               totalMul *= num
            } else {
                zeroCounter+=1
            }
        }
        
        var resultArr = [Int](repeating: totalMul, count: nums.count)
        for i in 0..<nums.count {
            if zeroCounter > 1 {
                resultArr[i] = 0
            } else if zeroCounter == 1 && nums[i] == 0 {
                resultArr[i] = totalMul
            } else if zeroCounter == 1 && nums[i] != 0 {
                resultArr[i] = 0
            } else {
                resultArr[i] = totalMul/nums[i]
            }
        }
        
        return resultArr
    }
}
