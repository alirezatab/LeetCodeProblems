/*class Solution {
    func countPrimes(_ n: Int) -> Int {
        guard n>2 else {return 0}
        if n == 3 {return 1}
        
        var isPrimeArr = [Bool](repeating: true, count: n + 1)
        isPrimeArr[0] = false
        isPrimeArr[1] = false
        
        var counter = 2
        var i = counter
        while i<=n {
            if i/2 != 1 {
                isPrimeArr[i] = false
            }
            i+=counter
        }
                
        counter += 1 //3
        var j = counter
        while j <= n {
            if j/3 != 1 && isPrimeArr[j] == true {
                isPrimeArr[j] = false
            }
            j+=counter
        }
        
        counter += 2 //5
        var k = counter
        while k <= n {
            if k/5 != 1 && isPrimeArr[k] == true {
                isPrimeArr[k] = false
            }
            k += counter
        }
        
        counter = 0
        for val in isPrimeArr {
            if val == true {
                counter += 1
            }
        }
        return counter
    }
}
*/

class Solution {
    func countPrimes(_ n: Int) -> Int {
        if n <= 2 {
            return 0
        }
        
        var notPrime = [Bool](repeatElement(true, count: n))
        var count = 0
        
        for i in 2..<n {
            if notPrime[i] {
                count += 1
                var j = 2
                while i * j < n {
                    notPrime[i * j] = false
                    j += 1
                }
            }
        }
        
        return count
    }
}
