/*
 Time: o(N) - go through every node
 space: o(N) - recrusive call using stack
 
 Runtime: 8 ms, faster than 100.00% of Swift online submissions for Find Leaves of Binary Tree.
 Memory Usage: 19.4 MB, less than 100.00% of Swift online submissions for Find Leaves of Binary Tree.
 */

/*
            1-> h=2
           / \
    h=1 <-2   3-> h=0
         / \
  h=0 <-4   5-> h=0
 
 idea is to gather height of zeros and push them in resut array. h can be used as index
 
 
 recrusively get height.
 use height values to decide how many inner arrays
 needs to be appended to the resule Array.
 
 append the values to the innerArrays based on height and Node.Value
 */

/**
 * Definition for a binary tree node.
 */
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

class Solution {
    func findLeaves(_ root: TreeNode?) -> [[Int]] {
        var res = [[Int]]()
        
        func treeHeight(_ node: TreeNode?) -> Int {
            guard node != nil else {return -1}
            
            let height = max(treeHeight(node?.left), treeHeight(node?.right)) + 1
            if height == res.count {
                res.append([])
            }
            
            res[height].append(node!.val)
            return height
        }
        
        treeHeight(root)
        return res
    }
}
