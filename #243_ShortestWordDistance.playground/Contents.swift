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
