
import Foundation

/* Nov.5.18
 
 question 1) list the values in an array that are contain the exact order in the other array.                           * complete
 question 2) given an array of numbers. get the second largest number.                                                  * complete
 
*/

// 1)
let str1 = ["a", "b", "c", "f", "h", "y"]
let str2 = ["c", "f", "d", "h", "w"]

func findLongestConsecutives(str1: [String], str2: [String]) -> [String] {
    var result = [(s: String, i: Int, j: Int)]()
    for (i, a) in str1.enumerated() {
        for (j, b) in str2.enumerated() {
            if a == b {
                if result.count == 0 {
                    result.append((a, i ,j))
                } else {
                    let last = result.last!
                    if last.j == j - 1 && last.i == i - 1 {
                        result.append((a, i, j))
                    } // else create a new array for a new match
                }
            }
        }
    }
    return result.map({ (a) -> String in
        return a.s
    })
}
print(findLongestConsecutives(str1: str1, str2: str2))

// this has a run time of ( n * m ) * z
// n is the for loop , m is the nested for loop, and z is the result array.


// 2)
func findSecondLargest(numbers: [Int]) -> Int {
    var arr = numbers
    arr.sorted()
    return arr[arr.count - 1]
}

var listOfNumbers = [3, 4, 54, 12, 30]
print(findSecondLargest(numbers: listOfNumbers))

// ADDED: find second largest number without using the sort function
func secondLargestNoSort(numbers: [Int]) -> Int {
    var largests: (Int, Int)? = nil
    
    for num in numbers {
        if largests == nil {
            largests = (0, num)
        } else if num > largests!.1 {
            largests!.0 = largests!.1
            largests!.1 = num
        } else if num < largests!.1 && num > largests!.0 {
            largests!.0 = num
        }
    }
    
    return largests!.0
}
secondLargestNoSort(numbers: [2,1,3,6,4,7,8])

/* Nov.12.18
 
    Question 3) given an array of Int, return the largest product of 3 integers                                         * complete
    Question 4) given an array of duplicate Int, return the unique number                                               * complete
 
 */

// 3)
let list = [3, 7, 1, 2, 13, 52, 99, 54, 20, -1000, -5]
func largestProduct(listInt: [Int]) -> Int {
    let sortedList = listInt.sorted()
    let lastThreeNum = sortedList.suffix(3)
    
    let firstProduct = lastThreeNum.reduce(1, *)
    let secondProduct = sortedList[0] * sortedList[1] * sortedList.last!
    
    if firstProduct >= secondProduct {
        return firstProduct
    } else {
        return secondProduct
    }
    
}
print(largestProduct(listInt: list))

// 4)
let duplicates = [3, 4, 77, 3, 77, 5, 6, 6, 4]
func returnUnique(numbers: [Int]) -> [Int] {
    var uniqueNumbers = [Int]()
    var frequencyDict = [Int:Int]()
    for i in numbers {
        if(frequencyDict.keys.contains(i)){
            frequencyDict[i]! += 1
        }
        else{
            frequencyDict[i] = 1
        }
    }
    for j in frequencyDict {
        if j.value == 1 {
            uniqueNumbers.append(j.key)
        }
    }
    return uniqueNumbers
}
print(returnUnique(numbers: duplicates))

/*
 
    question 5) given an array of Ints and a value, find the two pairs that add up to that value.                       * complete
    question 6) create a binary search on an array with a given value                                                   * complete
 
 */

// 5)
func pairs(nums: [Int], number: Int) -> [Int: Int] {
    var pairs = [Int: Int]()
    var numbers = Set(nums)
    
    for i in numbers {
        let complement = number - i
        numbers.remove(i)
        if numbers.contains(complement) {
            pairs[i] = complement
            numbers.remove(complement)
        }
    }
    return pairs
}
pairs(nums: [4, 5, 9, 11, 2, 23, 44, 8, 1, 5], number: 10)

