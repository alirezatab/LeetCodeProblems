/*
 can be improved by using hasValues for index
 linkedList or buckets for collisions
 
 the better the hashKey, the less collision; hoever collisions will happen so needs to be handled
 
 this version is the
 */

/*
 Runtime: 572 ms, faster than 96.43% of Swift online submissions for Design HashMap.
 Memory Usage: 13.6 MB, less than 75.00% of Swift online submissions for Design HashMap.
 */

class MyHashMap {
    
    /** Initialize your data structure here. */
    var arr = [Int]()
    
    init() {
        
    }
    
    /** value will always be non-negative. */
    func put(_ key: Int, _ value: Int) {
        if key >= arr.count {
            arr += Array(repeating: -1, count: key-arr.count+1)
        }
        arr[key] = value
    }
    
    /** Returns the value to which the specified key is mapped, or -1 if this map contains no mapping for the key */
    func get(_ key: Int) -> Int {
        if key < arr.count {
            return arr[key]
        }
        return -1
    }
    
    /** Removes the mapping of the specified value key if this map contains a mapping for the key */
    func remove(_ key: Int) {
        if key < arr.count {
            arr[key] = -1
        }
    }
}

/**
 * Your MyHashMap object will be instantiated and called as such:
 * let obj = MyHashMap()
 * obj.put(key, value)
 * let ret_2: Int = obj.get(key)
 * obj.remove(key)
 */

