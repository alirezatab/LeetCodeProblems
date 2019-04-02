
// DO Again and optimize time


/*
 Runtime: 9612 ms, faster than 3.33% of Swift online submissions for Shortest Word Distance II.
 Memory Usage: 20.2 MB, less than 100.00% of Swift online submissions for Shortest Word Distance II.
 */
// This is best space complexity cause only one array is used to hold the data

// two pointers -- sliding window style
class WordDistance {
    
    var arr = [String]()
    
    init(_ words: [String]) {
        print(words)
        self.arr = words
    }
    
    func shortest(_ word1: String, _ word2: String) -> Int {
        
        var shortestDist = Int.max
//        var w1Found = false
//        var w2Found = false
        var word1Ptr = -1
        var word2Ptr = -1
        
        for i in 0..<arr.count {
            if word1 == arr[i] {
                word1Ptr = i
                //w1Found = true
            } else if word2 == arr[i] {
                word2Ptr = i
                //w2Found = true
            }
            
            if word1Ptr != -1 && word2Ptr != -1 { //w1Found && w2Found {
                let distance = abs(word2Ptr-word1Ptr)
                
                if distance < shortestDist {
                    shortestDist = distance
                }
            }
        }
        
        
        return shortestDist
    }
}

/**
 * Your WordDistance object will be instantiated and called as such:
 * let obj = WordDistance(words)
 * let ret_1: Int = obj.shortest(word1, word2)
 */

