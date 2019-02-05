/*
 go through the array once
 create a table of character and number of character
 if not there add char and one as value 1
 else inc the count
 
 go through array again,
 if key is one ... return that index of the array
 */

class Solution {
    func firstUniqChar(_ s: String) -> Int {
        
        var dic = [Character:Int]()
        for char in s {
            if var val = dic[char] {
                val += 1
                dic[char] = val
            } else {
                dic[char] = 1
            }
        }
        
        var index = 0
        for char in s {
            if let val = dic[char], val == 1 {
                return index
            }
            index += 1
        }
        
        return -1
    }
}
