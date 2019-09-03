/*
 var spaceIndex
 var startOfWord
 var endOfWord
 
 "Let's take LeetCode contest" while space not found... set indexes + space Index
 ^   ^^
 
 while start Index <= endIndex and endIndex is not at of bound of all string {
 
 }
 
 "set'L take LeetCode contest" swap, inc start, dec end
 ^ ^
 "set'L take LeetCode contest" swap, inc start, dec end
 ^
 ^
 */

class Solution {
    func reverseWords(_ s: String) -> String {
        var strArr = Array(s)
        if strArr.count == 0 {return ""}
        
        var spaceIndex = 0
        var start = 0
        var end = 0
        var swapped = false
        
        while end < strArr.count {
            // a function configureEndOfChar
            if strArr[end] != " " && end < strArr.count {
                end+=1
                swapped = false
                //print("before space ", end)
            } else {
                spaceIndex = end
                end-=1
                swapped = true
                //print("after space: ", end)
            }
            
            if end >= strArr.count {
                spaceIndex = end
                end -= 1
                swapped = true
            }
            
            while swapped && start<=end {
                (strArr[start], strArr[end]) = (strArr[end], strArr[start])
                //swap(&strArr[start],&strArr[end])
                start+=1
                end-=1
                
                if start > end {
                    start = spaceIndex+1
                    end = start
                    swapped = false
                }
            }
        }
        
        var reversedStr = String(strArr)
        return reversedStr
        
    }
}
