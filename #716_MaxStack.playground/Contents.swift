/*
 0(1)Time all operations Time except popMax
 0(N)Time for popMax
 
 o(N)Space
 
 Runtime: 348 ms, faster than 84.62% of Swift online submissions for Max Stack.
 Memory Usage: 20.4 MB, less than 50.00% of Swift online submissions for Max Stack.
 */

class MaxStack {
    
    /** initialize your data structure here. */
    var stack: [Int]
    var maxStack: [Int]
    
    init() {
        self.stack = []
        self.maxStack = []
    }
    
    func push(_ x: Int) {
        stack.append(x)
        if maxStack.isEmpty || x > peekMax() {
            maxStack.append(x)
        } else {
            maxStack.append(peekMax())
        }
    }
    
    func pop() -> Int {
        maxStack.removeLast()
        return stack.removeLast()
    }
    
    func top() -> Int {
        //guard stack.last else {return} should be optional Int for return type
        return stack.last!
    }
    
    func peekMax() -> Int {
        //guard maxStack.last else {return} should be optional Int for return type
        return maxStack.last!
    }
    
    func popMax() -> Int {
        
        var tempStack = [Int]()
        let maxVal = peekMax()//maxStack.removeLast()
        
        while maxVal != top() {
            tempStack.append(pop())
        }
        
        pop()
        
        while !tempStack.isEmpty {
            push(tempStack.removeLast())
        }
        return maxVal
    }
}

/**
 * Your MaxStack object will be instantiated and called as such:
 * let obj = MaxStack()
 * obj.push(x)
 * let ret_2: Int = obj.pop()
 * let ret_3: Int = obj.top()
 * let ret_4: Int = obj.peekMax()
 * let ret_5: Int = obj.popMax()
 */

