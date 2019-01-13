/*
 
 Given an array of integers, count the number of pairs of integers that have k difference
 
 */

func kApart(numbers: [Int], k: Int) -> [(Int, Int)] {
    
    var pairs = [(Int, Int)]()
    var nums = Set(numbers)
    for number in numbers {
        if nums.contains(number - k) {
            pairs.append((number, number - k))
        } else if nums.contains(number + k) {
            pairs.append((number, number + k))
        }
    }
    
    return pairs
}
print(kApart(numbers: [1, 7, 5, 9, 2, 12, 3], k: 2))
