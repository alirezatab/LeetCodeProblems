package com;

public class _427ConstructQuadTree {
    /*
// Definition for a QuadTree node.
class Node {
    public boolean val;
    public boolean isLeaf;
    public Node topLeft;
    public Node topRight;
    public Node bottomLeft;
    public Node bottomRight;

    public Node() {}

    public Node(boolean _val,boolean _isLeaf,Node _topLeft,Node _topRight,Node _bottomLeft,Node _bottomRight) {
        val = _val;
        isLeaf = _isLeaf;
        topLeft = _topLeft;
        topRight = _topRight;
        bottomLeft = _bottomLeft;
        bottomRight = _bottomRight;
    }
};
*/

/*
            main grid
    (false, * or true or false)
           /    /     \     \
(T, 1 == T)   (F, *)  (T,T)  (T,T) --> when isleaf == true, nul
            /  / \  \                       children
      (T, F)(T,F)(T,T)(T,T)

create a helper function and start at 0,0 grid
    use a halving method to split nXn matrix into 4 euqal parts

    helper(grid, row = 0, col = 0, grid.length)

    func helper(gird, row, col, length) {
        if length == 1 { //base case
            return newNode(grid[row][col] == 1,isleaf: true, nul, nul, nul, nul)
        } else {
            topeLeft = helper(grid, row, col, length/2)
            topRight = helper(grid, row, col+length/2, length/2)
            bottomLeft = helper(grid, row+length/2, col, length/2)
            bottomRight = helper(grid, row+length/2, col+length/2, length)

            // so check if is a leaf or not
            1 1 vs 1 0
            1 1    1 0
            if topLeft.val == topRight.vall &&
                topRight.val == bottomLeft.val &&
                bottomLeft.val == bottomRight.val {
                    return new Node(topLeft.val, true,                                              null,null,nul,null)
                } else {
                    return new Node(true,false, topLeft, TopRight,                                      bottomLeft, bottomRight)
                }
        }
    }
*/

/*
Runtime: 1 ms, faster than 99.95% of Java online submissions for Construct Quad Tree.
Memory Usage: 39.6 MB, less than 98.55% of Java online submissions for Construct Quad Tree.
*/
 */

    class Solution {
        public Node construct(int[][] grid) {
            return helper(grid, 0, 0, grid.length);
        }

        private Node helper(int[][] grid, int row, int col, int length) {
            if (length == 1) { //base case
                return new Node(grid[row][col] == 1, true, null, null, null, null);
            } else {
                Node topLeft = helper(grid, row, col, length/2);
                Node topRight = helper(grid, row, col+length/2, length/2);
                Node bottomLeft = helper(grid, row+length/2, col, length/2);
                Node bottomRight = helper(grid, row+length/2, col+length/2, length/2);

                if (topLeft.isLeaf && topRight.isLeaf &&
                        bottomLeft.isLeaf && bottomRight.isLeaf &&
                        topLeft.val == topRight.val &&
                        topRight.val == bottomLeft.val &&
                        bottomLeft.val == bottomRight.val) {
                    return new Node(topLeft.val, true, null, null, null, null);
                } else {
                    return new Node(true, false, topLeft, topRight, bottomLeft, bottomRight);
                }

            }
        }
    }
}
