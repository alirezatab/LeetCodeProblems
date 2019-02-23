/*
 Runtime: 132 ms, faster than 100.00% of Swift online submissions for Can Place Flowers.
 Memory Usage: 18.9 MB, less than 100.00% of Swift online submissions for Can Place Flowers.
 */

class Solution {
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
