/*
 create a dictionary for maping
 go through the array
 
 s = "egg"
 *
 t = "add"
 --------------> if dic[e] is nil,
 -------------->     then create dic[e] = i
 s = "egg"
 *
 t = "add"
 --------------> if dic[e] is nil,
 -------------->     then create dic[e] = i
 s = "egg"
 *
 t = "add"
 --------------> if dic[e] is not nil,
 -------------->     then value of that dic.key should euqal to the character of other one, otherwise return false
 
 s = "foo",
 *
 t = "bar"
 key, value = f,b
 
 s = "foo",
 *
 t = "bar"
 key, value = o,a
 
 s = "foo",
 *
 t = "bar"
 key, value = o,value not a, return false
 */

/*
 Runtime: 12096 ms, faster than 1.96% of Swift online submissions for Isomorphic Strings.
 Memory Usage: 19.6 MB, less than 100.00% of Swift online submissions for Isomorphic Strings.
 */

class Solution {
    func isIsomorphic(_ s: String, _ t: String) -> Bool {
        var dicA = [Character:Character]()
        var dicB = [Character:Character]()
        
        for i in 0..<s.count {
            let sIndex = s.index(s.startIndex, offsetBy: i)
            let tIndex = t.index(t.startIndex, offsetBy: i)
            
            if dicA[s[sIndex]] == nil {
                dicA[s[sIndex]] = t[tIndex]
            } else {
                let val = dicA[s[sIndex]]
                if val != t[tIndex] {
                    return false
                }
            }
            
            if dicB[t[tIndex]] == nil {
                dicB[t[tIndex]] = s[sIndex]
            } else {
                let val = dicB[t[tIndex]]
                if val != s[sIndex] {
                    return false
                }
            }
            
        }
        return true
    }
}
