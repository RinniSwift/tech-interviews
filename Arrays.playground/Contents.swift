/*
                                                return the highest product of 3 numbers from an array
                                                [1, 5, 3, 6, 2]
 */
func returnHighestProduct(arr: [Int]) -> Int {
    var resultProuct = 1
    for i in 0...2 {
        resultProuct *= arr.sorted().reversed()[i]
    }
    return resultProuct
}
//returnHighestProduct(arr: [1, 5, 3, 6, 2])




/*
                                                 given an array, rotate it to the right by k times
                                                 [1,2,3,4,5,6,7], k = 3
                                                                  --> [5,6,7,1,2,3,4]
 */
func rotateToRight(arr: [Int], k: Int) -> [Int] {
    let first = arr.dropLast(3)
    let last = arr.dropFirst(arr.count - k)
    return Array(last + first)
}
rotateToRight(arr: [1,2,3,4,5,6,7], k: 3)

func rotateRight(arr: inout [Int], k: Int) -> [Int] {
    for _ in 0..<k {
        arr.insert(arr.removeLast(), at: 0)
    }
    return arr
}
//var nums = [1,2,3,4,5,6,7]
//rotateRight(arr: &nums, k: 3)



/*
                                        given two arrays, return the items that contain in both the arrays
 */
func returnSimilarities(arrOne: [Int], arrTwo: [Int]) -> [Int] {
    var resultArr = [Int]()
    for i in 0...(arrOne.count - 1) {
        if arrTwo.contains(arrOne[i]) {
            resultArr.append(arrOne[i])
        }
    }
    return resultArr
}
//returnSimilarities(arrOne: [1, 2, 3, 7], arrTwo: [2, 7, 4, 5])



/*
                                         given two arrays, write a function to compute their intersection
                                             arrOne: [1, 2, 2, 1] and arrTwo: [2, 2]   -->  [2, 2]
                                                     1. if arrTwo is always larger than arrOne
                                     **************************************************************************
 */
func intersection(arrOne: [Int], arrTwo: inout [Int]) -> [Int] {
//    var resultArr = [Int]()
//    for num in arrOne {
//        for (ind, item) in arrTwo.enumerated() {
//            if num == item {
//                resultArr.append(item)
//                arrTwo.remove(at: ind)
//            }
//        }
//    }
//    return resultArr
    
//    var resultArr = [Int]()
//    var newNums2 = arrTwo
//    for num in arrOne {
//        for (ind, item) in newNums2.enumerated() {
//            if num == item {
//                resultArr.append(item)
//                newNums2.remove(at: ind)
//            }
//        }
//    }
//    return resultArr
    
    
    var resultArr = [Int]()
    var newNums2 = arrTwo

    for num in arrOne {
        for (ind, item) in newNums2.enumerated() {
            if num == item {
                resultArr.append(item)
                newNums2.remove(at: ind)
            }
        }
    }
    return resultArr
    
}
var this = [1, 4, 3, 5, 6, 7]
intersection(arrOne: [1, 2, 3, 4, 3, 4, 3], arrTwo: &this)


/*
                             given an array of integers, add 1 to it and return the result number in an array format
                                                         [1, 2, 3]  -->  [1, 2, 4]
 */
func addOne(arr: [Int]) {
//    var additional =  arr
//    if arr[(arr.count - 1)] < 9 {
//        additional[(arr.count - 1)] = arr.last! + 1
//    } else {
//        additional[arr.count - 2] = additional[arr.count - 2] + 1
//        additional[arr.count - 1] = 0
//    }
//    return additional
    
    var resultArr = [Int]()
    var string = ""
    for number in arr {
        string.append(String(number))
    }
//    let stringInInt = Int(string)! + 1
//    for num in stringInInt {
//        resultArr.append(num)
//    }
    
    for i in stride(from: 10, through: 1, by: -1) {
        print(i)
    }
    
}
//addOne(arr: [1, 2, 9])




/*
 Given a matrix containg 0's and 1's, return a boolean indicating whether there is a path of 0's

                [[0, 0, 1],
                 [1, 0, 1],
                 [0, 0, 1]]     -> true

                 [[0, 0, 1],
                  [0, 0, 1],
                  [1, 0, 1]
                  [0, 1, 1]]    -> false
 */

func checkValidPath(matrix: inout [[Int]]) -> Bool {
    
    var count = 0
    
    for i in 0...(matrix.count - 1) {
        for j in 0...(matrix[i].count - 1) {
            if matrix[i][j] == 0 {
                changeZeros(&matrix, i, j)
                count += 1
            }
        }
    }
    
    if count == 1 {
        return true
    }
    
    return false
}


