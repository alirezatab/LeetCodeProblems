class Solution {
    var cache = Set<String>() //To cache failed steps
    var stoneMap = [Int: Int]() //To quickly find where to jump to
    func canCross(_ stones: [Int]) -> Bool {
        for (i, val) in stones.enumerated() {
            stoneMap[val] = i
        }
        // we can create the stoneMap this way
        // because each stone position will only exist under one index
        return jump(stones, 0, 0)
    }
    
    private func jump(_ stones: [Int], _ ind: Int, _ distance: Int) -> Bool {
        if ind == stones.count - 1 { return true }
        if cache.contains("\(ind)+\(distance)") { return false }
        //We want to use single cache,
        //so we need to remember two things
        //1. current index, 2. distance we jump from last index
        if ind > stones.count - 1 { return false }
        
        for val in (stones[ind]+distance-1)...(stones[ind]+distance+1) {
            // with the stone map, it will be quick to check the next index we need to go to
            if let nextInd = stoneMap[val], nextInd > ind {
                if jump(stones, nextInd, stones[nextInd]-stones[ind]) {
                    return true
                }
            }
        }
        cache.insert("\(ind)+\(distance)")
        return false
    }
}
