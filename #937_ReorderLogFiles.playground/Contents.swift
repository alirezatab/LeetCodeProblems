/*
Input: ["a1 9 2 3 1","g1 act car","zo4 4 7","ab1 off key dog","a8 act zoo"]
go through each item -- for loop
    "a1 9 2 3 1" -> seperate them into an array -> ["a1", "9", "2", "3", "1"]

    check if the first item at index 1 is a int or a word
        if word
                
        else
          append to numbers
                 
["a1", "9", "2", "3", "1"] -> 9 is an Int
    append to numbers


"g1 act car" -> ["g1", "act", "car"] -> act is a word
    remove g1 -> ["act", "car"] -> join them -> ["act car"]
    append to suffixArray -> [["act car"]]
    append log to letters -> ["g1 act car"]

words = ["g1 act car", "ab1 off key dog", "a8 act zoo"]
suffix = ["act car", "off key dog", "act zoo"]
numbers = ["a1 9 2 3 1", "zo4 4 7"]

now need to sort suffix and map it to words
words = ["g1 act car", "a8 act zoo", "ab1 off key dog"]

return words + numbers
*/

import Foundation

class Solution {
    func reorderLogFiles(_ logs: [String]) -> [String] {
        var words = [String]()
        var numbers = [String]()
        var suffix = [String]()
        
        for log in logs {
            var temp = log.components(separatedBy: " ")
            
            if Int(temp[1]) != nil { // Int
                numbers.append(log)
            } else { //words
                temp.remove(at: 0)
                suffix.append(temp.joined(separator: " "))
                words.append(log)
            }
        }

        words = suffix.enumerated().sorted(by: {$0.element<$1.element}).map({$0.offset}).map({words[$0]})
        
        return words + numbers
    }
}
