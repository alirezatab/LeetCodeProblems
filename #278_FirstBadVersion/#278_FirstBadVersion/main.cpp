//
//  main.cpp
//  #278_FirstBadVersion
//
//  Created by ALIREZA TABRIZI on 3/18/19.
//  Copyright © 2019 AR-T.com, Inc. All rights reserved.
//

#include <iostream>

/*
 1,2,3,4,5     mid = 3
 G,G,G,B,B
 *         left = 4, right = 5
 
 1,2,3,4,5     mid = 4
 G,G,G,B,B
 *       left = 4, right = 4
 
 
 1 2 3 4 5 6 7 8 9  mid = 5
 G G G B B B B B B
 *          left = 1, right = 5
 
 1 2 3 4 5 6 7 8 9    mid = 3
 G G G B B B B B B
 *                left = 4, right = 5
 
 1 2 3 4 5 6 7 8 9    mid = 4
 G G G B B B B B B
 *              left = 4, right = 4
 
 do a binary search
 when a bad version is found, check one before it,
 if still bad version
 continue binary search
 
 */

/*
 o(1) space
 0(logN) time
 
 Runtime: 4 ms, faster than 100.00% of C++ online submissions for First Bad Version.
 Memory Usage: 8 MB, less than 81.10% of C++ online submissions for First Bad Version.
 */

// Forward declaration of isBadVersion API.
bool isBadVersion(int version);

class Solution {
public:
    int firstBadVersion(int n) {
        int left = 1;
        int right = n;
        while (left < right) {
            int mid = left + (right-left)/2;
            if (isBadVersion(mid)) {
                right =  mid;
            } else {
                left = mid+1;
            }
        }
        return right;
    }
};

int main(int argc, const char * argv[]) {
}
