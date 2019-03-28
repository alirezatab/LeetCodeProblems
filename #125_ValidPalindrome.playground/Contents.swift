/*
 Runtime: 36 ms, faster than 89.43% of Swift online submissions for Valid Palindrome.
 Memory Usage: 20.4 MB, less than 85.71% of Swift online submissions for Valid Palindrome.
 
 space: o(N) - cause of validCharSet -- otherwise o(1) -- also, array cause of issue of with looking at index of string (possible to do but takes longer under the hood)
 time: 0(n) - cause we have to go through every character
 */

class Solution {
    
    let validCharSet: Set<Character> = ["a","b","c","d","e","f","g","h","i",
                                        "j","k","l","m","n","o","p","q","r","s",
                                        "t","u","v","w","x","y","z","0","1","2",
                                        "3","4","5","6","7","8","9"]
    
    func isPalindrome(_ s: String) -> Bool {
        guard s.count > 1 else {return true}
        var start = 0
        var end = s.count-1
        var strArr = Array(s.lowercased())
        
        while start<end {
            while !validCharSet.contains(strArr[start]){
                start+=1
                if start == end {
                    return true
                }
            }
            while !validCharSet.contains(strArr[end]){
                end-=1
            }
            if strArr[start] != strArr[end] {
                return false
            }else {
                start+=1
                end-=1
            }
        }
        
        return true
    }
}
