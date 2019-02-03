
class MinStack {
    
    var stack: [(val:Int, minVal:Int)]
    
    /** initialize your data structure here. */
    init() {
        self.stack = [(Int, Int)]()
    }
    
    func push(_ x: Int) {
        if stack.isEmpty {
            stack.append((x,x))
            return
        }
        let minVal = stack.last!.minVal
        if minVal > x {
            stack.append((x,x))
        } else {
            stack.append((x, minVal))
        }
    }
    
    func pop() {
        stack.removeLast()
    }
    
    func top() -> Int {
        return stack.last!.val
    }
    
    func getMin() -> Int {
        return stack.last!.minVal
    }
}

/**
 * Your MinStack object will be instantiated and called as such:
 * let obj = MinStack()
 * obj.push(x)
 * obj.pop()
 * let ret_3: Int = obj.top()
 * let ret_4: Int = obj.getMin()
 */

