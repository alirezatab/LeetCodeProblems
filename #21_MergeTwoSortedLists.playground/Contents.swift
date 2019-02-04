/*
                1->2->4,
               /^
        prevPtr           nil->1->nil
 prevNode = Node(-1)
 prevPtr = prevNode
                1->3->4
                   ^
 
 
                1->2->4,
                ^
        prevPtr          nil->1->1 ->nil
            \
             1->3->4
             ^
 
                1->2->4,
                  /^
            prevPtr           nil->1->1->2->nil

                1->3->4
                   ^
 ...
 
                1->2->4,
                      ^
                        nil->1->1->2->3->4->nil
                1->3->4
                      ^
 
                1->2->4,
                        ^
 sinde l2 is still not nill. just add it to the prevPtr.net nil->1->1->2->3->4->4
                1->3->4
                      ^
 
 return prevNode.next
 
 
 create var prevNode(-1)
 create var prevPtr = prevNode
 // below copy of l1, l2 cause function is let and not pass by reference
 var cur1 = l1
 var cur2 = l2
 
 loop through array till 1l and l2 are not nil
    check value of c1 vs c2. if c1 < c2
        prevPtr next to c1
        move c1 to next
    else
        more prePtr next to c2
        move c2 to next
 
    if c1 is nil
        prev next is c2
    else
        prev.next is c1
 
    return prevNode.next
 */


/*
 // done iterativeley
 Runtime: 20 ms, faster than 100.00% of Swift online submissions for Merge Two Sorted Lists.
 Memory Usage: 3.9 MB, less than 23.08% of Swift online submissions for Merge Two Sorted Lists.
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
    func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        guard l1 != nil else {return l2}
        guard l2 != nil else {return l1}
        
        let prevNode = ListNode(-1)
        var prevPtr: ListNode? = prevNode
        var cur1 = l1
        var cur2 = l2
        
        while cur1 != nil && cur2 != nil {
            if cur1!.val <= cur2!.val {
                prevPtr?.next = cur1
                cur1 = cur1!.next
            } else {
                prevPtr?.next = cur2
                cur2 = cur2!.next
            }
            prevPtr = prevPtr?.next
        }
        
        if cur1 == nil {
            prevPtr?.next = cur2
        } else {
            prevPtr?.next = cur1
        }
        
        return prevNode.next
    }
}

/*
 Runtime: 20 ms, faster than 100.00% of Swift online submissions for Merge Two Sorted Lists.
 Memory Usage: 3.9 MB, less than 15.38% of Swift online submissions for Merge Two Sorted Lists.
 */
// recruisevly
class Solution1 {
    func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        guard l1 != nil else {return l2}
        guard l2 != nil else {return l1}
        
        if l1!.val <= l2!.val {
            l1!.next = mergeTwoLists(l1!.next, l2)
            return l1
        } else {
            l2!.next = mergeTwoLists(l1, l2!.next)
            return l2
        }
    }
}
