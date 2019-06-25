/*
 Time: o(n)
 space: o(1)
Runtime: 92 ms, faster than 100.00% of Swift online submissions for Shortest Word Distance.
Memory Usage: 19.8 MB, less than 25.00% of Swift online submissions for Shortest Word Distance.
*/

class Solution {
    func shortestDistance(_ words: [String], _ word1: String, _ word2: String) -> Int {
        var shortestDis = Int.max
        var w1index = -1
        var w2index = -1
        
        for i in 0..<words.count {
            if words[i] == word1 {
                w1index = i
            } else if words[i] == word2 {
                w2index = i
            }
            
            if w1index != -1 && w2index != -1 {
                let dis = abs(w1index - w2index)
                if dis < shortestDis {
                    shortestDis = dis
                }
            }
        }
        return shortestDis
    }
}

/*
 word1 = “coding”, word2 = “practice”
 ["practice", "makes", "perfect", "coding", "makes"]
 ij
 
 ["practice", "makes", "perfect", "coding", "makes"]
 i          j
 
 ["practice", "makes", "perfect", "coding", "makes"]
 i                     j
 
 ["practice", "makes", "perfect", "coding", "makes"]
 i                               j     -> distance is j-i
 
 word1 = "makes", word2 = "coding"
 ["practice", "makes", "perfect", "coding", "makes"]
 ij
 
 ["practice", "makes", "perfect", "coding", "makes"]
 ij
 
 ["practice", "makes", "perfect", "coding", "makes"]
 i                    j    dif = 2
 
 ["practice", "makes", "perfect", "coding", "makes"]
 j
 i dic = 1
 */

/*
 Runtime: 76 ms, faster than 83.87% of Swift online submissions for Shortest Word Distance.
 Memory Usage: 22 MB, less than 7.14% of Swift online submissions for Shortest Word Distance.
 
 Time: o(n)
 Space: o(1)
 
 Solution1 is a bit faster cause for-loop enumerated is faster than normal for-loop;
 */

class Solution1 {
    func shortestDistance(_ words: [String], _ word1: String, _ word2: String) -> Int {
        var shortestDis = Int.max
        var word1index = -1
        var word2index = -1
        
        for (index,word) in words.enumerated() {
            if word == word1 {
                word1index = index
            } else if word == word2 {
                word2index = index
            }
            
            if word1index != -1 && word2index != -1 {
                if shortestDis > abs(word1index-word2index) {
                    shortestDis = abs(word1index-word2index)
                }
            }
        }
        return shortestDis
    }
}
