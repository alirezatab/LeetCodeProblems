
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


// Recrusion
/*
 Runtime: 20 ms, faster than 100.00% of Swift online submissions for Symmetric Tree.
 Memory Usage: 3.9 MB, less than 80.00% of Swift online submissions for Symmetric Tree.
 */
class Solution {
    func isSymmetric(_ root: TreeNode?) -> Bool {
        
        func isMirror(l: TreeNode?, r: TreeNode?) -> Bool {
            guard l != nil && r != nil else {return true}
            
            if l?.val != r?.val {
                return false
            }
            
            return isMirror(l: l?.left, r: r?.right) &&
                isMirror(l: l?.right, r: r?.left)
        }
        
        return isMirror(l: root, r: root)
    }
}

/*
 Runtime: 24 ms, faster than 35.96% of Swift online submissions for Symmetric Tree.
 Memory Usage: 3.9 MB, less than 100.00% of Swift online submissions for Symmetric Tree.
 
 only difference is removeFirst(above time) vs removeLast(below one)
 
 Runtime: 20 ms, faster than 100.00% of Swift online submissions for Symmetric Tree.
 Memory Usage: 3.9 MB, less than 66.67% of Swift online submissions for Symmetric Tree.
 */
//Iteratively
class Solution1 {
    func isSymmetric(_ root: TreeNode?) -> Bool {
        guard root != nil &&
            (root?.left != nil || root?.right != nil) else {return true}
        
        if root?.left?.val != root?.right?.val {
            return false
        }
        
        var stack = [TreeNode?]()
        stack.append(root?.left)
        stack.append(root?.right)
        
        while !stack.isEmpty {
            let node1 = stack.removeLast()
            let node2 = stack.removeLast()
            
            if node1?.left?.val != node2?.right?.val {
                return false
            }
            
            if node1?.left != nil && node2?.right != nil {
                stack.append(node1?.left)
                stack.append(node2?.right)
            }
            
            if node1?.right?.val != node2?.left?.val {
                return false
            }
            
            if node1?.right != nil && node2?.left != nil {
                stack.append(node1?.right)
                stack.append(node2?.left)
            }
        }
        
        return true
    }
}
