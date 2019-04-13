import UIKit

/*
 Given an array of integers nums sorted in ascending order, find the starting and ending position of a given target value.
 
 runtime must be o(log(n))
 if not found, return [-1, -1]
 
 e.x.
 1.
 Input: nums = [5,7,7,8,8,10], target = 8
 Output: [3,4]
 2.
 Input: nums = [5,7,7,8,8,10], target = 6
 Output: [-1,-1]
 
 */

// binary search
// if middle value larger, search within the left portion
// if middle value smalle, search within the right portion

func firstLastIndexOfTarget(arr: [Int], target: Int) -> [Int] {
    
    var left = 0
    var right = arr.count - 1
    
    
    while left <= right {
        let median = (left + right) / 2

        if arr[median] == target {
            var foundLeft = median
            var foundRight = median
            while arr[foundLeft - 1] == target {
                foundLeft -= 1
            }
            while arr[foundRight + 1] == target {
                foundRight += 1
            }
            return [foundLeft, foundRight]
        }
        
        if arr[median] > target {
            // look at the left
            right = median - 1
        } else {
            // look at the right
            left = median + 1
        }
    }
    return [-1, -1]
}

firstLastIndexOfTarget(arr: [5,7,7,8,8,10], target: 7)
