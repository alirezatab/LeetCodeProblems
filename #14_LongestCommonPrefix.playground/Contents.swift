/*
 ["flower","flow","flight"] let prefix = arr[0]
 
 *
 flower
  *
 flow
   *
    *
     *
 go through the second item of the array to end
    while in range of second element
    check each character against prefix, if difference found,
        update prefix
 
 lots of age cases when doing horizontally.
 character lenght
 empty character anywhere other than first item
 etc.etc
 */

/*
 Runtime: 40 ms, faster than 44.64% of Swift online submissions for Longest Common Prefix.
 Memory Usage: 4 MB, less than 53.93% of Swift online submissions for Longest Common Prefix.
 */

// Horizontal Scanning
class Solution {
    func longestCommonPrefix(_ strs: [String]) -> String {
        guard strs.count > 0 else {return ""}
        
        var prefixStr = ""
        
        for str in strs {
            if str == "" {return  ""}
            if prefixStr == "" {
                prefixStr = str
            } else {
                var i = 0
                let minCount = min(str.count,prefixStr.count)
                while i<minCount {
                    let index = str.index(str.startIndex, offsetBy: i)
                    if str[index] != prefixStr[index] {
                        if i>0 {
                            prefixStr = String(str[..<index])
                            break
                        } else {
                            return ""
                        }
                    } else if i+1 >= minCount && minCount<prefixStr.count {
                        prefixStr = str
                    }
                    i+=1
                }
                
            }
        }
        return prefixStr
    }
}
/*
      *
    ["flower",
     "flow",
     "flight"]
        /___________________________________
       *\                                   |
    ["flower",                              |
     "flow",                                |
     "flight"]                              |
                                            |
        * --> fail, return the range before it
    ["flower",
     "flow",
     "flight"]
 
 loop through each char based on size first string size
    get character at that index
    loop through each item of the array
        make sure the index is not out of bound &&
        the character at that index matches the saved character, if not
            return the str to one beofre that index
 
 or reutnr str[0]
 */

/*
 Runtime: 44 ms, faster than 44.64% of Swift online submissions for Longest Common Prefix.
 Memory Usage: 4 MB, less than 89.89% of Swift online submissions for Longest Common Prefix.
 */

// vertical scanning
class Solution1 {
    func longestCommonPrefix(_ strs: [String]) -> String {
        guard strs.count > 0 else {return ""}
        
        for col in 0..<strs[0].count {
            let index = strs[0].index(strs[0].startIndex, offsetBy: col)
            let charStr = strs[0][index]
            for row in 1..<strs.count {
                // means out of bound && character doesnt match that rows character at that colum
                if strs[row].count == col || strs[row][index] != charStr {
                    return String(strs[0][..<index])
                }
            }
        }
        return strs[0]
    }
}