// 5.2) without a set
func sumPairs(nums: [Int], number: Int) -> ((Int, Int))? {
    
    let sorted = nums.sorted()
    var pairs = [Int:Int]()
    
    var i = 0
    var j = sorted.count - 1
    
    while i < j {
        let complement = nums[i] + nums[j]
        if complement == number {
            pairs[nums[i]] = nums[j]
        } else if complement < number {
            i += 1
        } else if complement > number {
            j -= 1
        }
    }
    return nil
}
print(sumPairs(nums: [4, 5, 9, 11, 2, 23, 44, 8, 1, 5], number: 10))



// 6)
func arrayBinarySearch(array: [Int], value: Int) -> Bool {
    let midIndex = (array.count - 1) / 2
    let minIndex = 0
    let maxIndex = (array.count - 1)
    let midValue = array[midIndex]
    
    if value == midValue {
        return true
    } else if value < array[minIndex] || value > array[maxIndex] {
        return false
    }
    
    if value < midValue {
        let slice = Array(array[minIndex...midIndex-1])
        return arrayBinarySearch(array: slice, value: value)
    } else if value > midValue {
        let slice = Array(array[midIndex+1...maxIndex])
        return arrayBinarySearch(array: slice, value: value)
    }
    
    
    return false
}

arrayBinarySearch(array: [2, 7, 9, 10, 15, 22, 33, 44, 55], value: 33)

/*
 
    question 7) find the missing number in a given array of 1...100                         * not complete
    question 8) find the smallest and largest number in an unsorted array                   * not complete
    question 9) calculate the number of times an integer has been duplicated.               * not complete
    question 10) calculate the number of times a number has been repeated in an array       * complete
 
 */



// 10)
func numberOfTimes(numbers: [Int]) -> [Int: Int] {

    var countsDict = [Int: Int]()
    var count = 1
    for num in numbers {
        if countsDict[num] != nil {
            count += 1
            countsDict[num] = count
        } else {
            countsDict[num] = 1
        }
        
    }
    return countsDict
}
print(numberOfTimes(numbers: [2, 2, 4, 6, 1]))


/*
 
    question 11) create a Queue with stacks                                                  * not complete
    question 12) return numbers under a certain condition using a closure                    * complete

 */

// 11)
// one stack for inputting, one stack for outputting.
// [4, 3, 2, 1]

// \    1    /   \    4    /
//  \   2   /     \   3   /
//   \  3  /       \  2  /
//    \ 4 /         \ 1 /    -> deque

// this will create a first in first out

class Queue {
    var inputStack = Stack()
    var outputStack = Stack()
    
    func push(_ number: Int) {
        inputStack.enque(number)
    }
    
    func pop() {
        outputStack.enque(inputStack.dequeue()!)
        outputStack.dequeue()
    }
    
    func isEmpty() -> Bool {
        return inputStack.array.isEmpty && outputStack.array.isEmpty
    }
}

class Stack {
    var array = [Int]()
    func enque(_ num: Int) {
        array.append(num)
    }
    func dequeue() -> Int? {
        return array.popLast()
    }
}

var queue = Queue()
queue.push(4)
queue.push(5)
queue.push(6)
queue.isEmpty()
print(queue.pop())
print(queue.inputStack.array)
print(queue.outputStack.array)


// 12)
func filterWithPredicateClosure(condition: (Int) -> Bool, numbers: [Int]) -> [Int] {
    var filteredNums = [Int]()
    for num in numbers {
        if condition(num) {
            filteredNums.append(num)
        }
    }
    return filteredNums
}

print(filterWithPredicateClosure(condition: { (num) -> Bool in
    return num < 6
}, numbers: [1, 3, 5, 7, 9, 10]))



let numbers = [3, 5, 8, 33, 22]
print(numbers.max(by: { (a, b) -> Bool in
    a < b
}))
numbers.map { $0 * $0 }
print(numbers.map { (value) -> Int in
    value * value
})

