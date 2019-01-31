class Solution {
    func fizzBuzz(_ n: Int) -> [String] {
        var arr = [String]()
        
        for i in 0..<n {
            let trueNum = i+1
            arr.append("\(trueNum)")
            
            if trueNum%3 == 0 && trueNum%5 == 0 {
                arr[i] = "FizzBuzz"
            } else if trueNum%3 == 0 {
                arr[i] = "Fizz"
            } else if trueNum%5 == 0 {
                arr[i] = "Buzz"
            }
        }
        return arr
    }
}

let sol = Solution()
print(sol.fizzBuzz(15))
