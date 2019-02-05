/*
 create a hash map of symbol(char or string) and value(Int)
 
    sum = 0
    MCMXCIV
    ij
    i>J sum = value of char at i
 
    MCMXCIV
     ij
    i<J value -  sum = valueof j - value of i, inc by two
 
 ...
 
    III
    ij
    i==J sum = i+j
 
    III
    ij if out out bound -> just add the final one
 
 
 create a hash map of symbol(char or string) and value(Int)
 go through string
    if the i > i+1
        add value at i to sum... inc by one
    if i < i+1,
        sum += value of i+1 - value f i, inc by two
    if i == i+1 value,
        sum += value of i+1 + value f i, inc by two
 
    if i+1 out of bound... check character and add it to final one
 */

/*
 Runtime: 76 ms, faster than 6.98% of Swift online submissions for Roman to Integer.
 Memory Usage: 4 MB, less than 100.00% of Swift online submissions for Roman to Integer.
 
 Runtime: 52 ms, faster than 62.79% of Swift online submissions for Roman to Integer.
 Memory Usage: 4.1 MB, less than 63.33% of Swift online submissions for Roman to Integer.
 */


class Solution {
    func romanToInt(_ s: String) -> Int {
        var dic: [Character: Int] = ["I":1, "V":5, "X":10,
                                     "L":50, "C":100, "D":500,
                                     "M":1000,]
        var num = 0
        var i = 0
        
        var index1: String.Index!
        var index2: String.Index!
        
        while i+1 < s.count {
            index1 = s.index(s.startIndex, offsetBy: i)
            index2 = s.index(s.startIndex, offsetBy: i+1)
            
            let val1 = dic[s[index1]]!
            let val2 = dic[s[index2]]!
            
            if val1 > val2 {
                num += val1
                i += 1
            } else if val1 < val2 {
                num += val2-val1
                i += 2
            } else {
                
                num += val2+val1
                i += 2
            }
        }
        
        if i+1 == s.count {
            index1 = s.index(s.startIndex, offsetBy: s.count-1)
            let finalVal = dic[s[index1]]!
            
            num += finalVal
        }
        
        return num
    }
}
