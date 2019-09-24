/**
 * Your MedianFinder object will be instantiated and called as such:
 * let obj = MedianFinder()
 * obj.addNum(num)
 * let ret_2: Double = obj.findMedian()
 */

/*
 Runtime: 584 ms, faster than 95.00% of Swift online submissions for Find Median from Data Stream.
 Memory Usage: 23.3 MB, less than 100.00% of Swift online submissions for Find Median from Data Stream.
 
 Time: add -> log n -> Binary Search and insert
    find -> o(1)
 Space: o(n) -> for array
 */

class MedianFinder {

    /** initialize your data structure here. */
    var arr: [Int]
    init() {
        self.arr = [Int]()
    }
    
    func addNum(_ num: Int) {
        if arr.isEmpty {
            arr.append(num)
            return
        }

        var start = 0, end = arr.count - 1
        while start <= end {
            let mid = start + (end - start)/2
            if num > arr[mid] {
                start = mid + 1
            } else if num < arr[mid] {
                end = mid - 1
            } else {
                start = mid
                break
            }
        }

        arr.insert(num, at: start)
    }
    
    func findMedian() -> Double {
        if arr.count%2 == 0 {
            let upper = arr.count/2
            let lower = upper-1
            
            return Double((arr[lower]+arr[upper]))/2
            
        } else {
            return Double(arr[arr.count/2])
        }
        
    }
}
