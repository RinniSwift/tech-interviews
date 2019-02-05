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


