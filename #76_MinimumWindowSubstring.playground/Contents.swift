/*
 Time: o(N)
 space: o(n)
 */
class Solution {
    func minWindow(_ s: String, _ t: String) -> String {
        guard s.count>=t.count else {return ""}
        
        var dic = [Character:Int]()
        
        for char in s {
            dic[char] = 0
        }
        for char in t {
            if let val = dic[char] {
                dic[char] = val+1
            } else {
                return ""
            }
        }
        
        var start = 0, end = 0
        var minStart = 0, minLength = Int.max
        var numOfTargets = t.count
        
        while end < s.count {
            print(end)
            let endIndex = s.index(s.startIndex, offsetBy: end)
            let endChar = s[endIndex]

            if let curOcurrance = dic[endChar] {
                if curOcurrance > 0 {
                    numOfTargets -= 1
                }
                dic[endChar] = curOcurrance-1
            }
            print("here")

            while numOfTargets == 0 {
                if minLength > end-start+1 {
                    minLength = end-start+1
                    minStart = start
                }
                let startIndex = s.index(s.startIndex, offsetBy: start)
                let startChar = s[startIndex]
                
                if let curOccurance = dic[startChar] {
                    if curOccurance == 0 { // or >=
                        numOfTargets += 1
                    }
                    dic[startChar] = curOccurance+1
                }
                start+=1
            }
            end += 1
        }
        if minLength != Int.max {
            let startWindowIndex = s.index(s.startIndex, offsetBy: minStart)
            let endWindowIndex = s.index(s.startIndex, offsetBy: minStart+minLength)
            return String(s[startWindowIndex..<endWindowIndex])
        }
        return ""
    }
}

let sol = Solution()
sol.minWindow("babb", "baba")
//sol2.minWindow("bbaa", "aba")
