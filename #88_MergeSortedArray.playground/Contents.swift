/*
nums1 = [1,2,3,0,0,0], m = 3
nums2 = [2,5,6],       n = 3

replacerCounter = 3+3 -- arr so 6-1 = 5
     i
[1,2,3,0,0,0]   // check value of each and replace nums1[replacerCounter] with higher
     j          value --- Decerement index of higher number --- dec replacerCounter
[2,5,6]

     i          replacerCounter = 4
[1,2,3,0,0,6]   // check value of each and replace nums1[replacerCounter] with higher
   j          value --- Decerement index of higher number --- dec replacerCounter
[2,5,6]

     i          replacerCounter = 3
[1,2,3,0,5,6]   // check value of each and replace nums1[replacerCounter] with higher
 j          value --- Decerement index of higher number
[2,5,6]

   i            replacerCounter = 2
[1,2,3,3,5,6]   // check value of each and replace nums1[replacerCounter] with higher
 j          value --- Decerement index of higher number
[2,5,6]

   i            replacerCounter = 2
[1,2,3,3,5,6]   // check value of each and replace nums1[replacerCounter], if same, add nums2  j                      to nums1 --- Decerement index of nums2
[2,5,6]

   i            replacerCounter = 2
[1,2,2,3,5,6]   // check value of each and replace nums1[replacerCounter], if same, add nums2  j                      to nums1 --- Decerement index of nums2
 [2,5,6]

also while loop through the remaining array and insert into nums1 remaining spots

return nums1

[1,2,5,0,0,0]
[3,5,6]

[1,2,3,5,5,6]
[3,5,6]
*/

/*
 Runtime: 12 ms, faster than 87.50% of Swift online submissions for Merge Sorted Array.
 Memory Usage: 20.7 MB, less than 33.33% of Swift online submissions for Merge Sorted Array.
 
 Time: o(n+m)
 Space: o(1)
*/

class Solution {
    func merge(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
        var replacerCounter = m+n-1
        var nums1Ptr = m-1
        var nums2Ptr = n-1
        
        if m == 0 {
            nums1 = nums2
        }
        
        while nums1Ptr >= 0 && nums2Ptr >= 0 {
            
            if nums1[nums1Ptr] <= nums2[nums2Ptr] {
                nums1[replacerCounter] = nums2[nums2Ptr]
                nums2Ptr -= 1
            } else { // nums2 is equal or greater
                nums1[replacerCounter] = nums1[nums1Ptr]
                nums1Ptr -= 1
            }
            replacerCounter -= 1
        }

        while nums1Ptr > -1 {
            nums1[replacerCounter] = nums1[nums1Ptr]
            nums1Ptr -= 1
            replacerCounter -= 1
        }
        
        while nums2Ptr > -1 {
            nums1[replacerCounter] = nums2[nums2Ptr]
            nums2Ptr -= 1
            replacerCounter -= 1
        }
    }
}

// solution by someone else that looks cleaner but end logic is the same
// the if else has addtional check to see if m is out of range or not, if out of range, just replace second items into nums1
class Solution2 {
    func merge(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {

        var k = m+n-1
        var i = m-1
        var j = n-1
        while k >= 0 && j>=0 {
            if i>=0 && nums1[i] > nums2[j] {
                nums1[k] = nums1[i]
                i-=1
            } else {
                nums1[k] = nums2[j]
                j-=1
            }
            k-=1
        }
    }
}
