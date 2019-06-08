
/*
 
 - Problem
 
 There are two sorted arrays nums1 and nums2 of size m and n respectively.
 Find the median of the two sorted arrays.
 You may assume nums1 and nums2 cannot be both empty.
 e.g. [1, 2], [3, 4] -> (2 + 3) / 2 = 2.5
      [1, 2], [3] -> 2
 
 
 1. - Restating the problem
 
 So this function should take in 2 parameters which are arrays of integers that are sorted. And I should return the median of both the arrays. And median meaning the value that is in the middle of the structure so in this case would be both the arrays combined in sorted order.
 
 
 2. - Ask clarifying questions
 
 . Are all the numbers positive integers? (no)

 
 3. - Assumptions on the question
 
 . I assume there can be an empty input array (yes)

 
 4. - Think out loud
 
 . The solution I came up with was to check the last and first values of each input array, and check if they align perfectly to be sorted when they are combined together. If so, get the total count of items in the array and index them. If not, then check the one that starts lower and indicate how many elements added and the index.
 
 . join the two arrays together with merge sort and then get the middle index
 
 */

// 5. - Implementation

func medianOfTwoArr(nums1: [Int], nums2: [Int]) -> Double? {
    
    let totalItemsCount = nums1.count + nums2.count
    
    if nums2.first! >= nums1.last! {
        
        let medianInd = totalItemsCount / 2
        
        if totalItemsCount.isMultiple(of: 2) {
            // retrieve that index, and (index + 1)
            guard medianInd < nums1.count else {
                let indNextArr = medianInd - nums1.count
                if indNextArr - 1 < 0 {
                    return Double((nums2[indNextArr] + nums1.last!)) / 2
                } else {
                    return Double((nums2[indNextArr] + nums2[indNextArr + 1])) / 2
                }
            }
            return Double(nums1[medianInd] / nums2[medianInd - 1])
            
        } else {
            // retrieve straight to the index
            guard medianInd < nums1.count else {
                return Double(nums2[medianInd - nums1.count])
            }
            return Double(nums1[medianInd])
        }
    }
    return nil
}

print(medianOfTwoArr(nums1: [1, 2], nums2: [3, 4, 5, 6]))



func findMedianOfTwo(nums1: [Int], nums2: [Int]) -> Double? {
    // combine two arrays together
    var SortedComArr = [Int]()
    let medianIndex = (nums1.count + nums2.count) / 2
    let totalCount = nums1.count + nums2.count
    
    var pointer1 = 0
    var pointer2 = 0
    
    guard !nums2.isEmpty || !nums1.isEmpty else {
        if nums2.isEmpty {
            return Double(nums1[medianIndex])
        } else if nums1.isEmpty {
            return Double(nums2[medianIndex])
        }
        return nil
    }
    
    while SortedComArr.count != (nums2.count + nums1.count) {
        guard pointer1 < nums1.count else {
            continue
        }
        guard pointer2 < nums2.count else {
            continue
        }
        
        if nums1[pointer1] < nums2[pointer2] {
            SortedComArr.append(nums1[pointer1])
            pointer1 += 1
        } else if nums1[pointer1] > nums2[pointer2] {
            SortedComArr.append(nums2[pointer2])
            pointer2 += 1
        } else if nums1[pointer1] == nums2[pointer2] {
            SortedComArr.append(nums1[pointer1])
            SortedComArr.append(nums2[pointer2])
            pointer1 += 1
            pointer2 += 1
        }
    }

    if totalCount.isMultiple(of: 2) {
        return Double(SortedComArr[medianIndex] + SortedComArr[medianIndex + 1]) / 2
    } else {
        return Double(SortedComArr[medianIndex])
    }
}

//findMedianOfTwo(nums1: [1, 2], nums2: [3, 4])


func combineTwoSortedArrays(arrOne: [Int], arrTwo: [Int]) -> [Int] {
    var combined = [Int]()
    
    
    if arrOne.count < arrTwo.count {
        // loop over arrOne
        combined = arrTwo
        var middle = combined.count / 2
        
        
        for number in arrOne {
            
            if number <= combined.first! {
                combined.insert(number, at: 0)
                continue
            } else if number >= combined.last! {
                combined.append(number)
                continue
            }
            
            while middle >= 0 && middle < combined.count {
                print(number)
                if number < combined[middle] {
                    middle = middle / 2
                    if number > combined[middle] {
                        combined.insert(number, at: middle + 1)
                        break
                    }
                } else if number > combined[middle] {
                    if middle == middle + (middle / 2) {
                        middle += 1
                        continue
                    }
                    middle = middle + (middle / 2)
                    
                    
                    if number < combined[middle] {
                        combined.insert(number, at: middle)
                        break
                    }
                } else if number == combined[middle] {
                    combined.insert(number, at: middle)
                    break
                }
            }
        }
    }
    
    return combined
    
}
print(combineTwoSortedArrays(arrOne: [3, 4, 7], arrTwo: [1, 2, 4, 5, 7]))
