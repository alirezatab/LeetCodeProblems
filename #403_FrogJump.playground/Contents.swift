/*
 Runtime: 168 ms, faster than 75.00% of Swift online submissions for Frog Jump.
 Memory Usage: 7.8 MB, less than 75.00% of Swift online submissions for Frog Jump.
 */
class Solution1 {
    var dic = [Int:Int]() //To quickly find where to jump to
    var set = Set<String>() //To cache failed steps
    
    func canCross(_ stones: [Int]) -> Bool {
        for (i, val) in stones.enumerated() {
            dic[val] = i
        }
        
        // we can create the stoneMap this way
        // because each stone position will only exist under one index
        return canCross(stones, 0, 0)
    }
    
    private func canCross(_ stones: [Int],_ index: Int,_ distance: Int) -> Bool {
        //We want to use single cache,
        //so we need to remember two things
        //1. current index, 2. distance we jump from last index
        if index == stones.count-1 {return true}
        if set.contains("\(index)+\(distance)") {return false}
        guard index < stones.count else {return false}
        
        
        let k = stones[index]+distance
        for step in (k-1...k+1) {
            // with the stone map, it will be quick to check the next index we need to go to
            //nextIndex > index --> means cant go backward
            if let nextIndex = dic[step], nextIndex > index {
                if canCross(stones, nextIndex, stones[nextIndex]-stones[index]) {
                    return true
                }
            }
        }
        set.insert("\(index)+\(distance)")
        return false//index == stones.count-1
    }
}

/*
 Runtime: 924 ms, faster than 10.00% of Swift online submissions for Frog Jump.
 Memory Usage: 11.7 MB, less than 0.00% of Swift online submissions for Frog Jump.
 */

class Solution {
    func canCross(_ stones: [Int]) -> Bool {
        var jump:[Int:Set<Int>] = [0:[1]]
        for i in 0..<stones.count{
            if jump[stones[i]] == nil{
                continue
            }
            let steps = jump[stones[i]]!
            for step in steps{
                if stones[i] + step == stones.last{
                    return true
                }
                jump[stones[i]+step] = jump[stones[i]+step] ?? [step]
                if step-1 > 0{
                    jump[stones[i]+step]?.insert(step-1)
                }
                jump[stones[i]+step]?.insert(step)
                jump[stones[i]+step]?.insert(step+1)
            }
        }
        return false
    }
}
