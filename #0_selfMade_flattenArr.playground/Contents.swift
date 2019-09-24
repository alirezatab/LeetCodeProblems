import Cocoa

//[1] -> [Int]
//[1,2,3] -> [1,2,3]
//[1,[2]] -> [1,2]
//[1,[2,[3]]] -> [1,2,3]
//[1,[2,[[3,4]]]] -> [1,2,3]

// goes 7 times with in the for loop. so twice the array 2n, o(n)
/*
 var res = [Int]()
 func flattenArray(nestedArr: [Any]) -> [Int] {
 for element in nestedArr {
 //print("here")
 if element is Int {
 res.append(element as! Int)
 } else if element is [Any] {
 //print("before recrusion")
 flattenArray(nestedArr: element as! [Any])
 //print("after recrusion")
 }
 }
 return res
 }
 
 print(flattenArray(nestedArr: [1,[2,[3,4],[5,6]]]))
 */


// i would say n2 cause of recrusion and for loop
func flattenArray1(nestedArr: [Any]) -> [Int] {
    
    var res = [Int]()
    for element in nestedArr {
        //print("here1")
        if element is Int {
            res.append(element as! Int)
        } else {
            //print("before recrusion")
            let recursionResult = flattenArray1(nestedArr: element as! [Any])
            //print("after recrusion")
            for num in recursionResult {
                //print("here 2")
                res.append(num)
            }
        }
    }
    return res
}

print(flattenArray1(nestedArr: [1,[2,[[3,4]]]]))




