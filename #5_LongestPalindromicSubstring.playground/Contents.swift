/*
  "babad" i=0  arr.count = 5, palindromeStr = ""
   |      Li, Ri = i
   Li     check if the value at i is the same, if it is same, it is palindrome,
   Ri         in Ri, dec Li

  "babad"
|   |
Li  Ri     return "b"

  pal = b

  "babad" Li = i, Ri = i+1
   ||
  LiRi      break and return "a"

  inc i
  
  "babad"
    |
   Li
   Ri
  
  "babad" isPalindrome is true
   | |
  Li Ri

  "babad" out of index, so return "bab"
 |    |
 Li   Ri

  if return string.count > palin.count -> replace palindoem string
   

  "babad" isPalindrome is true
    ||
   LiRi

  ...

  "cbbd"
   |
   Li
   Ri   pal = "c"

  "cbbd"
   ||
  Li
    Ri  false return "c"

  inc i
  "cbbd"
    |
   Li
   Ri true
  
  "cbbd"  return "b" -> no change cause of count logic
   | |
   Li
     Ri

  "cbbd"
    ||
   Li
     Ri true, dec inc Li, Ri

  "cbbd"
   |  |
   Li
     Ri false, update palindomeStr = "bb"

  

  inc i
  "cbbd"
     |
     Li
     Ri true, inc dec Li Ri

  "cbbd"
    | |
    Li
      Ri false, return "b"
  */

/*
 Runtime: 1000 ms, faster than 28.63% of Swift online submissions for Longest Palindromic Substring.
 Memory Usage: 21 MB, less than 100.00% of Swift online submissions for Longest Palindromic Substring.
 
 Time: o(n^3)
 Space: o(1)
 
 */

class Solution {
    func longestPalindrome(_ s: String) -> String {
        var res = ""
        let arr = Array(s)
        var index = 0
        
        while index < arr.count {
            if res.count >= (arr.count - index) * 2 {
                break
            }
            
            var palindrome = findPalindrome(arr, left: index, right: index)
            if palindrome.count > res.count {
                res = palindrome
            }
            
            palindrome = findPalindrome(arr, left: index, right: index+1)
            if palindrome.count > res.count {
                res = palindrome
            }
            index += 1
            
        }
        return res
    }
    
    func findPalindrome(_ arr: [Character], left: Int, right: Int) -> String {
        var leftIndex = left
        var rightIndex = right
        
        while leftIndex > -1 && rightIndex<arr.count {
            if arr[leftIndex] != arr[rightIndex] {break}
            leftIndex -= 1
            rightIndex+=1
        }
        
        return String(arr[leftIndex+1..<rightIndex])
    }
}
