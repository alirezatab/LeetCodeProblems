/*
 Runtime: 580 ms, faster than 95.12% of Swift online submissions for Two Sum III - Data structure design.
 Memory Usage: 21.1 MB, less than 100.00% of Swift online submissions for Two Sum III - Data structure design.
 */

/*
 init a dictionary
 for every add, add the number and if it is a duplicate, inc its count
 
 add(1); add(3); add(5);
 
 k v
 1 1
 3 1
 5 1
 
 find(4) -> true
 find(7) -> false
 
 loop through the keys
 take 4.. find dif between key and 4
 dif = 4-1 = 3
 look though dic and see if 3 exits, return tru
 
 take 7...
 dif = 7-1 = 6, key 6 doesnt exist in dic, key 1
 dif = 7-3 - 4, key 4 doesnt exist in dic, key 3
 dif = 7-5 = 2, key 2 doesnt exist in dic, key 5
 
 so return false
 
 if duplicates, make sure the count of value is bigger than 1... same process as above
 */

class TwoSum {
    
    var dic: [Int:Int]!
    
    init() {
        self.dic = [Int:Int]()
    }
    
    /** Add the number to an internal data structure.. */
    func add(_ number: Int) {
        if let value = dic[number] {
            dic[number] = value + 1
        } else {
            dic[number] = 1
        }
    }
    
    /** Find if there exists any pair of numbers which sum is equal to the value. */
    func find(_ value: Int) -> Bool {
        guard !dic.isEmpty else {return false}
        
        for addedNum in dic.keys {
            let dif = value - addedNum
            
            if let freq = dic[dif] {
                if (addedNum == dif && freq>1) || (addedNum != dif) {
                    return true
                }
            }
        }
        return false
    }
}

/**
 * Your TwoSum object will be instantiated and called as such:
 * let obj = TwoSum()
 * obj.add(number)
 * let ret_2: Bool = obj.find(value)
 */
