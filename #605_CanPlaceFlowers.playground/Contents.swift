//////////////////////////////////////////////////
///////////////////// TRY 1 //////////////////////
//////////////////////////////////////////////////
/*
 Runtime: 132 ms, faster than 100.00% of Swift online submissions for Can Place Flowers.
 Memory Usage: 18.9 MB, less than 100.00% of Swift online submissions for Can Place Flowers.
 Time: o(n)
 space: o(n)
 */

class Solution1 {
    func canPlaceFlowers(_ flowerbed: [Int], _ n: Int) -> Bool {
        var counter = 1
        var nFlowers = 0
        var start = -1
        var end = 0
        
        while end<flowerbed.count {
            if flowerbed[end] != 0 { // 1 found
                end += 1
                start = end
                counter = 0
            } else { // zero found
                counter += 1
                if counter == 3 {
                    nFlowers += 1
                    start = end
                    counter = 1
                }
                end += 1
            }
        }
        if counter == 2 {
            nFlowers += 1
        }
        
        return n <= nFlowers
    }
}
//////////////////////////////////////////////////
///////////////////// TRY 2 //////////////////////
//////////////////////////////////////////////////
/*
Runtime: 112 ms, faster than 100.00% of Swift online submissions for Can Place Flowers.
Memory Usage: 19.2 MB, less than 100.00% of Swift online submissions for Can Place Flowers.
Time: o(n)
space: o(n)
*/
class Solution2 {
    func canPlaceFlowers(_ flowerbed: [Int], _ n: Int) -> Bool {
        var counter = 1
        var nFlowers = 0
        var end = 0
        
        while end<flowerbed.count {
            if flowerbed[end] != 0 { // 1 found
                counter = 0
            } else { // zero found
                counter += 1
                if counter == 3 {
                    nFlowers += 1
                    counter = 1
                }
            }
            end += 1
        }
        if counter == 2 {
            nFlowers += 1
        }
        
        return n <= nFlowers
    }
}
