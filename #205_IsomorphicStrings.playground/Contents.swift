/*
 create a dictionary for maping
 go through the array
 
 s = "egg"
      *
 t = "add"
 --------------> if dic["e"] is nil,
 -------------->     then create dic["e"] = "a"
 s = "egg"
       *
 t = "add"
 --------------> if dic["g"] is nil,
 -------------->     then create dic["g"] = "d"
 s = "egg"
        *
 t = "add"
 --------------> if dic["g"] is not nil,
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

//////////////////////////////////////////////////////////
//////////////////////// TRY 1 ///////////////////////////
//////////////////////////////////////////////////////////
/*
 Runtime: 56 ms, faster than 34.29% of Swift online submissions for Isomorphic Strings.
 Memory Usage: 19.9 MB, less than 20.00% of Swift online submissions for Isomorphic Strings.

 Time: o(n) - n being the size of the string
 Space: o(n+m) - one dicA && dicB
 */


class Solution1 {
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


//////////////////////////////////////////////////////////
//////////////////////// TRY 2 ///////////////////////////
//////////////////////////////////////////////////////////
/*
 Runtime: 24 ms, faster than 100.00% of Swift online submissions for Isomorphic Strings.
 Memory Usage: 19.8 MB, less than 20.00% of Swift online submissions for Isomorphic Strings.
 
 Time: o(n*m) - n being the size of the string - m is doing a look of dic values.
 Space: o(n) - one dicA && dicB
 */
class Solution2 {
    func isIsomorphic(_ s: String, _ t: String) -> Bool {
        guard s.count == t.count else {return false}
        
        var dic = [Character:Character]()
        
        let sArray = Array(s)
        let tArray = Array(t)
        
        for i in 0..<s.count {
            let sChar = sArray[i]
            let tChar = tArray[i]
            if let val = dic[sChar] {
                if val == tChar {
                    continue
                } else {
                    return false
                }
            } else {
                if dic.values.contains(tChar) {
                    return false
                } else {
                    dic[sChar] = tChar
                }
            }
            
        }
        
        return true
    }
}

// egg s=e
// *
// add t=a

// e   a
// g   d
