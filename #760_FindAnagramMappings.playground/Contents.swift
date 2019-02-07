/*
 go through B array and add the arrVal as dicKeys, arrIndex as dicValues
 [50, 12, 32, 46, 28] dic[50:0, ]
 ^
 [50, 12, 32, 46, 28] dic[50:0, 12:1]
 ^
 [50, 12, 32, 46, 28] dic[50:0, 12:1, 32:2]
 ^
 ... till all elements are in the ditionary
 ... go through A array
 [12, 28, 46, 32, 50]  dic[50:0, 12:1, 32:2, 46:3, 28:4]
 * look at dic --> 12->1 --> append 1 to the resArr --> [1]
 
 [12, 28, 46, 32, 50]  dic[50:0, 12:1, 32:2, 46:3, 28:4]
 * look at dic --> 28->4 --> append 4 to the resArr --> [4]
 ... and so on
 
 // assumption, no dulicated
 
 init a result Array
 init a dictionary
 
 go through array B
 if no key, create key and value
 else
 not anagram..
 
 go through arrA
 if key is found
 append the value to result array
 else
 no anagram
 
 */

/* Assumptions:
 A, B have equal lengths in range [1, 100].
 A[i], B[i] are integers in range [0, 10^5].
 */

/*
 Time & space = o(N)
 Runtime: 12 ms, faster than 100.00% of Swift online submissions for Find Anagram Mappings.
 Memory Usage: 3.9 MB, less than 33.33% of Swift online submissions for Find Anagram Mappings.
 */

class Solution {
    func anagramMappings(_ A: [Int], _ B: [Int]) -> [Int] {
        var result = [Int](repeating: 0, count: A.count)
        var dic = [Int:Int]()
        
        for i in 0..<B.count {
            if dic[B[i]] == nil {
                dic[B[i]] = i
            }
        }
        
        for j in 0..<A.count {
            if dic[A[j]] != nil {
                result[j] = (dic[A[j]]!)
            }
        }
        return result
    }
}
