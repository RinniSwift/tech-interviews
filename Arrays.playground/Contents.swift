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
 */
func intersection(arrOne: [Int], arrTwo: inout [Int]) -> [Int] {
    var resultArr = [Int]()
    for num in arrOne {
        for (ind, item) in arrTwo.enumerated() {
            if num == item {
                resultArr.append(item)
                arrTwo.remove(at: ind)
            }
        }
    }
    return resultArr
}
var arrTwo = [1, 4, 5, 6, 7, 3]
intersection(arrOne: [1, 2, 3, 4], arrTwo: &arrTwo)
