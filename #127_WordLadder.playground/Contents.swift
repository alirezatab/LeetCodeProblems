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

class Solution1 {
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
class Solution2 {
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
/*
 Runtime: 2468 ms, faster than 32.98% of Swift online submissions for Word Ladder.
 Memory Usage: 21.1 MB, less than 7.69% of Swift online submissions for Word Ladder.
*/
class Solution3 {
    func ladderLength(_ beginWord: String, _ endWord: String, _ wordList: [String]) -> Int {
 
        let wordSet = Set(wordList)
        guard wordSet.contains(endWord) else {return 0}

        // created a word graph
        var wordGraph = [String: Set<String>]() // better than cause set look at is 0(1)
        wordGraph[beginWord] = beginWord.neighborsIn(wordSet)
        
        wordSet.forEach { (word) in
            //print("word: \(word)")
            word.neighborsIn(wordSet).forEach({ (key) in
                //print("key: \(key)")
                if wordGraph[key]?.insert(word) == nil {
                    wordGraph[key] = [word]
                }
            })
        }
        
        var visited: Set<String> = [beginWord]
        var queue = [String]()
        queue.insert(beginWord, at: 0)
        
        var depth = 1
        
        while !queue.isEmpty {
            var nextQueue = [String]()
            
            while !queue.isEmpty {
                let currentWord = queue.removeLast()
                if currentWord == endWord {
                    return depth
                }
                
                let neighbors = wordGraph[currentWord]!
                print(neighbors)
                for neighbor in neighbors {
                    if !visited.contains(neighbor) {
                        visited.insert(neighbor)
                        nextQueue.insert(neighbor, at: 0)
                        //queue.insert(neighbor, at: 0)
                    }
                }
            }
            
            (queue, nextQueue) = (nextQueue, queue)
            depth += 1
        }
        
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
            //print("chars: \(chars)")
            let temp = chars[i]
            //print("temp: \(temp)")
            
            for j in 0..<alphabetArray.count {
                // skip origin word
                //print("alphabetArr: \(alphabetArray[j])")
                if temp == alphabetArray[j] {
                    continue
                }
                
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



///////////////////////////////////////
///////////// TRY 4 ///////////////////
///////////////////////////////////////
/*
 Runtime: 2468 ms, faster than 32.98% of Swift online submissions for Word Ladder.
 Memory Usage: 21.1 MB, less than 7.69% of Swift online submissions for Word Ladder.
 */
class Solution4 {
    func ladderLength(_ beginWord: String, _ endWord: String, _ wordList: [String]) -> Int {
        
        let wordSet = Set(wordList)
        guard wordSet.contains(endWord) else {return 0}
        
        let graph = createGraph(beginWord, endWord, wordSet)
        
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
    
    private func createGraph(_ bWord: String, _ eWord: String, _ wordSet:Set<String>) -> [String:Set<String>] {
        
        var wordGraph = [String: Set<String>]()
        wordGraph[bWord] = bWord.neighborsIn(wordSet)
        
        wordSet.forEach { (word) in
            word.neighborsIn(wordSet).forEach({ (key) in
                if wordGraph[key]?.insert(word) == nil {
                    wordGraph[key] = [word]
                }
            })
        }
        return wordGraph
    }
}

//extension String {
//    // Return a Set of all possible neighbors
//    func neighborsIn(_ words: Set<String>) -> Set<String> {
//        var neighbors = Set<String>()
//
//        let alphabetArray = [Character]("abcdefghijklmnopqrstuvwxyz")
//        for i in 0..<self.count {
//            var chars = [Character](self)
//            //print("chars: \(chars)")
//            let temp = chars[i]
//            //print("temp: \(temp)")
//
//            for j in 0..<alphabetArray.count {
//                // skip origin word
//                //print("alphabetArr: \(alphabetArray[j])")
//                if temp == alphabetArray[j] {
//                    continue
//                }
//
//                chars[i] = alphabetArray[j]
//                let newWord = String(chars)
//                //print(newWord)
//                if words.contains(newWord) {
//                    neighbors.insert(newWord)
//                }
//            }
//        }
//
//        return neighbors
//    }
//}

///////////////////////////////////////
///////////// TRY 5 ///////////////////
///////////////////////////////////////
class Solution5 {
    func ladderLength(_ beginWord: String, _ endWord: String, _ wordList: [String]) -> Int {
        
        let wordSet = Set(wordList)
        guard wordSet.contains(endWord) else {return 0}
        
        let graph = createGraph(beginWord, endWord, wordList)
        
        var bVisited = [String:Int]()
        var eVisited = [String:Int]()
        
        var bQueue = [String]()
        var eQueue = [String]()
        
        bQueue.append(beginWord)
        eQueue.append(endWord)
        
        bVisited[beginWord] = 1
        eVisited[endWord] = 1
        
        while !bQueue.isEmpty && !eQueue.isEmpty {
            let bWord = bQueue.removeFirst()//dequeue
            let eWord = eQueue.removeFirst()
            
            guard let bNeighbors = graph[bWord] else {return 0}
            guard let eNeighbors = graph[eWord] else {return 0}
            
            let bCounter = bVisited[bWord]!
            let eCounter = eVisited[eWord]!
            
            var tempSet = Set<String>()
            for bW in bNeighbors {
                if !tempSet.contains(bW) {
                    tempSet.insert(bW)
                }
                if bVisited[bW] == nil {
                    bQueue.append(bW)
                    bVisited[bW] = bCounter+1
                }
            }
            for eW in eNeighbors {
                if tempSet.contains(eW) {
                    print(eW)
                    print("bVisited: \(bVisited)")
                    print("bVisited[eW]: \(bVisited[eW])")
                    print("eVisited: \(eVisited)")
                    print(eCounter)
                    return bVisited[eW]! + eCounter
                } else if eVisited[eW] == nil {
                    eQueue.append(eW)
                    eVisited[eW] = eCounter+1
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
///////////// TRY 6 ///////////////////
///////////////////////////////////////
class Solution6 {
    func ladderLength(_ beginWord: String, _ endWord: String, _ wordList: [String]) -> Int {
        
        let wordSet = Set(wordList)
        guard wordSet.contains(endWord) else {return 0}
        
        let graph = createGraph(beginWord, endWord, wordList)
        
        print(graph)
        
        var bVisited = [String:Int]()
        var eVisited = [String:Int]()
        
        var bQueue = [String]()
        var eQueue = [String]()
        
        bQueue.append(beginWord)
        eQueue.append(endWord)
        
        bVisited[beginWord] = 1
        eVisited[endWord] = 1
        
        while !bQueue.isEmpty && !eQueue.isEmpty {
            let bWord = bQueue.removeFirst()//dequeue
            let eWord = eQueue.removeFirst()
            
            guard let bNeighbors = graph[bWord] else {return 0}
            guard let eNeighbors = graph[eWord] else {return 0}
            
            let bCounter = bVisited[bWord]!
            let eCounter = eVisited[eWord]!
            
            var tempSet:Set<String> = [bWord,eWord]
            print(tempSet)
            for bW in bNeighbors {
                tempSet.insert(bW)
            }
            print(tempSet)
            for eW in eNeighbors {
                if tempSet.contains(eW) {
                    return bCounter + eCounter + 1
                }
            }
            
            for bW in bNeighbors {
                if bVisited[bW] == nil {
                    bQueue.append(bW)
                    bVisited[bW] = bCounter+1
                }
            }
            for eW in eNeighbors {
                if eVisited[eW] == nil {
                    eQueue.append(eW)
                    eVisited[eW] = eCounter+1
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

/*
 print(eW)
 print("bVisited: \(bVisited)")
 print("bVisited[eW]: \(bVisited[eW])")
 print("eVisited: \(eVisited)")
 print(eCounter)
 */
