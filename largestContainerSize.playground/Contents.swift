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
    
    // loop through the array, get the next highest number with the index
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
print(calculateLargestContainer(blocks: [1, 3, 5, 6, 3, 7]))
