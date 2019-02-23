/*
 Runtime: 48 ms, faster than 95.18% of Swift online submissions for Path Sum.
 Memory Usage: 19.4 MB, less than 26.92% of Swift online submissions for Path Sum.
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
 
class Solution {
    func hasPathSum(_ root: TreeNode?, _ sum: Int) -> Bool {
        guard root != nil else {return false}
        
        var stack = [(node: TreeNode?, s: Int)]()
        stack.append((node: root, s: root!.val))
        
        while !stack.isEmpty {
            let item = stack.removeLast();
            let pathSum = item.s
            let node = item.node!
            
            if pathSum == sum && node.left == nil && node.right == nil {
                return true
            }
            
            if node.left != nil {
                stack.append((node: node.left, s: pathSum + node.left!.val))
            }
            if node.right != nil {
                stack.append((node: node.right, s: pathSum + node.right!.val))
            }
        }
        return false;
    }
}
