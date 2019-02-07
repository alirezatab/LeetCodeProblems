/*
 using internal flatMap function gave best result
    Runtime: 232 ms, faster than 66.67% of Swift online submissions for Flatten 2D Vector.
    Memory Usage: 6.6 MB, less than 100.00% of Swift online submissions for Flatten 2D Vector.
*/
class Vector2D {
    
    var i = 0
    var flattenArr = [Int]()
    
    init(_ v: [[Int]]) {
        self.flattenArr = v.flatMap{$0}
    }
    
    func next() -> Int {
        let val = flattenArr[i]
        i+=1
        return val
    }
    
    func hasNext() -> Bool {
        if i >= flattenArr.count {
            return false
        }
        return true
    }
}

/*
 
 probably test issues
 
 Runtime: 292 ms, faster than 0.00% of Swift online submissions for Flatten 2D Vector.
 Memory Usage: 6.5 MB, less than 100.00% of Swift online submissions for Flatten 2D Vector.
 */


class Vector2D_1 {
    
    var i = 0
    var flattenArr = [Int]()
    
    init(_ v: [[Int]]) {
        flatten(v)
    }
    
    func next() -> Int {
        let val = flattenArr[i]
        i+=1
        return val
    }
    
    func hasNext() -> Bool {
        if i >= flattenArr.count {
            return false
        }
        return true
    }
    
    private func flatten(_ array: [[Int]]) {
        for arr in array {
            for element in arr {
                flattenArr.append(element)
            }
        }
    }
}

/*
 
 probably test issues
 
 Runtime: 336 ms, faster than 0.00% of Swift online submissions for Flatten 2D Vector.
 Memory Usage: 6.6 MB, less than 100.00% of Swift online submissions for Flatten 2D Vector.
 */

class Vector2D_2 {
    
    var vector2D = [[Int]]()
    var row: Int
    var col: Int
    
    init(_ v: [[Int]]) {
        self.vector2D = v
        self.row = 0
        self.col = 0
    }
    
    func next() -> Int {
        let val = vector2D[row][col]
        col += 1
        if col == vector2D[row].count {
            col = 0
            row += 1
        }
        
        return val
    }
    
    func hasNext() -> Bool {
        print("here")
        if row == vector2D.count {
            return false
        } else {
            if col == vector2D[row].count {
                col = 0
                row += 1
            } else {
                return true
            }
            return hasNext()
        }
    }
}

/**
 * Your Vector2D object will be instantiated and called as such:
 * let obj = Vector2D(v)
 * let ret_1: Int = obj.next()
 * let ret_2: Bool = obj.hasNext()
 */
