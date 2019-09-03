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
