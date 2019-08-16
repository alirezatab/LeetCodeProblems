/*
 My First Solution
 
nums1 = [1,2,2,1], nums2 = [2,2]

sort both arrays
nums1 = [1,1,2,2], nums2 = [2,2]
     i
    [1,1,2,2]       while ptr i & j is not at the end
     j
    [2,2]       if not same, inc longer one? or maybe inc lower #

         i
    [1,1,2,2]       while ptr i & j is not at the end
     j
    [2,2]       if not same, inc longer one? or maybe inc lower #

    if same... insert in the result arr... add into visited, if visted dont append again


nums1 = [4,5,9], nums2 = [4,4,8,9,9]

 i              visited is empty
[4,5,9]
 j
[4,4,8,9,9]
val@i && j ==, so append to result and add to visited
    inc i, j

   i              visited {4},
[4,5,9]
     j
[4,4,8,9,9]

if not same, inc lower digit(j) - check with value of inc exist in the visited


     i              visited {4, 5},  res = 4
[4,5,9]
     j
[4,4,8,9,9]

if not same, inc lower digit(i) - check with value of inc exist in the visited


        i              visited {4, 5, 9},  res = 4,9
[4,5,9]
         j
[4,4,8,9,9]

if not same, inc lower digit(i) - check with value of inc exist in the visited


initilize ptr1, pt2 to start at index 0
init a Set with empty values
sort both arrays

while i<num1.count && j<nums2.count {
    if value @i & @j are the same && check if value is not added to visited {
        add value to set
        add value to result
        inc i and j
    } else if value @i < value @j {
        inc i
        add value to visited
    } else if value @j < vallue @ i {
        inc j
        add value to visited
    }
    
    return res
}
*/

/*
Runtime: 40 ms, faster than 26.86% of Swift online submissions for Intersection of Two Arrays.
Memory Usage: 21.4 MB, less than 100.00% of Swift online submissions for Intersection of Two Arrays.

Time: o(logN + M + N) // sort is log n + log M... while look is M+N
Space: o(B+M+A+V) = o(N) really
*/

class Solution1 {
    func intersection(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
        var visited = Set<Int>()
        var ptr1 = 0
        var ptr2 = 0
        var sortedNums1 = nums1.sorted()
        var sortedNums2 = nums2.sorted()
        var result = [Int]()
        
        while ptr1 < sortedNums1.count && ptr2 < sortedNums2.count {
            if sortedNums1[ptr1] == sortedNums2[ptr2] &&
                !visited.contains(sortedNums1[ptr1]) {
                    visited.insert(sortedNums1[ptr1])
                    result.append(sortedNums1[ptr1])
                    ptr1 += 1
                    ptr2 += 1
            } else if sortedNums1[ptr1] < sortedNums2[ptr2] {
                visited.insert(sortedNums1[ptr1])
                ptr1 += 1
            } else if sortedNums1[ptr1] > sortedNums2[ptr2] {
                  visited.insert(sortedNums2[ptr2])
                ptr2 += 1
            } else {
               ptr1 += 1
                ptr2 += 1
            }
        }
        return result
    }
}
