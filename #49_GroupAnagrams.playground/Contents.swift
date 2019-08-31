/*
    ["eat", "tea", "tan", "ate", "nat", "bat"]

    [15: [eat, tea, ate]
    [20: [tan, nar]
    [30: [bat]]

    turn each character into a hexi and add them up
        if that number is not in the dictionary, add value to that key
        else, grab the array and appen to it

    for trhough keys and dictinary
        append each array to the final array



Runtime: 236 ms, faster than 15.43% of Swift online submissions for Group Anagrams.
Memory Usage: 23.6 MB, less than 33.33% of Swift online submissions for Group Anagrams.
 
 Time: o(NKlogK) - N is length of strs, KlogK for sort each str
 Space: o(n)
*/

class Solution {
    func groupAnagrams(_ strs: [String]) -> [[String]] {
        var dic = [String: [String]]()
        
        for str in strs {
            var strUnicodeScalarValue = ""
            let sortedStr = str.sorted()
            for char in sortedStr {
                strUnicodeScalarValue += "\(UnicodeScalar("\(char)")!.value)"
            }
            
            if var value = dic[strUnicodeScalarValue] {
                value.append(str)
                dic[strUnicodeScalarValue] = value
            } else {
                dic[strUnicodeScalarValue] = [str]
            }
        }
        
        var finalResult = [[String]]()
        for value in dic.values {
            finalResult.append(value)
        }
        
        return finalResult
    }
}

/*
Runtime: 204 ms, faster than 52.91% of Swift online submissions for Group Anagrams.
Memory Usage: 24.8 MB, less than 33.33% of Swift online submissions for Group Anagrams.
 
 Time: o(NKlogK) - N is length of strs, KlogK for sort each str
 Space: o(n)
*/
class Solution2 {
    func groupAnagrams(_ strs: [String]) -> [[String]] {
        var dic = [[String.Element]: [String]]()
        
        for str in strs {
            let sortedStr = str.sorted()
            
            if var value = dic[sortedStr] {
                value.append(str)
                dic[sortedStr] = value
            } else {
                dic[sortedStr] = [str]
            }
        }
        
        var finalResult = [[String]]()
        for value in dic.values {
            finalResult.append(value)
        }
        
        return finalResult
    }
}

/*
     Runtime: 196 ms, faster than 72.75% of Swift online submissions for Group Anagrams.
     Memory Usage: 24 MB, less than 33.33% of Swift online submissions for Group Anagrams.
     
     Time: o(NKlogK) - N is length of strs, KlogK for sort each str
     Space: o(n)
*/
    
class Solution3 {
    func groupAnagrams(_ strs: [String]) -> [[String]] {
        guard strs.count > 0 else {return [[String]]()}
        
        var dic = [String: [String]]()
        
        for str in strs {
            let sortedKey = String(str.sorted())
            if var value = dic[sortedKey] {
                value.append(str)
                dic[sortedKey] = value
            } else {
                dic[sortedKey] = [str]
            }
        }
        
        return Array(dic.values)
    }
}
