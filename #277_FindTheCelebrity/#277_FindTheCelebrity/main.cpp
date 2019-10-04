//
//  main.cpp
//  #277_FindTheCelebrity
//
//  Created by ALIREZA TABRIZI on 10/3/19.
//  Copyright © 2019 ALIREZA TABRIZI. All rights reserved.
//

#include <iostream>

// Forward declaration of the knows API.
bool knows(int a, int b);

class Solution {
public:
    int findCelebrity(int n) {
        int celeb = 0;
            
        for (int i=1; i<n; i++) {
            if (knows(celeb, i)) {
                celeb = i;
            }
        }
        
        for (int i=0; i<n; i++) {
            if (celeb != i && (knows(celeb, i) || !knows(i, celeb))) {
                return -1;
            }
        }
        return celeb;
    }
};

int main(int argc, const char * argv[]) {
    
    return 0;
}
