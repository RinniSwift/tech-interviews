

// 1. Merge given number into given sequence with O(log n) run time

func mergeNumber(arr: [Int], number: Int) -> [Int] {
    var mergedArr = arr
    
    var middle = arr.count / 2
    
    while middle > 0 || middle < arr.count {
        if number < arr[middle] {
            guard middle - 1 >= 0 else {
                middle = middle / 2
                continue
            }
            if number > arr[middle - 1] {
                mergedArr.insert(number, at: middle)
                break
            } else {
                middle = middle / 2
            }
        } else if number > arr[middle] {
            guard middle + 1 < arr.count else {
                middle = middle + (middle / 2)
                continue
            }
            if number < arr[middle + 1] {
                mergedArr.insert(number, at: middle)
                break
            }
        } else if number == arr[middle] {
            mergedArr.insert(number, at: middle)
            break
        }
    }
    
    return mergedArr
}

mergeNumber(arr: [1, 5, 6, 9], number: 6)
