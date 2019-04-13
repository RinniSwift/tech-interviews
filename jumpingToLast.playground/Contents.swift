import UIKit

/*
 
 Given an array of non-negative integers, you are initially positioned at the first index of the array.
 
 Each element in the array represents your maximum jump length at that position.
 
 Determine if you are able to reach the last index.
 
 Example 1:
 
 Input: [2,3,1,1,4]
 Output: true
 Explanation: Jump 1 step from index 0 to 1, then 3 steps to the last index.
 Example 2:
 
 Input: [3,2,1,0,4]
 Output: false
 Explanation: You will always arrive at index 3 no matter what. Its maximum
 jump length is 0, which makes it impossible to reach the last index.
 
 */

func jumpingBlocks(arr: [Int]) -> Bool {
    var setOfIndexes: Set<Int> = [0, 1]
    
    for (ind, num) in arr.enumerated() {
        if setOfIndexes.contains(ind) {
            for i in 0...num {
                setOfIndexes.insert(i + ind)
            }
        }
    }
    
    for num in setOfIndexes {
        if num < arr.count {
            if arr[num] + num >= arr.count - 1 {
                return true
            }
        }
    }
    
    return false
}
jumpingBlocks(arr: [1, 1, 2, 2, 0, 1, 0, 5])

/*
 explanation:
    add all possible indexes we can reach into a set.
    loop through the set, if the arr at that index in the set + itself >= last index. we know we can reach the last index.
 */
