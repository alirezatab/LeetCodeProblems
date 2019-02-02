/*
 for j to create keys and init with 0's
 for s to see if each char is a key, if it is, inc value
 key|val
 ___|___
 a  | 1
 b  | 1 -> 1+1 = 2 --> ...
 
 */
class Solution {
    func numJewelsInStones(_ J: String, _ S: String) -> Int {
        
        var dic = [Character: Int]()
        for char in J {
            dic[char] = 0
        }
        
        for char in S {
            if dic[char] != nil {
                var val = dic[char]!
                val += 1
                dic[char] = val
            }
        }
        
        var total = 0
        for value in dic.values {
            total += value
        }
        
        return total
    }
}
