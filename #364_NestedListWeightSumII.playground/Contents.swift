/**
 * // This is the interface that allows for creating nested lists.
 * // You should not implement it, or speculate about its implementation
 * class NestedInteger {
 *     // Return true if this NestedInteger holds a single integer, rather than a nested list.
 *     public func isInteger() -> Bool
 *
 *     // Return the single integer that this NestedInteger holds, if it holds a single integer
 *     // The result is undefined if this NestedInteger holds a nested list
 *     public func getInteger() -> Int
 *
 *     // Set this NestedInteger to hold a single integer.
 *     public func setInteger(value: Int)
 *
 *     // Set this NestedInteger to hold a nested list and adds a nested integer to it.
 *     public func add(elem: NestedInteger)
 *
 *     // Return the nested list that this NestedInteger holds, if it holds a nested list
 *     // The result is undefined if this NestedInteger holds a single integer
 *     public func getList() -> [NestedInteger]
 * }
 */

/*
 go once through the whole array and find the depth
 go again and do the multiplication but through the depth in reverse
 
 */

/*
 Runtime: 8 ms, faster than 100.00% of Swift online submissions for Nested List Weight Sum II.
 Memory Usage: 20.1 MB, less than 100.00% of Swift online submissions for Nested List Weight Sum II.
 */
class Solution {
    func depthSumInverse(_ nestedList: [NestedInteger]) -> Int {
        var finalDepth = 1
        func findDepth(_ list: [NestedInteger], _ depth: Int) {
            for item in list {
                if !item.isInteger() {
                    finalDepth = max(finalDepth, depth+1)
                    findDepth(item.getList(), depth+1)
                }
            }
        }
        
        findDepth(nestedList, 1)
        
        var sum = 0
        func findSum(_ list: [NestedInteger], _ depth: Int) {
            for item in list {
                if item.isInteger() {
                    let value = item.getInteger()
                    sum += value*depth
                } else {
                    findSum(item.getList(), depth-1)
                }
            }
        }
        
        findSum(nestedList, finalDepth)
        return sum
    }
    
    
}

