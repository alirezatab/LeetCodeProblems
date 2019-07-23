/*
 Input:
 paragraph = "Bob hit a ball, the hit BALL flew far after it was hit."
 banned = ["hit"]
 Output: "ball"
 
 lowe case the paragrapgh
 paragraph = "bob hit a ball, the hit ball flew far after it was hit."
 turn in to dictionary and ignore the banned words
 K    |  V
 -------------
 bob   |  1
 ball  |  2
 a     |  1
 the   |  1
 flew  |  1
 far   |  1
 after |  1
 it    |  1
 was   |  1
 
 loop throught they keys and values and keep a track of max
 
 initilize result = ""
 initilize max = 0
 initilize dicionary of type [String:Int]
 
 create a unwatend words that takes out specialChars and whiteSpaces
 
 seperate string in to array of words
 go through words and if it is not empty && not one of the banned characters
 look see if the word exist in the dic... if yes
 get the valueCounter and inc
 else
 add it to dic with val of 1
 
 loop through the keys and values of the dic
 if max is less than the value
 update max with value
 make result be the key
 
 return the result
 */

/*
 Runtime: 60 ms, faster than 39.09% of Swift online submissions for Most Common Word.
 Memory Usage: 21.9 MB, less than 9.09% of Swift online submissions for Most Common Word.
 
 o(n) for time and space
 */

import Foundation

class Solution {
    func mostCommonWord(_ paragraph: String, _ banned: [String]) -> String {
        
        var dic = [String: Int]()
        
        let punc = CharacterSet.punctuationCharacters
        let whiteSpace = CharacterSet.whitespacesAndNewlines
        let unwantedChar = punc.union(whiteSpace)
        
        let words = paragraph.lowercased().components(separatedBy: unwantedChar)
        for word in words {
            if !word.isEmpty && !banned.contains(word) {
                if let counter = dic[word] {
                    dic[word] = counter + 1
                } else {
                    dic[word] = 1
                }
            }
        }
        
        var max = 0
        var result = ""
        
        for (key, val) in dic {
            if max < val {
                max = val
                result = key
            }
        }
        return result
    }
}
