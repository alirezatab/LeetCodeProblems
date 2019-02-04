/*
 brute force, check each day and all day in the future -- not realistic
 
 if negative prifit, skip --  id profit math is less than old profit
 max Profit = 0
 minBuy = 7
 maxSell = 7
 [7,1,5,3,6,4]
 min
 max
 
 max Profit = 4
 minBuy = 1
 maxSell = 5
 [7,1,5,3,6,4]
 min
 max
 
 max Profit = 5
 minBuy = 1
 maxSell = 6
 [7,1,5,3,6,4]
 min
 max
 
 
 init maxProfit = 0
 init minBuy = arr[0]
 
 loop through the arra 1..<arr.count
    if price is less than min buy
        update minBuy
    else
        figure out the profit
        if profit is more than maxProfit
            update maxProfit
 
 return maxProfit
 
 */

/*
 Runtime: 44 ms, faster than 100.00% of Swift online submissions for Best Time to Buy and Sell Stock.
 Memory Usage: 5.2 MB, less than 46.15% of Swift online submissions for Best Time to Buy and Sell Stock.
 */

class Solution {
    func maxProfit(_ prices: [Int]) -> Int {
        guard prices.count > 0 else {return 0}
        var minBuy = prices[0]
        var maxProfit = 0
        
        for i in 1..<prices.count {
            if prices[i] < minBuy {
                minBuy = prices[i]
            } else {
                let profit = prices[i] - minBuy
                if profit > maxProfit {
                    maxProfit = profit
                }
            }
        }
        return maxProfit
        
    }
}
