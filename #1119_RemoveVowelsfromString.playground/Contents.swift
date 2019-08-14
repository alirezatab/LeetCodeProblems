/*
    create a set of vowels
    set: ["a", "e", "i", "o", "u"]

    initilize a variable for lenght of str
    var ptr = 0
    while loop to say if we havent reach the end

     *
    "leetcodeisacommunityforcoders" is character part of set -> No - inc ptr
      *
    "leetcodeisacommunityforcoders" is character part of set -> Yes - remove character at that index
*/

/*
Runtime: 16 ms, faster than 9.30% of Swift online submissions for Remove Vowels from a String.
Memory Usage: 20.8 MB, less than 100.00% of Swift online submissions for Remove Vowels from a String.
 
 Time: o(N)
 space: o(N)
*/

class Solution1 {
    func removeVowels(_ S: String) -> String {
        var stringCopy = S
        var ptr = 0
        var count = S.count
        
        let vowels: Set<Character> = ["a", "e", "i", "o", "u"]
        
        while ptr < count {
            let strIndex = stringCopy.index(stringCopy.startIndex, offsetBy: ptr)
            if vowels.contains(stringCopy[strIndex]) {
                stringCopy.remove(at: strIndex)
                count -= 1
            } else {
                ptr += 1
            }
        }

        return stringCopy
    }
}

/*
Runtime: 8 ms, faster than 67.44% of Swift online submissions for Remove Vowels from a String.
Memory Usage: 21.1 MB, less than 100.00% of Swift online submissions for Remove Vowels from a String.
 
 Time: o(N)
 space: o(N)
*/
class Solution2 {
    func removeVowels(_ S: String) -> String {
        var result = String()
        let vowels: Set<Character> = ["a", "e", "i", "o", "u"]
        
        for char in S {
            if !vowels.contains(char){
                result.append(char)
            }
        }
        return result
    }
}


// Fastest but verbose
/*
Runtime: 0 ms, faster than 100.00% of Swift online submissions for Remove Vowels from a String.
Memory Usage: 20.6 MB, less than 100.00% of Swift online submissions for Remove Vowels from a String.
 
 Time: o(N)
 space: o(N)
*/
class Solution {
    func removeVowels(_ S: String) -> String {
        var result = String()
        
        for char in S {
            switch char {
                case "a": break
                case "e": break
                case "i": break
                case "o": break
                case "u": break
                default: result.append(char)
            }
        }
        return result
    }
}
