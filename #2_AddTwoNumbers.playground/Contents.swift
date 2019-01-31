
//Definition for singly-linked list.
public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}

// solution one - need to clean it up and seperate it
class Solution {
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        if l1 == nil && l2 == nil {return nil}
        
        var newList: ListNode?
        var newListPtr: ListNode?
        var l1Ptr = l1
        var l2Ptr = l2
        
        while l1Ptr != nil || l2Ptr != nil {
            
            var val = Int()
            if l1Ptr != nil && l2Ptr != nil {
                val = l1Ptr!.val + l2Ptr!.val
            } else if l1Ptr != nil {
                val = l1Ptr!.val
            } else {
                val = l2Ptr!.val
            }
            
            var newNode = ListNode(val)
            newNode.next = nil
            
            if newList == nil {
                newList = newNode
                newListPtr = newList
            } else {
                newListPtr?.next = newNode
                newListPtr = newListPtr?.next
            }
            
            if val >= 10 {
                // devisible by 10
                let remainder = val%10
                let carryOver = val/10
                
                newNode.val = remainder
                
                if l1Ptr!.next == nil {
                    l1Ptr!.next = ListNode(carryOver)
                } else if l2Ptr!.next == nil {
                    l2Ptr!.next = ListNode(carryOver)
                } else {
                    l1Ptr!.next?.val += carryOver
                }
            }
            
            l1Ptr = l1Ptr?.next
            l2Ptr = l2Ptr?.next
        }
        
        return newList
    }
}
