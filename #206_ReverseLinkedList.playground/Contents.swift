/*
 Diagramming
 temp = 1
 temp.next = nil
 
 nodePtr = head
 inc pointer
 
 t->nil
 1  -> 2  -> 3->4->5->NULL
 Ptr
 
 t = 1
 previous
 1 -> nil  2  -> 3->4->5->NULL
 Ptr
 1 -> nil  2  3->4->5->NULL
 |         |     Ptr
 -----------
 previous
 2 -> 1 -> nil   3->4->5->NULL
 t               Ptr
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
    // recruisively
    func reverseListRecruisively(_ head: ListNode?) -> ListNode? {
        
        guard var prevPtr = head, prevPtr.next != nil else {
            return head
        }
        
        var nodePtr = head?.next
        prevPtr.next = nil
        var tempPtr = nodePtr
        
        func reverseListHelper(_ nodePtr: inout ListNode?, _ tempPtr: inout ListNode?, _ prevPtr: inout ListNode) {
            
            if tempPtr != nil {
                nodePtr = nodePtr?.next
                tempPtr!.next = prevPtr
                prevPtr = tempPtr!
                tempPtr = nodePtr
                
                reverseListHelper(&nodePtr, &tempPtr, &prevPtr)
            }
        }
        
        reverseListHelper(&nodePtr, &tempPtr, &prevPtr)
        
        return prevPtr
    }
    
    // iteratively
    func reverseListIteratively(_ head: ListNode?) -> ListNode? {
        guard var previousPtr = head, previousPtr.next != nil else {
            return head
        }
        
        var nodePtr = head?.next
        previousPtr.next = nil
        
        var tempNode: ListNode? = nodePtr
        
        while tempNode != nil {
            nodePtr = nodePtr?.next
            tempNode!.next = previousPtr
            previousPtr = tempNode!
            tempNode = nodePtr
        }
        
        return previousPtr
    }
}
