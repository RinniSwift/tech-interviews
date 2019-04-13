import UIKit

/*
 Given an array of integers, return bool or indices of numbers that add up to the target.
 You may assume that each input would have exactly one solution, and you may not use the same element twice.
 
 Given nums = [2, 7, 11, 15], target = 9,
 */

// return bool if 2 numbers add up to the target
func findTwoSum(arr: [Int], target: Int) -> Bool {
    
    var foundItems = Set<Int>()
    
    for num in arr {
        if foundItems.contains(num) {
            return true
        } else {
            let complement = target - num
            foundItems.insert(complement)
        }
    }
    return false
}
findTwoSum(arr: [1, 3, 5, 3], target: 8)


// return index of 2 numbers that add up to the target
func findIndexesTwoSum(arr: [Int], target: Int) -> [Int] {
    var indexes = [Int]()
    var dict = [Int: (Int, Int)]()
    
    for (index, number) in arr.enumerated() {
        let complement = target - number
        if dict.keys.contains(complement) {
            indexes.append(dict[complement]!.0)
            indexes.append(index)
            return indexes
        } else {
            dict[number] = (index, complement)
        }
    }
    
    return indexes
}
findIndexesTwoSum(arr: [8, 0], target: 8)

// returns all indexes of 2 numbers that add up to the target
func findAllIndexes(arr: [Int], target: Int) -> [(Int, Int)] {
    var allIndexes = [(Int, Int)]()
    var dict = [Int: Int]()
    
    for (ind, number) in arr.enumerated() {
        let complement = target - number
        if dict.keys.contains(complement) {
            allIndexes.append((dict[complement]!, ind))
        } else {
            dict[number] = ind
        }
    }
    
    return allIndexes
    
}
print(findAllIndexes(arr: [1, 2, 4, 3, 8, 0, 6, -2], target: 6))
