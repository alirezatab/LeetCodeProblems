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
//////////////////////////////////////////
//////////////// TRY 1 ///////////////////
//////////////////////////////////////////
/* iteretavelty
 Time: o(N) - we visit all the nodes at least once
 space: o(1)
 
 Runtime: 8 ms, faster than 100.00% of Swift online submissions for Binary Tree Upside Down.
 Memory Usage: 19.2 MB, less than 50.00% of Swift online submissions for Binary Tree Upside Down.
 */
class Solution1 {
    func upsideDownBinaryTree(_ root: TreeNode?) -> TreeNode? {
        guard root != nil, root?.left != nil else {return root}
        
        var cur = root
        var prev: TreeNode?
        var next: TreeNode?
        var right: TreeNode?
        
        while cur != nil {
            next = cur?.left
            cur?.left = right
            
            right = cur?.right
            cur?.right = prev
            
            prev = cur
            cur = next
        }
        return prev
    }
}

//////////////////////////////////////////
//////////////// TRY 2 ///////////////////
//////////////////////////////////////////
/*
        1
       / \
      2   3
     / \
    4   5
 
 recrusively go left till root!= nil and root.left!= nil
 
        1
       / \
      2   3
     / \
  ->4   5     root!=nil but the child is nil... so we return 4 and save it in res.
 
        1
       / \
    ->2   3
     / \
    4   5    from stack, pointer is at 2(as the root)
 so assign a new pointer to left child and right child of root(2)
 
        1
       / \
    ->2   3
     /
    4--5
 then assign lefts left to right, leftright to parent root
 
 do this recrusively should have the tree reveresed
 */

/* recrusiely
 Time: o(N) - we visit all the nodes at least once
 space: o(N) - cause of the recrusive call / stack being used
 
 Runtime: 8 ms, faster than 100.00% of Swift online submissions for Binary Tree Upside Down.
 Memory Usage: 19 MB, less than 50.00% of Swift online submissions for Binary Tree Upside Down.
 */
class Solution2 {
    func upsideDownBinaryTree(_ root: TreeNode?) -> TreeNode? {
        guard root != nil, root?.left != nil else {return root}
        
        let res = upsideDownBinaryTree(root!.left)
        print(res?.val)
        let leftNode = root?.left
        let rightNode = root?.right
        
        leftNode?.left = rightNode
        leftNode?.right = root
        
        root?.left = nil
        root?.right = nil
        
        return res
    }
}
