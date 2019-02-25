/*
 time: o(N)
 space: o(1)
 
Runtime: 96 ms, faster than 100.00% of Swift online submissions for Shortest Word Distance III.
Memory Usage: 20 MB, less than 66.67% of Swift online submissions for Shortest Word Distance III.
*/
 
class Solution {
    func shortestWordDistance(_ words: [String], _ word1: String, _ word2: String) -> Int {
        var w1found = false
        var w2found = false
        var w1index = -1
        var w2index = -1
        var shortestDis = Int.max
        
        for i in 0..<words.count {
            if words[i] == word1 {
                
                if w1found && !w2found && word1 == word2 { // if w1 is same as w2
                    configureShortestDis(index1: w1index, index2: i, shortestDis: &shortestDis)
                }
                
                w1found = true
                w1index = i
            } else if words[i] == word2 {
                w2found = true
                w2index = i
            }
            
            if w1found && w2found {
                configureShortestDis(index1: w1index, index2: w2index, shortestDis: &shortestDis)
            }
        }
        return shortestDis
    }
    
    func configureShortestDis(index1: Int, index2: Int, shortestDis: inout Int) {
        let dis = abs(index1 - index2)
        if dis < shortestDis {
            shortestDis = dis
        }
    }
}
