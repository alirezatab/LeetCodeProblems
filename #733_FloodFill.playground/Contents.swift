/*
 image = [[1,1,1],
 [1,1,0],
 [1,0,1]]
 
 sr = 1, sc = 1, newColor = 2
 [[2,2,2],
 [2,2,0],
 [2,0,1]]
 
 
 start at image[sr][sc] -- save the color at that location -- change it to the new color
 look in 4 direction and if same number as the saved one, then change it to the new color --> do bound checking so it is not out of bound
 
 Output: [[2,2,2],
 [2,2,0],
 [2,0,1]]
 
 init a savedColor = image[sr][sc]
 change image[sr][sc] to the new color
 might need a copy of image cause its a let and not a var
 
 create recursion function(takes all the parameters are above)
 rec(image, sr, sc, newColor)
 // base case
 if image[sr][sc] != savedColor {
 return image
 }
 
 if sr+1 < image.count {
 rec(image, sr+1, sc, newColor)
 }
 
 if sr-1 > -1 {
 rec(image, sr-1, sc, newColor)
 }
 
 if sc+1 < image[sc].count {
 rec(image, sr, sc+1, newColor)
 }
 
 
 if sc-1 > -1 {
 rec(image, sr, sc-1, newColor)
 }
 */

/*
 Runtime: 64 ms, faster than 78.13% of Swift online submissions for Flood Fill.
 Memory Usage: 21.1 MB, less than 8.33% of Swift online submissions for Flood Fill.
 
 Time: o(n)
 space: recursion stack o(n) + swift had to create another copy of matrix so o(n+m)
 */

class Solution {
    func floodFill(_ image: [[Int]], _ sr: Int, _ sc: Int, _ newColor: Int) -> [[Int]] {
        let savedColor = image[sr][sc]
        var res = image
        
        if savedColor == newColor {return res}
        
        func floodFillImage(_ img: inout [[Int]], _ sr: Int, _ sc: Int, _ newColor: Int) {
            if img[sr][sc] != savedColor {
                return
            }
            
            img[sr][sc] = newColor
            
            if sr+1 < image.count {
                floodFillImage(&img, sr+1, sc, newColor)
            }
            
            if sr-1 > -1 {
                floodFillImage(&img, sr-1, sc, newColor)
            }
            
            if sc+1 < image[0].count {
                floodFillImage(&img, sr, sc+1, newColor)
            }
            
            if sc-1 > -1 {
                floodFillImage(&img, sr, sc-1, newColor)
            }
        }
        
        floodFillImage(&res, sr, sc, newColor)
        return res
    }
}
