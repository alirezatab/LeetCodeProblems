/*                  mergeSort
                        [1,4,2,6,8,5,9,0,3,7]
                          /         \
                         /           \
                [1,4,2,6,8]        [5,9,0,3,7]
                    /\                   /\
                   /  \                 /  \
             [1,4,2]  [6,8]        [5,9,0] [3,7]
 ...
            till you have 1 element, then start comparing values and entering
        [1,4] [2]   [6,8]       [5,9] [0]   [3,7]
 
    [1,4] [2]       temp[1]
     ^     ^
 
    [1,4] [2]       temp[1, 2]
       ^   ^
 
    [1,4] [2]       temp[1, 2] --> merge first while loop breaks
       ^      ^
 
 */

func merge(_ arr: inout [Int], _ start: Int, _ middle: Int, _ end: Int){
    let leftSubarray = Array(arr[start...middle])
    let rightSubarray = Array(arr[middle+1...end])
    
    var index = start
    var leftIndex = 0
    var rightIndex = 0
    
    while leftIndex < leftSubarray.count && rightIndex < rightSubarray.count {
        if leftSubarray[leftIndex] <= rightSubarray[rightIndex] {
            arr[index] = leftSubarray[leftIndex]
            leftIndex+=1
        } else {
            arr[index] = rightSubarray[rightIndex]
            rightIndex+=1
        }
        index+=1
    }
    while leftIndex < leftSubarray.count {
        arr[index] = leftSubarray[leftIndex]
        leftIndex+=1
        index+=1
    }
    while rightIndex < rightSubarray.count {
        arr[index] = rightSubarray[rightIndex]
        rightIndex+=1
        index+=1
    }
}

func mergeSort(_ arr: inout [Int], _ start: Int, _ end: Int) {
    
    if start >= end {return}
    
    let mid = start+(end-start)/2

    mergeSort(&arr, start, mid)
    mergeSort(&arr, mid+1, end)
    merge(&arr, start, mid, end)
}

var arr = [1,4,2,6,8,5,9,0,3,7]
mergeSort(&arr, 0, arr.count-1)
print(arr)

