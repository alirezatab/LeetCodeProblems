/*
init a var result.
 *          covert string to Int, if it is int, inc ptr... append char
"1.1.1.1"
  *          covert string to Int, if it is not int -> nil result
"1.1.1.1"       append([.])
*/

/*
Runtime: 8 ms, faster than 45.45% of Swift online submissions for Defanging an IP Address.
Memory Usage: 21 MB, less than 100.00% of Swift online submissions for Defanging an IP Address.
 
Time: o(N)
Space: o(N)
 
 can be done in place if address was passed by reference
*/

class Solution {
    func defangIPaddr(_ address: String) -> String {
        var result = String()
        
        for char in address {
            if let _ = Int("\(char)") {
                result.append(char)
            } else {
                result.append("[.]")
            }
        }
        
        return result
    }
}
