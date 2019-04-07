/*
 Time: o(N)
 space: o(n)
 
 Runtime: 80 ms, faster than 83.93% of Swift online submissions for Minimum Window Substring.
 Memory Usage: 20.1 MB, less than 60.00% of Swift online submissions for Minimum Window Substring.
 */
class Solution {
    func minWindow(_ s: String, _ t: String) -> String {
        guard s.count>=t.count else {return ""}
        
        var dic = [String.Element:Int]()
        let sChars = Array(s)
        let tChars = Array(t)
        
        for char in tChars {
            if let val = dic[char] {
                dic[char] = val+1
            } else {
                dic[char] = 1
            }
        }
        
        var start = 0
        var minStart = 0, minLength = Int.max
        var numOfTargets = t.count
        
        for end in 0..<sChars.count {
            
            if let curOcurrance = dic[sChars[end]] {
                if curOcurrance > 0 {
                    numOfTargets -= 1
                }
                dic[sChars[end]] = curOcurrance-1
            }
            
            while numOfTargets == 0 {
                if minLength > end-start+1 {
                    minLength = end-start+1
                    minStart = start
                }
                
                if let curOccurance = dic[sChars[start]] {
                    if curOccurance == 0 {
                        numOfTargets += 1
                    }
                    dic[sChars[start]] = curOccurance+1
                }
                start+=1
            }
        }
        
        return minLength == Int.max ? "" : String(sChars[minStart..<minStart+minLength])
    }
}



let sol = Solution()
sol.minWindow("babb", "baba")
//sol2.minWindow("bbaa", "aba")
