//
//  main.cpp
//  #141_LinkedListCycle
//
//  Created by ALIREZA TABRIZI on 1/30/19.
//  Copyright © 2019 AR-T.com, Inc. All rights reserved.
//

#include <iostream>

//Definition for singly-linked list.
struct ListNode {
public:
    int val;
    ListNode *next;
    ListNode(int x) : val(x), next(NULL) {}
 };

class Solution {
public:
    bool hasCycle(ListNode *head) {
        if (head == NULL || head->next == NULL) {return false;}
        
        ListNode *slow = head;
        ListNode *fast = head->next;
        
        while (fast != NULL && fast->next != NULL) {
            
            slow = slow->next;
            fast = fast->next->next;
            
            if (slow == fast) {return true;}
        }
        return false;
    }
};

int main(int argc, const char * argv[]) {
    
}
