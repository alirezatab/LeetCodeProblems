class MyQueue {
    
    var stack: [Int]
    var stackQueue: [Int]
    
    /** Initialize your data structure here. */
    init() {
        self.stack = [Int]()
        self.stackQueue = [Int]()
    }
    
    /** Push element x to the back of queue. */
    func push(_ x: Int) {
        stack.append(x)
    }
    
    /** Removes the element from in front of queue and returns that element. */
    func pop() -> Int {
        
        if !stackQueue.isEmpty {
            return stackQueue.removeLast()
        }
        
        while !stack.isEmpty {
            let val = stack.removeLast()
            stackQueue.append(val)
        }
        return stackQueue.removeLast()
    }
    
    /** Get the front element. */
    func peek() -> Int {
        guard let val = stackQueue.last else {
            while !stack.isEmpty {
                let val = stack.removeLast()
                stackQueue.append(val)
            }
            return stackQueue.last ?? 0
        }
        return val
    }
    
    /** Returns whether the queue is empty. */
    func empty() -> Bool {
        return stackQueue.isEmpty && stack.isEmpty
    }
}

/**
 * Your MyQueue object will be instantiated and called as such:
 * let obj = MyQueue()
 * obj.push(x)
 * let ret_2: Int = obj.pop()
 * let ret_3: Int = obj.peek()
 * let ret_4: Bool = obj.empty()
 */

