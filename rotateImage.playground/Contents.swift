import UIKit

/*
 You are given an n x n 2D matrix representing an image.
 Rotate the image by 90 degrees (clockwise).
 
 Note: You have to rotate the image in-place, which means you have to modify the input 2D matrix directly. DO NOT allocate another 2D matrix and do the rotation.
 
 e.g.1
 [[1,2,3],
  [4,5,6],
  [7,8,9]]
 output:
 [[7,4,1],
  [8,5,2],
  [9,6,3]]
 
 
 e.g.2
 [[ 5, 1, 9,11],
  [ 2, 4, 8,10],
  [13, 3, 6, 7],
  [15,14,12,16]]
 output:
 [[15,13, 2, 5],
  [14, 3, 4, 1],
  [12, 6, 8, 9],
  [16, 7,10,11]]
 
 */

var matr = [
    [ 5, 1, 9,11],
    [ 2, 4, 8,10],
    [13, 3, 6, 7],
    [15,14,12,16]
]

func rotate(_ matrix: inout [[Int]]) -> [[Int]] {
    let initalMatrixCount = matrix.count - 1
    
    for row in 0...initalMatrixCount {
        var tempArr = [Int]()
        for ind in 0...initalMatrixCount {
            tempArr.append(matrix[initalMatrixCount - ind][row])
        }
        matrix.append(tempArr)
    }
    
    for _ in 0...initalMatrixCount {
        matrix.removeFirst()
    }
    
    return matrix
}

print(rotate(&matr))

// output:
// [[15, 13, 2, 5],
//  [14, 3, 4, 1],
//  [12, 6, 8, 9],
//  [16, 7, 10, 11]]
