/*
 time: o(n) - need to go trhough all the elements at least once
 space: o(1) - since all swaps happen in place. no new list was created other than needing to update the head cause no inout
 
 Runtime: 8 ms, faster than 100.00% of Swift online submissions for Swap Nodes in Pairs.
 Memory Usage: 18.6 MB, less than 60.00% of Swift online submissions for Swap Nodes in Pairs.
 */

/*
 pre   cur  nN  temp
 1 -> 2-> 3 -> 4
 // swap happens
 1 <- 2 3 -> 4
 |______|
 
 pre  cur  nN   temp
 2 -> 1->  3 -> 4 -> nil
 // swap happens
 2 -> 1  3 <- 4  nil
 *  |____*____|
 *_______*
 */


//Definition for singly-linked list.
public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}

class Solution {
    func swapPairs(_ head: ListNode?) -> ListNode? {
        //guard head != nil else {return head}
        var duplicateHead = head
        
        var previousNode: ListNode? = nil
        var curNode = head
        var nextNode = curNode?.next
        var tempNode = nextNode?.next
        
        while curNode != nil && nextNode != nil {
            if curNode === duplicateHead {duplicateHead = nextNode}
            
            nextNode?.next = curNode
            curNode?.next = tempNode
            
            if previousNode != nil {
                previousNode?.next = nextNode
            }
            
            previousNode = curNode
            curNode = tempNode
            nextNode = curNode?.next
            tempNode = nextNode?.next
        }
        
        return duplicateHead
    }
}

/*
 Runtime: 8 ms, faster than 100.00% of Swift online submissions for Swap Nodes in Pairs.
 Memory Usage: 18.6 MB, less than 60.00% of Swift online submissions for Swap Nodes in Pairs.
 */

// recursive way - uses extra stack for memory.
// same time as iterative way
class Solution1 {
    func swapPairs(_ head: ListNode?) -> ListNode? {
        guard head != nil else {return head}
        var duplicateHead = head
        
        func swapPairs(_ prevNode: ListNode?, _ curNode: ListNode?,
                       _ nextNode: ListNode?, _ tempNode: ListNode?) {
            guard curNode != nil && nextNode != nil else {return}
            
            if curNode != nil && nextNode != nil {
                if curNode === duplicateHead {duplicateHead = nextNode}
                
                nextNode?.next = curNode
                curNode?.next = tempNode
                
                if prevNode != nil {
                    prevNode?.next = nextNode
                }
                
                swapPairs(curNode, tempNode, tempNode?.next, tempNode?.next?.next)
            }
        }
        
        swapPairs(nil, head, head?.next, head?.next?.next)
        
        return duplicateHead
    }
}


