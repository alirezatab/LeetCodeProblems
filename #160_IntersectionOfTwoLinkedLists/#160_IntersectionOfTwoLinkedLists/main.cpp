//
//  main.cpp
//  #160_IntersectionOfTwoLinkedLists
//
//  Created by ALIREZA TABRIZI on 8/29/19.
//  Copyright © 2019 ALIREZA TABRIZI. All rights reserved.
//

/*
    Runtime: 48 ms, faster than 81.43% of C++ online submissions for Intersection of Two Linked Lists.
    Memory Usage: 16.8 MB, less than 64.81% of C++ online submissions for Intersection of Two Linked Lists.
 
 Time: o(m+n)
 Space: o(1)
 */

#include <iostream>

// Definition for singly-linked list.
struct ListNode {
    int val;
    ListNode *next;
    ListNode(int x) : val(x), next(NULL) {}
};

class Solution {
public:
    ListNode *getIntersectionNode(ListNode *headA, ListNode *headB) {
        
        if (headA == NULL || headB == NULL) {
            return NULL;
        }
        
        ListNode *nodePtrA = headA;
        ListNode *nodePtrB = headB;
        
        while (nodePtrA != nodePtrB) {
            //nodePtrA = nodePtrA == NULL ? headB : nodePtrA->next;
            //nodePtrB = nodePtrB == NULL ? headA : nodePtrB->next;
            
            if (nodePtrA == NULL) {
                nodePtrA = headB;
            } else {
                nodePtrA = nodePtrA->next;
            }
            
            if (nodePtrB == NULL) {
                nodePtrB = headA;
            } else {
                nodePtrB = nodePtrB->next;
            }
        }
        
        return nodePtrA;
    }
};
