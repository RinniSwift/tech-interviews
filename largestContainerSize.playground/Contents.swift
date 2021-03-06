import UIKit


/*
 
 
 given n non negative numbers, n representing the height of the block, find the largest container possible that can contain water and return the size of it. (w x h)
 
 e.g.
                         ___
 ___                     |  |
 |  |            ___     |  |
 |  |    ___     |  |    |  |
 |  |    |  |    |  |    |  |
 |  |    |  |    |  |    |  |
 |  |    |  |    |  |    |  |
 -----------------------------
 
 [5, 3, 4, 6] -> 15
 
 [6,6,6,6] -> 6
 
 */

/*
 check the greatest value in the index, get the next value that is less than the value and then
 see if there are more than two varuables that are that highest hegiht.
 create new variables which will cotain the next highest value
 compare the item in
 */


func calculateLargestContainer(blocks: [Int]) -> Int {
    
    let highestBlock: (Int, Int) = (blocks.max()!, blocks.index(of: blocks.max()!)!)
    var nextHighestBlock: (Int, Int) = (0, 0)
    
    for (index, height) in blocks.enumerated() {
        if height <= highestBlock.0 && height >= nextHighestBlock.0 {
            if index != highestBlock.1 {
                nextHighestBlock = (height, index)
            }
        }
    }
    
    let product = nextHighestBlock.0 * (abs(highestBlock.1 - nextHighestBlock.1))
    
    return product
}
calculateLargestContainer(blocks: [1, 3, 5, 6, 3, 7])
// edge case of the largest and the next largest number not creating the largest container
// e.g. [1, 4, 3, 2, 3, 5, 7] -> 9
//          ^           ^
// ?? create pointers that start from start and end. calculate the value, shifting left or right until it exceeds the largest size
//
// !! create 2 pointers, 1 at the very left, 2 at the next, check if index[2+1] is smaller than the block height, shift 2 pointer there, keep doing that until the next pointer from the 2 index is smaller. Then calculate the size and replace the result size if higher.

func calcLargestContainerSize(arr: [Int]) -> Int {
    var largestSize = 0
    
    var left = 0
    var right = 1
    
    while right < (arr.count  - 1) {
        if arr[right] <= arr[left] {
            if arr[right + 1] >= arr[right] {
                right += 1
            } else {
                
                if arr[right] > arr[left] {
                    let product = arr[left] * (right - left)
                    if product > largestSize {
                        largestSize = product
                    }
                } else {
                    let product = arr[right] * (right - left)
                    if product > largestSize {
                        largestSize = product
                    }
                }
                
                right += 1
                left += 1
            }
            
            if arr[right] > arr[left] {
                let product = arr[left] * (right - left)
                if product > largestSize {
                    largestSize = product
                }
            } else {
                let product = arr[right] * (right - left)
                if product > largestSize {
                    largestSize = product
                }
            }
        } else {
            right += 1
            left += 1
        }
    }
    
    return largestSize
}
calcLargestContainerSize(arr: [4, 3, 4, 4, 6, 7, 9])

/*
 explanation:
    start the left pointer at index 0 and right pointer at index 1
    increase the pointers if the item to the right of the array is larger or equal (meaning we can still create a container since it will be higher
    until the next item to the right is smaller, we calculate what we have and if it is larger than the largestContainer size, we update the variable
    if we hit the next one which is smaller, we calculate what we have right now and then update the right pointer to be left + 1 and the left pointer to be left + 2 if it does not go out of bounds
 
 */