func changeZeros(_ matrix: inout [[Int]], _ i: Int, _ j: Int) {
    guard i >= 0, j >= 0, i < matrix.count, j < matrix[0].count else { return }
    
    if matrix[i][j] == 0 {
        matrix[i][j] = 1
        changeZeros(&matrix, i - 1, j)
        changeZeros(&matrix, i + 1, j)
        changeZeros(&matrix, i, j - 1)
        changeZeros(&matrix, i, j + 1)
    }
    
    
}


var grid1 = [[0, 0, 1],
             [1, 0, 0],
             [1, 1, 0]]
checkValidPath(matrix: &grid1)




/*
             given an array and a limit, find the two indices that add up to that number
                        [1, 4, 3, 7, 5] , k = 9
 */

func twoSums(arr: [Int], k: Int) -> [Int] {
    var resultArr = [Int]()
    
    var difference: Int? = nil
    for (ind, num) in arr.enumerated() {
        difference = k - num
        if arr.contains(difference!) {
            resultArr.append(ind)
        }
        if num == difference {
            resultArr.append(ind)
        }
    }
    
    return resultArr
}
twoSums(arr: [1, 4, 7, 5], k: 9)




func twoSumsNew(arr: [Int], k: Int) -> [Int] {
    
    var dict = [Int: [Int]]()
    var resultArr = [Int]()
    
    for (ind, num) in arr.enumerated() {
        if dict[num] == nil {
            dict[num] = [ind]
        } else {
            dict[num]?.append(ind)
        }
        
    }
    
    for (ind, num) in arr.enumerated() {
        let diff = k - num
        if dict[diff] != nil {
            resultArr.append(ind)
            resultArr.append(dict[diff]![0])
        }
    }
    
    return resultArr
}
twoSumsNew(arr: [1, 4, 4, 7, 6, 5], k: 9)



/*
 
 given two arrays, return the duplicates in both the arrays
 
 */
func returnDupl(one: [Int], two: [Int]) -> [Int] {
    var res = Set<Int>()
    let set = Set(one)
    
    for number in two {
        if set.contains(number) {
            res.insert(number)
        }
    }
    
    return Array(res)
}
//returnDupl(one: [1, 2, 3, 4, 5, 5, 6, 2, 1], two: [5, 3, 6, 7, 8, 5])



/*
                         given an array, return the product of every item except the item at index i
                                            [1, 2, 3, 4] -> [24, 12, 8, 6]
 */
func returnProduct(arr: [Int]) -> [Int] {
    
    var resultArr = [Int]()
    
    var product = 1
    
    for i in 0..<arr.count {
        resultArr.append(product)
        product *= arr[i]
    }
    print(resultArr)
    
    product = 1
    for i in stride(from: (arr.count - 1), through: 0, by: -1) {
        resultArr[i] *= product
        product *= arr[i]
    }
    
    return resultArr
}
//returnProduct(arr: [1, 2, 3, 4])




/*
             given an array of duplicates, return only the numbers once
 */
func returnNumbersOnce(arr: inout [Int]) -> [Int] {
    
    var pointer1 = 0
    var pointer2 = 1
    
    while pointer1 < (arr.count) && pointer2 < (arr.count) {
        if arr[pointer1] == arr[pointer2] {
            arr.remove(at: pointer2)
        } else {
            pointer1 += 1
            pointer2 += 1
        }
    }
    return arr
}
//var numbers = [1, 1, 1, 2, 2, 2, 3, 3, 3, 3, 4, 5]
//returnNumbersOnce(arr: &numbers)






/*
 reverse the string in an array from
 
                 [ ‘p’, ‘e’, ‘r’, ‘f’, ‘e’, ‘c’, ‘t’, '  ',
                   ‘m’, ‘a’, ‘k’, ‘e’, ‘s’, '  ',
                   ‘p’, ‘r’, ‘a’, ‘c’, ‘t’, ‘i’, ‘c’, ‘e’ ]
 
                                 to
 
                 [ ‘p’, ‘r’, ‘a’, ‘c’, ‘t’, ‘i’, ‘c’, ‘e’, '  ',
                   ‘m’, ‘a’, ‘k’, ‘e’, ‘s’, '  ',
                   ‘p’, ‘e’, ‘r’, ‘f’, ‘e’, ‘c’, ‘t’ ]
 */

func reverseOrder(stringInArr: [Character]) -> [Character] {
    
    var wordArr = String(stringInArr).split(separator: " ") // ["perfect", "makes", "practice"]
    let length = wordArr.count
    
    for i in stride(from: length - 1, through: 0, by: -1) {
        wordArr.append(wordArr[i])                          // ["perfect", "makes", "practice", "practice", "makes", "perfect"]
    }
    wordArr.removeSubrange(0..<length)                      // ["practice", "makes", "perfect"]
    
    let joined = wordArr.joined(separator: " ")
    return Array(joined)
}
reverseOrder(stringInArr: [ "p", "e", "r", "f", "e", "c", "t", " ",
                            "m", "a", "k", "e", "s", " ",
                            "p", "r", "a", "c", "t", "i", "c", "e" ])
