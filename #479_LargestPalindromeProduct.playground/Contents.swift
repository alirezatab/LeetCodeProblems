import Darwin

/*
 code technically works but has issue passing n = 4 cause swift string conversion is expensive/slow thus Time Limit Exceedes what is allowed
 */

class Solution {
    func largestPalindrome(_ n: Int) -> Int {
        
        var res = 0
        let largestRange = Int(pow(Double(10),Double(n)))-1
        let lowestRange =  Int(pow(Double(10),Double(n-1)))
        
        for i in stride(from: largestRange, to: lowestRange, by: -1) {
            for j in stride(from: i, to: lowestRange, by: -1) {
                let multiple = i*j
                let multipleStr = String(multiple)
                let multipleStrReversed =  String(multipleStr.reversed())
                
                if multipleStr == multipleStrReversed && res < multiple {
                    res = multiple
                    break
                }
            }
        }
        
        return res%1337
    }
}

let sol = Solution()
sol.largestPalindrome(3)
