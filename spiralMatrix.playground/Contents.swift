import UIKit

/*
 Given a matrix of m x n elements (m rows, n columns), return all elements of the matrix in spiral order.
 
 Example 1:
 Input:
 [[ 1, 2, 3 ],
  [ 4, 5, 6 ],
  [ 7, 8, 9 ]]
 Output: [1,2,3,6,9,8,7,4,5]
 
 Example 2:
 Input:
 [[1, 2, 3, 4],
  [5, 6, 7, 8],
  [9,10,11,12]]
 Output: [1,2,3,4,8,12,11,10,9,5,6,7]
 
 1. create copy of the matrix, create a result array
 2. while the index is not out of bounds
     1. right: append all items in the top array and remove from the copied array
     2. down: append and remove all of the last items in the copied array
     3. left: append and remove all of the items in the lowest array in reverse
     4. up: append and remove all of the items in the first index of the arrays rows.
 */

func spiralMatrix(matrix: [[Int]]) -> [Int] {

    var copiedMatrix = matrix
    var spiralResult = [Int]()
    
    while copiedMatrix.count > 0 && copiedMatrix[0].count > 0 {
        // right
        spiralResult += copiedMatrix.removeFirst()
        guard copiedMatrix.count > 0 && copiedMatrix[0].count > 0 else {
            break
        }
        // down
        for row in 0...(copiedMatrix.count - 1) {
            spiralResult.append(copiedMatrix[row].removeLast())
        }
        guard copiedMatrix.count > 0 && copiedMatrix[0].count > 0 else {
            break
        }
        // left
        spiralResult += copiedMatrix.removeLast().reversed()
        guard copiedMatrix.count > 0 && copiedMatrix[0].count > 0 else {
            break
        }
        // up
        for row in stride(from: copiedMatrix.count - 1, to: 0, by: -1) {
            spiralResult.append(copiedMatrix[row].removeFirst())
        }
        guard copiedMatrix.count > 0 && copiedMatrix[0].count > 0 else {
            break
        }
    }
    
    return spiralResult
}
print(spiralMatrix(matrix: [[ 1, 2, 3 ],
                            [ 4, 5, 6 ],
                            [ 7, 8, 9 ]]))
