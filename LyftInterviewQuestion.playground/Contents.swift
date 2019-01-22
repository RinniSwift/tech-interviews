import UIKit

/*
 given an array, find the largest sum of a sequence
 */

func largestSumSequence(array: [Int]) -> Int {
    var currentLargest = array[0]
    var largest = array[0]
    for i in 1...(array.count - 1){
        currentLargest = max(currentLargest + array[i], array[i])
        if currentLargest > largest {
            largest = currentLargest
        }
    }
    return largest
}
largestSumSequence(array: [5, 3, -8, 2, 1])


/*
 given a matrix, return true if all the zeros are reachable
 */
