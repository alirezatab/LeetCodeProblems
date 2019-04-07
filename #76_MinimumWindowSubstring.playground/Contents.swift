// works for most cases but not all
// last failure was if t: is a duplicate string like "aba"

class Solution {
    func minWindow(_ s: String, _ t: String) -> String {
        var shortest = [-1, s.count]
        var allowedCharDic = [Character: Int]()
        var missing = t.count
        var prevDis = Int.max
        
        
        for char in t {
            allowedCharDic[char] = 0
        }
        
        var slow = 0
        for fast in 0..<s.count {
            let fastIndex = s.index(s.startIndex, offsetBy: fast)
            let key = s[fastIndex]
            
            if let count = allowedCharDic[key] {
                if count == 0 {
                    missing -= 1
                }
                allowedCharDic[key] = count+1
            }
            while missing == 0 {
                    
                let localDistance = fast-slow
                if localDistance < prevDis {
                    shortest[0] = slow
                    shortest[1] = fast
                    prevDis = localDistance
                }
                
                
                let slowIndex = s.index(s.startIndex, offsetBy: slow)
                let key = s[slowIndex]
                
                if let count = allowedCharDic[key] {
                    if count == 1 {
                        missing += 1
                    }
                    allowedCharDic[key] = count-1
                }
                slow+=1
            }
        }
        
        let sIndex = s.index(s.startIndex, offsetBy: shortest[0])
        let fIndex = s.index(s.startIndex, offsetBy: shortest[1])
        let finalString = String(s[sIndex...fIndex])
        return finalString
    }
}
