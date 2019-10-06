/*
 create two ptr start and end both init at index 0
 spaceIndex init to 0
 var swapped = false
                                while loop end < str.count
 "Let's take LeetCode contest"  --> loop through till if you get to space or at end of array,
  s    |                                inc end
       e                                swapped = false
       |                            else
      e|                                sI = end
      sI                                dec end, cause end move to space
                                        swapped = true
 
                            for last item, cause end will go above str.count and break out of while loop, add a if stateent
                            if end >= str.count
                                spaceIndex = end
                                dec end
                                swapped = true
                                    
    need an inner while loop to start swapping characters
 Let's
 s   e              while swapped && start <= end {
 set'L                  do a swap of str at start and str at end
  s e                       inc start
 s'teL                      dec end
   s
   e
 
 s'teL            // this point break out od swap and reconfigure ptrs
  e s                   if start > end
                            start = spaceIndex+1
                            end = start
                            swapped = false // to break out of loop
    
 
 
 }
 */

class Solution {
    func reverseWords(_ s: String) -> String {
        var strArr = Array(s)
        if strArr.count == 0 {return ""}
        
        var spaceIndex = 0
        var start = 0
        var end = 0
        var swapped = false
        
        while end < strArr.count {
            // a function configureEndOfChar
            if strArr[end] != " " && end < strArr.count {
                end+=1
                swapped = false
                //print("before space ", end)
            } else {
                spaceIndex = end
                end-=1
                swapped = true
                //print("after space: ", end)
            }
            
            if end >= strArr.count {
                spaceIndex = end
                end -= 1
                swapped = true
            }
            
            while swapped && start<=end {
                (strArr[start], strArr[end]) = (strArr[end], strArr[start])
                //swap(&strArr[start],&strArr[end])
                start+=1
                end-=1
                
                if start > end {
                    start = spaceIndex+1
                    end = start
                    swapped = false
                }
            }
        }
        
        var reversedStr = String(strArr)
        return reversedStr
        
    }
}


/*
 Runtime: 140 ms, faster than 100.00% of Swift online submissions for Reverse Words in a String III.
 Memory Usage: 21.6 MB, less than 100.00% of Swift online submissions for Reverse Words in a String III.
 
 less verbose, faster cause of less constant values and the inner while loop cuases faster iterations
 */
class Solution1 {
    func reverseWords(_ s: String) -> String {
        var start = 0
        var end = 0
        var nextStart = 0
        
        var arr = Array(s)
        
        while end<arr.count {
            
            while arr[end] != " " {
                end += 1
                if end == arr.count {break}
            }
        
            nextStart = end+1
            end -= 1
            
            while start<=end {
                (arr[start], arr[end]) = (arr[end], arr[start])
                start+=1
                end-=1
            }
                        
            start = nextStart
            end = start
        }
            
        let finalStr = String(arr)
        return finalStr
    }
}
