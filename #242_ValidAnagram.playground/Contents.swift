/*
 go thorough s
 key, value
 a     1->2->3
 n     1
 g     1
 r     1
 m     1
 
 go through t
 key, value
 
 a     1->2->3   1->2->3->2->1->0
 n     1         1->0
 g     1         1->0
 r     1         1->0
 m     1         1->0
 
 if all keys zero, return true
 
 r   1->0   c
 a   1->0   a
 t   1      r
 c   1
 
 intiliaze a empty dictionary
 for through s
 if no key, assign dec.key and value 1
 else --> inc the value by 1
 
 go thorugh t
 if no key --> add key and value 1
 else dec value and put back in key
 
 go throigh values of dic... if >0, return false, else return true
 */

// if ascii, seprate by char and add to dic... smae process could occur as below

class Solution {
    func isAnagram(_ s: String, _ t: String) -> Bool {
        var dic = [Character:Int]()
        
        for char in s {
            if dic[char] == nil {
                dic[char] = 1
            } else {
                var val = dic[char]!
                val += 1
                dic[char] = val
            }
        }
        
        for char in t {
            if dic[char] == nil {
                dic[char] = 1
            } else {
                var val = dic[char]!
                val -= 1
                dic[char] = val
            }
        }
        
        for value in dic.values {
            if value != 0 {return false}
        }
        return true
    }
}
