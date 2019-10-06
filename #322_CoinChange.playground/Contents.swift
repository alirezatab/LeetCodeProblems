/*
1+1+1+1+1+1+1+1+1+1+1
2+2+2+2+1+1+1
2+2+2+2+2+1
5+5+1


    maxCount = infinit
increase MC after each recursive call
    each call, loop through all of the coins
if sum is negative, return -1, if zero, return 0
                    11
                  /  |\
                 10
                /|\
               9 8 5
              / /|\
             8   6 3
            /     /|\
           7       1 -2
          /
         6
        /
       5
      /
     4
    /
   3
  /
 2
/
1
|
0

so from the tree, we can do top down, use memoization to make it faster
*/

/*
 Runtime: 1396 ms, faster than 11.06% of Swift online submissions for Coin Change.
 Memory Usage: 23.2 MB, less than 33.33% of Swift online submissions for Coin Change.
 
 Time complexity : O(S∗n). where S is the amount, n is denomination count. In the worst case the recursive tree of the algorithm has height of S and the algorithm solves only S subproblems because it caches precalculated solutions in a table. Each subproblem is computed with n iterations, one by coin denomination. Therefore there is O(S∗n) time complexity.
 Space complexity : O(S), where S is the amount to change We use extra space for the memoization table.
 */


// Dynamic programming with memoization (Top-down)
class Solution {
    func coinChange(_ coins: [Int], _ amount: Int) -> Int {
         
        guard coins.count > 0 else { return 0 }
        guard amount > 0 else { return amount }
        
        var memo = [Int: Int]()
         
        func recrusive(_ sum: Int) -> Int {
            // base case
            if memo[sum] != nil {return memo[sum]!}
            if sum < 0 { return -1 }
            if sum == 0 { return 0 }

            var finalMin = Int.max-1

            for coin in coins {
                let localMin = recrusive(sum-coin)
                if localMin >= 0 {
                    finalMin = min(finalMin, localMin)
                }
            }
    
            memo[sum] = finalMin+1
            return memo[sum]!
        }
                
        recrusive(amount)
                
        return memo[amount] == Int.max ? -1 : memo[amount]!
    }
}

/*
    coins [1,2,5]
    Tabluation
    [0,1,2,3,4,5,6,7,8,9,10,11] array size
    [0,1,1,2,2,1,2,2,3,3,2,2] (index-coin) need to be above 0 - grab value there and add one to it
 
 option 1:
 Runtime: 116 ms, faster than 94.89% of Swift online submissions for Coin Change.
 Memory Usage: 21 MB, less than 33.33% of Swift online submissions for Coin Change.
 
 option 2:
 Runtime: 76 ms, faster than 100.00% of Swift online submissions for Coin Change.
 Memory Usage: 20.8 MB, less than 33.33% of Swift online submissions for Coin Change.
 
 Time: O(S∗n). On each step the algorithm finds the next F(i) in n iterations, where 1≤i≤S. Therefore in total the iterations are S∗n.
 Space: O(n). We use extra space for the memoization array.
*/

class Solution1 {
    func coinChange(_ coins: [Int], _ amount: Int) -> Int {
        //repeat can be Int.max
        guard amount > 0 else {return 0}
        var resultArray = [Int](repeating: amount+1, count: amount+1)
        
        resultArray[0] = 0
        
        for coin in coins {
            for i in 1...amount {
                if i >= coin {
                    // Option 1: slower a bit
                    // let minVal = min(resultArray[i-coin]+1, resultArray[i])
                    // resultArray[i] = minVal
                    
                    // Option 2: faster a bit
                    if resultArray[i-coin] < resultArray[i] {
                        resultArray[i] = resultArray[i-coin] + 1
                    }
                }
            }
        }
        
        return resultArray[amount] == amount+1 ? -1 : resultArray[amount]
    }
}

// Dynamic programming with memoization (Top-down)
// another way to do it
class Solution3 {
    func coinChange(_ coins: [Int], _ amount: Int) -> Int {
        guard coins.count > 0 else { return 0 }
        guard amount > 0 else { return amount }
        
        var total = amount
        var dic = [Int: Int]()
        
        func figureOutMinCoin(_ total: Int) -> Int {
            if total == 0 { return 0 }
            if let minCoinReq = dic[total] {
                return minCoinReq
            }
            
            var minVal = Int.max

            for coin in coins {
                if coin <= total {
                    let possibleMinVal = figureOutMinCoin(total-coin)
                    if possibleMinVal < minVal {
                        minVal = possibleMinVal + 1
                    }
                }
            }
            
            dic[total] = minVal
            return minVal
        }

        let minCoin = figureOutMinCoin(total)
        return minCoin == Int.max ? -1 : minCoin
    }
}
