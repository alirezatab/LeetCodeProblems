/*
 beginWord = "hit",
 endWord = "cog",
 
 create a graph as if each item is a vertex. --> [String: [String]]
 if they are one distance apart,  create the graph connection
 
 ["hot","dot","dog","lot","log","cog"]
 
 dic[hit] = [hot]                    // need helper method to see if word is one apart
 dic[hot] = [dot, lot]
 ...
 dic[dog] = [dot,cog,log]
 
 -------------------------------------
 one dif helper -- param: word 1 and word 2 -- compares each character to see if they are one one or more character difference
 -------------------------------------
 
 do a BFS traverse, keep track of what is visited and what is not
 for BFS, queue is needed
 visited dictonary has string as key and count of visited steps as key
 */

/*
 // Solution A: O(M * N * K) time
 
 Runtime: 14612 ms, faster than 6.10% of Swift online submissions for Word Ladder.
 Memory Usage: 20.1 MB, less than 61.54% of Swift online submissions for Word Ladder.
 */

class Solution {
    func ladderLength(_ beginWord: String, _ endWord: String, _ wordList: [String]) -> Int {
        guard wordList.contains(endWord) else {return 0}
        
        var graph = [String: [String]]()
        
        for i in -1..<wordList.count {
            var word = ""
            if i == -1 {
                word = beginWord
            } else {
                word = wordList[i]
            }
            graph[word] = []
            
            
            for j in 0..<wordList.count {
                if isOneDif(word,wordList[j]) {
                    graph[word]!.append(wordList[j])
                }
            }
        }
        
        var queue = [(word:String, counter: Int)]()
        var visitedDic = [String:Int]()
        
        queue.append((word: beginWord, counter: 1))
        visitedDic[beginWord] = 1
        
        // not empty
        while queue.count > 0 {
            let item = queue.removeFirst()
            let neighborConnection = graph[item.word]!
            for word in neighborConnection {
                if visitedDic[word] == nil { // if it hasnt been visited before
                    visitedDic[word] = item.counter + 1
                    queue.append((word: word, counter: item.counter + 1))
                }
            }
        }
        
        return visitedDic[endWord] != nil ? visitedDic[endWord]! : 0
    }
    
    func isOneDif(_ word1: String, _ word2: String) -> Bool {
        guard word1.count - word2.count < 2 && word1 != word2 else {
            return false
        }
        
        var dif = 0
        for i in 0..<word1.count {
            let index = word1.index(word1.startIndex, offsetBy: i)
            if word1[index] != word2[index] {
                dif += 1
            }
            if dif > 1 {
                return false
            }
        }
        return true
    }
}

///////////////////////////////////////
///////////// TRY 2  //////////////////
///////////////////////////////////////
class Solution1 {
    func ladderLength(_ beginWord: String, _ endWord: String, _ wordList: [String]) -> Int {
        let graph = createGraph(beginWord, endWord, wordList)
        var visited = [String:Int]()
        var queue = [String]()
        
        queue.append(beginWord)
        visited[beginWord] = 1
        
        while queue.count>0 {
            let word = queue.removeFirst()//dequeue
            
            let neighbors = graph[word]!
            let counter = visited[word]!
            
            for w in neighbors {
                if visited[w] == nil {
                    queue.append(w)
                    visited[w] = counter+1
                    
                    if w == endWord {
                        return counter+1
                    }
                }
            }
        }
        return 0
    }
    
    private func createGraph(_ bWord: String, _ eWord: String, _ wordList:[String]) -> [String:[String]] {
        var graph = [String:[String]]()
        
        for i in -1..<wordList.count {
            var wordKey = ""
            if i == -1 {
                wordKey = bWord
            } else {
                wordKey = wordList[i]
            }
            graph[wordKey] = []
            
            for word in wordList {
                if isOneDif(wordKey, word) {
                    graph[wordKey]!.append(word)
                }
            }
        }
        return graph
    }
    
    private func isOneDif(_ word1: String, _ word2: String) -> Bool {
        guard word1 != word2 else {return false}
        
        var found = false
        for i in 0..<word1.count {
            let index = word1.index(word1.startIndex, offsetBy: i)
            
            if word1[index] != word2[index] {
                if found {
                    return false
                }
                found = true
            }
        }
        return true
    }
}


///////////////////////////////////////
///////////// TRY 3 ///////////////////
///////////////////////////////////////
class Solution2 {
    func ladderLength(_ beginWord: String, _ endWord: String, _ wordList: [String]) -> Int {
 
        let wordSet = Set(wordList)
        guard wordSet.contains(endWord) else {return 0}

        var wordGraph = [String: Set<String>]() // better than cause set look at is 0(1)
        wordGraph[beginWord] = beginWord.neighborsIn(wordSet)
        
        
        return 0
    }
}

extension String {
    // Return a Set of all possible neighbors
    func neighborsIn(_ words: Set<String>) -> Set<String> {
        var neighbors = Set<String>()
        
        let alphabetArray = [Character]("abcdefghijklmnopqrstuvwxyz")
        for i in 0..<self.count {
            var chars = [Character](self)
            let temp = chars[i]
            for j in 0..<alphabetArray.count {
                // skip origin word
                if temp == alphabetArray[j] {
                    print("weird temp")
                    continue
                }
                print("continue?")
                chars[i] = alphabetArray[j]
                let newWord = String(chars)
                if words.contains(newWord) {
                    neighbors.insert(newWord)
                }
            }
        }
        
        return neighbors
    }
}

let sol = Solution2()
sol.ladderLength("hit", "cog", ["hot","dot","dog","lot","log","cog"])
