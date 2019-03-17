/*
 Runtime: 16 ms, faster than 99.55% of Swift online submissions for Add Binary.
 Memory Usage: 19.3 MB, less than 100.00% of Swift online submissions for Add Binary.
 
 O(A+B)
 */

class Solution {
    func addBinary(_ a: String, _ b: String) -> String {
        guard a.count > 0 else {return b}
        guard b.count > 0 else {return a}
        
        var aPointer = a.count-1
        var bPointer = b.count-1
        var finalStr = ""
        var carry = 0
        
        while aPointer > -1 && bPointer > -1 {
            let aIndex = a.index(a.startIndex, offsetBy: aPointer)
            let bIndex = b.index(b.startIndex, offsetBy: bPointer)
            checkAndAddBinary(&carry, a[aIndex], b[bIndex], &finalStr)
            aPointer -= 1
            bPointer -= 1
        }
        
        while aPointer > -1 {
            let index = a.index(a.startIndex, offsetBy: aPointer)
            if carry == 1 && a[index] == "1" {
                finalStr.insert("0", at: finalStr.startIndex)
            } else if carry == 1 && a[index] == "0"  {
                carry = 0
                finalStr.insert("1", at: finalStr.startIndex)
            } else {
                //carry = 0
                finalStr.insert(a[index], at: finalStr.startIndex)
            }
            aPointer -= 1
        }
        
        while bPointer > -1 {
            let index = b.index(b.startIndex, offsetBy: bPointer)
            if carry == 1 && b[index] == "1" {
                finalStr.insert("0", at: finalStr.startIndex)
            } else if carry == 1 && b[index] == "0"  {
                carry = 0
                finalStr.insert("1", at: finalStr.startIndex)
            } else {
                //carry = 0
                finalStr.insert(b[index], at: finalStr.startIndex)
            }
            bPointer -= 1
        }
        
        if carry == 1 {
            carry = 0
            finalStr.insert("1", at: finalStr.startIndex)
        }
        
        return finalStr
    }
    
    func checkAndAddBinary(_ carry: inout Int, _ aChar: Character, _ bChar: Character, _ finalStr: inout String) {
        if aChar == "1" && bChar == "1" {
            if carry == 0 {
                carry = 1
                finalStr.insert("0", at: finalStr.startIndex)
            } else {
                finalStr.insert("1", at: finalStr.startIndex)
            }
        } else if aChar == "1" || bChar == "1" {
            if carry == 0 {
                finalStr.insert("1", at: finalStr.startIndex)
            } else {
                finalStr.insert("0", at: finalStr.startIndex)
            }
        } else { // both are zero
            if carry == 0 {
                finalStr.insert("0", at: finalStr.startIndex)
            } else {
                carry = 0
                finalStr.insert("1", at: finalStr.startIndex)
            }
        }
    }
}
