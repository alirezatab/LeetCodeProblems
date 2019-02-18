

/*
 Runtime: 12 ms, faster than 100.00% of Swift online submissions for Nested List Weight Sum.
 Memory Usage: 19.4 MB, less than 100.00% of Swift online submissions for Nested List Weight Sum.
 */

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

class Solution {
    func depthSum(_ nestedList: [NestedInteger]) -> Int {
        var sum = 0
        
        func findTotalSum(_ list: [NestedInteger], _ depth: Int) {
            for item in list {
                if item.isInteger() {
                    let value = item.getInteger()
                    sum += (value*depth)
                } else {
                    findTotalSum(item.getList(), depth+1)
                }
            }
        }
        findTotalSum(nestedList, 1)
        return sum
        
    }
}
