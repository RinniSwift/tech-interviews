

// 1. Merge given number into given sorted sequence with O(log n) run time

// first solution: - check if the added numbers can be appended to the back (number is greater than or equal to the last item in the sequence)
//                   or can be inserted to index 0 (number is less than or equal to the first item in the sequence)
//
//               If no, then start looping through it with divide and conquer
//               1. create a middle value which starts at the median of the entire sequence
//               2. loop while middle is still within bounds (0 <= middle < sequence.count)
//                  2.1 check if the number is less than the item at middle
//                      If Less Than:
//                          check the item to the left if the number is greater:
//                              insert the item at the middle index and break
//
//                      If Greater Than:
//                          check the item to the right if the number is less:
//                              insert the item at the middle index and break
//                          if no, continue unless it equals, insert to the middle index


func mergeIntoSorted(arr: [Int], number: Int) -> [Int] {
    var sorted = arr
    var medianInd = arr.count / 2
    
    if number >= arr.last! {
        sorted.append(number)
    } else if number <= arr.first! {
        sorted.insert(number, at: 0)
    }
    
    while medianInd >= 0 && medianInd < arr.count {
        if number < arr[medianInd] {
            guard medianInd > 0 else {
                continue
            }
            if number > arr[medianInd - 1] || number == arr[medianInd] {
                sorted.insert(number, at: medianInd)
                break
            }
            medianInd = medianInd / 2
        } else {
            guard medianInd < arr.count else {
                continue
            }
            if number < arr[medianInd + 1] || number == arr[medianInd] {
                sorted.insert(number, at: medianInd)
                break
            }
            medianInd = medianInd + (medianInd / 2)
        }
    }
    
    return sorted
}
mergeIntoSorted(arr: [1, 3, 5, 7], number: 4)



// 2. Merge multiple elements to the given sequence. with O(n (log n))
