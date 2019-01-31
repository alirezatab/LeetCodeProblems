//
//  main.cpp
//  #237_DeleteNodeInLinkedList
//
//  Created by ALIREZA TABRIZI on 1/30/19.
//  Copyright © 2019 AR-T.com, Inc. All rights reserved.
//

#include <iostream>

//Definition for singly-linked list.
struct ListNode {
    int val;
    ListNode *next;
    ListNode(int x) : val(x), next(NULL) {}
};
 
 /*
 nodePtr
 node
 4 -> 5 -> 1 -> 9
 4 -> 1 -> 9 -> 9 copy value into nodePtr
 */

class Solution {
public:
    void deleteNode(ListNode* node) {
        while (node->next->next != NULL) {
            node->val = node->next->val;
            node = node->next;
        }
        
        // now at tail
        node->val = node->next->val;
        node->next = NULL;
    }
};

int main(int argc, const char * argv[]) {
    // insert code here...
    std::cout << "Hello, World!\n";
    return 0;
}
