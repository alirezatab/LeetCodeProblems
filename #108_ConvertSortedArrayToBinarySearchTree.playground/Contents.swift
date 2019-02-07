/*
 V
 [-10,-3,0,5,9]  (arr.cout-1)/2 -- > find middle = 2
 /      \
 /   0    \
 [-10,-3]   / \  [5,9]  mid[10,-3] = 0 -- mid[5,9] = (3+4)/2 = 3
 *     -10  5  *
 /     \
 -3      9
 */


// Definition for a binary tree node.
public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init(_ val: Int) {
        self.val = val
        self.left = nil
        self.right = nil
    }
 }


//// both recrusive
// Time o(logN) cause it is like Binary search where it devides in half
// space o(N) for the recursion and the tree space it self. n+m mayb
/*
 Runtime: 36 ms, faster than 100.00% of Swift online submissions for Convert Sorted Array to Binary Search Tree.
 Memory Usage: 6 MB, less than 32.56% of Swift online submissions for Convert Sorted Array to Binary Search Tree.
 
 */

class Solution {
    func sortedArrayToBST(_ nums: [Int]) -> TreeNode? {
        guard nums.count > 0 else {return nil}
        
        
        func helper(_ start: Int, _ end: Int) -> TreeNode? {
            
            if start > end {
                return nil
            }
            let mid = start+(end-start)/2
            let node = TreeNode(nums[mid])
            
            node.left = helper(start, mid-1)
            node.right = helper(mid+1, end)
            
            return node
        }
        
        return helper(0, nums.count-1)
    }
}

// slower than above cause not  of all array creation and reursive calls
// worse space cause for every recursion call, we use stack, new array and a treeSpace
/*
 Runtime: 40 ms, faster than 53.92% of Swift online submissions for Convert Sorted Array to Binary Search Tree.
 Memory Usage: 6.1 MB, less than 0.00% of Swift online submissions for Convert Sorted Array to Binary Search Tree.
 */

class Solution1 {
    func sortedArrayToBST(_ nums: [Int]) -> TreeNode? {
        guard nums.count > 0 else {return nil}
        
        let mid = (nums.count-1)/2
        let node = TreeNode(nums[mid])
        
        node.left = sortedArrayToBST(Array(nums[0..<mid]))
        node.right = sortedArrayToBST(Array(nums[mid+1..<nums.count]))
        
        return node
    }
}
