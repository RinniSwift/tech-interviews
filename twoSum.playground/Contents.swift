import UIKit


/*
 
 Given an array of integers, return true if there are numbers that add up to the target.
 You may assume that each input would have exactly one solution, and you may not use the same element twice.
 
 Given nums = [2, 7, 11, 15], target = 9
 output: true
 
 Clarifying Questions:
    . can there contain negative numbers? -- yes
    . can we use the same number twice? -- no
    . if we don't find any pairs that add up do we just return false
 
 */

func findTwoSum(arr: [Int], target: Int) -> Bool {
    
    var foundItems = Set<Int>()
    
    for num in arr {
        if foundItems.contains(num) {
            return true
        }
        let complement = target - num
        foundItems.insert(complement)
    }
    return false
}
findTwoSum(arr: [1, 5, -2, -2], target: -4)



/*
 
 Given an array of integers, return the 2 indexes such that both of the values add up to the target.
 You may assume that each input would have exactly one solution, and you may not use the same element twice.
 
 Given nums = [2, 7, 11, 15], target = 9
 output: [0, 1]
 
 Clarifying Questions:
 . can there contain negative numbers? -- yes
 . can we use the same number twice? -- no
 . if we don't find any pairs that add up do we just return an empty array? -- return nil if there are no pairs that add up
 
 */

func findIndexesTwoSum(arr: [Int], target: Int) -> [Int]? {
    
    // key: found number, value: number index
    var numWithInd = [Int: Int]()
    
    for (ind, num) in arr.enumerated() {
        let complement = target - num
        if numWithInd[complement] != nil {
            return [numWithInd[complement]!, ind]
        }
        numWithInd[num] = ind
    }
    
    
    return nil
    
}
findIndexesTwoSum(arr: [8, -2, -1, 2], target: -3)



/*
 
 Given an array of integers, return the all indexes in pairs such that the pairs values add up to the target.
 
 Given nums = [2, 7, 11, 15], target = 9
 output: [0, 1]
 
 Clarifying Questions:
 . can there contain negative numbers? -- yes
 . can we use the same number twice? -- no
 . if we don't find any pairs that add up do we just return an empty array? -- yes
 
 */

func findAllIndexes(arr: [Int], target: Int) -> [(Int, Int)] {
    
    var resultArr = [(Int, Int)]()
    var numWithInd = [Int: Int]()
    
    for (ind, num) in arr.enumerated() {
        
        let complement = target - num
        
        if numWithInd[complement] != nil {
            resultArr.append((ind, numWithInd[complement]!))
        }
        numWithInd[num] = ind
    }
    
    return resultArr
}
findAllIndexes(arr: [1, 2, 4, 3, -2, 0, 6, 8, 4], target: 6)

