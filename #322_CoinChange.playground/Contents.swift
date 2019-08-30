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