/*
    13) have a starting number and jump the amount of steps given with a given step                                     * complete
    14) create a factorial recurssive function                                                                          * complete
    15) check if all characters in a word are unique                                                                    * complete
 */

// 13)
func makeIterator(start: Int, iterate: Int, steps: Int) -> [Int] {
    var numbers = [Int]()
    var current = start
    numbers.append(start)
    
    for _ in 0...steps {
        current += iterate
        numbers.append(current)
        
    }
    
    return numbers
}

makeIterator(start: 1, iterate: 2, steps: 10)

// 14)
func factorialRecurssive(times: Int) -> Int {
    if times == 0 || times == 1 {
        return 1
    }
    
    else if times > 1 {
        return times * factorialRecurssive(times: (times - 1))
    }
    return 0
}
factorialRecurssive(times: 10)


// 15)
func unqiueWord(word: String) -> Bool {
    var seenChar = Set<String>()
    var unique = 0
    
    for i in word.lowercased() {
        if seenChar.contains(String(i)) {
            return false
        } else {
            seenChar.insert(String(i))
            print(seenChar)
            unique += 1
        }
    }
    
    if unique == word.count {
        return true
    } else {
        return false
    }
}
unqiueWord(word: "concious")

/*
        USING CLOSURES
 
    16) use filter to return all multiples of 3                         * complete *
    17) use reduce to get the largest number                            * complete
    18) use reduce to join all strings together                         * complete
 
 */

// 16)
func multiplesOfThree(numbers: [Int]) -> [Int] {
    
    /*
    return numbers.filter { (num) -> Bool in
        return num % 3 == 0
    }
     or:
    */
    
    return numbers.filter { $0 % 3 == 0 }
    
}
multiplesOfThree(numbers: [3, 4, 5, 6, 8, 9, 33])

// 17)
func largestNumber(numbers: [Int]) -> Int {
    return numbers.reduce(0, {
        if $0 > $1 {
            return $0
        } else {
            return $1
        }
    })
}

largestNumber(numbers: [3, 5, 7, 9, 100])

// 18)
func joinStrings(strings: [String]) -> String {
    return strings.reduce("", { $0 + " " +  $1 })
}
joinStrings(strings: ["happy", "me", "in", "a", "garden"])


/*
 
 19) return the pairs of Ints that add up to k                                          * compelete
 20) find all the different ways a character array can be permutated                    * not complete
 21) compress strings with the number of repeated character count aabcddde -> a2bcd3e   * complete
 22) check if string one is a subset of string two                                      * complete
 
 */


// 19)
func pairsThatAddUp(nums: [Int], k: Int) -> [Int: Int] {
    
    var pairs = [Int: Int]()
    var numbers = Set(nums)
    
    for i in numbers {
        let complement = k - i
        numbers.remove(i)
        if numbers.contains(complement) {
            pairs[i] = complement
            numbers.remove(complement)
        }
    }
    return pairs
    
}
print(pairsThatAddUp(nums: [3, 4, 5, 6, 1, 7, 0, 2], k: 8))


// 21)
func compressString(string: String) -> String {
    
    var compressedString = ""
    var count = 1
    var prev = ""
    
    for i in string {
        let curr = String(i)
        if curr == prev {
            count += 1
        } else {
            if count > 1 {
                compressedString += String(count)
            } else {
                count = 1
            }
            compressedString += String(i)
            count = 1
        }
        prev = String(i)
    }
    return compressedString
    
}
compressString(string: "aabcddde")

// 22)
func isSubstring(stringOne: String, stringTwo: String) -> Bool {
    var count = 0
    for i in stringTwo {
        if stringOne.contains(i) {
            count += 1
        }
    }
    
    return false
}
isSubstring(stringOne: "hi", stringTwo: "pp")



/*
 
 extra credit: create a rubix cube game which should have all ones in a row and all zeros in a row
 
 */




