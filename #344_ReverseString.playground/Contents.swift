class Solution {
    
    // code should work with [String] on playground but not in Leetcode cause compiler crashes
    //func reverseString(_ s: inout [Character]) {
    func reverseString(_ s: inout [String]) {

        var startIndex = 0
        var endIndex = s.count-1
        
        while startIndex < endIndex {
            swap(&s,startIndex, endIndex)
            startIndex += 1
            endIndex -= 1
        }
        
    }
    
    func swap(_ s: inout [Character], _ startIndex: Int, _ endIndex: Int) {
        let temp = s[startIndex]
        s[startIndex] = s[endIndex]
        s[endIndex] = temp
    }
}
