/*
 Runtime: 228 ms, faster than 66.67% of Swift online submissions for Valid Palindrome II.
 Memory Usage: 20.1 MB, less than 12.50% of Swift online submissions for Valid Palindrome II.
 */
class Solution {
    func validPalindrome(_ s: String) -> Bool {
        let sArray = Array(s)[0...]
        return validPalindromeHelper(sArray, false)
    }
    
    func validPalindromeHelper(_ sArray: ArraySlice<Character>, _ isNotPalindrome: Bool) -> Bool {
        var leftPtr = sArray.startIndex
        var rightPtr = sArray.endIndex-1
        
        while leftPtr<rightPtr {
            if sArray[leftPtr] != sArray[rightPtr] {
                
                if isNotPalindrome {
                    return false
                }
                
                return validPalindromeHelper(sArray[leftPtr..<rightPtr], true) ||
                    validPalindromeHelper(sArray[leftPtr+1...rightPtr], true)
            }
            leftPtr+=1
            rightPtr-=1
        }
        return true
    }
}
/*
 func validPalindrome(_ s: String) -> Bool {
 let s = Array(s)[0...]
 return valid(s, false)
 }
 
 func valid(_ s: ArraySlice<Character>, _ strict: Bool) -> Bool {
 var i = s.startIndex, j = s.endIndex - 1
 while i < j {
 if s[i] != s[j] {
 if strict {
 return false
 }
 let s1 = s[i+1...j], s2 = s[i...j-1]
 return valid(s1, true) || valid(s2, true)
 }
 i += 1
 j -= 1
 }
 return true
 }
 */
