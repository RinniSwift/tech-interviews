import UIKit

/*
 1.
 given an array of integers, return an array of ints such that the value at index i of the output is the product of everything in hte input except the element at i
 */

func returnMultiplesHOF(numbers: [Int]) -> [Int] {
    var array = [Int]()
    
    for i in 0...(numbers.count - 1) {
        if numbers[i] == 0 {
            let numberMult = numbers.filter{ $0 != 0 }.reduce(1, *)
            array.append(numberMult)
        } else {
            let number = numbers.reduce(1, *) / numbers[i]
            array.append(number)
        }
        
    }
    return array
}
returnMultiplesHOF(numbers: [1, 0, 3, 0])



func returnMultiples(numbers: [Int]) -> [Int] {
    
    var arr = [Int]()
    
    for i in 0...(numbers.count - 1) {
        var sum = 1
        for j in 0...(numbers.count - 1) {
            if i != j {
                sum *= numbers[j]
            }
        }
        arr.append(sum)
        sum = 1
    }
    
    return arr
    
}
returnMultiples(numbers: [1, 0, 3, 4])


/*
 implement a stack with the following methods:
    push()      puts an item on top of the stack
    pop()       removes an element from the top of the stack
    peek()      returns the top element on the stack
    isEmpty()   returns true if elements are in the stack, else, return false
    max()       returns the max value in the stack
 
 
 |   d   |
 |   c   |
 |   b   |
 |   a   |
 
 [a, b, c, d]
 push(e) --> [a, b, c, d, e]
 pop(e)   --> [a, b, c, d]
 
 
 */

class Stack {
    var array = [Int]()
    var maxes = [Int]()
    
    
    
    func push(_ item: Int) {
        array.append(item)
        if maxes.count == 0 {
            maxes.append(item)
        } else{
            if item >= maxes.last! {
                maxes.append(item)
            }
        }
        
       
        
    }
    
    func pop(_ item: Int) {
        array.removeLast()
        
        if item == maxes.last {
            maxes.removeLast()
        }
        
    }
    
    func max() -> Int {
        return maxes.last!
    }
    
    func peek() -> Int {
        return array.last!
    }
    
    func isEmpty() -> Bool {
        if array.count == 0 {
            return true
        } else {
            return false
        }
    }
    
}

let stack = Stack()
stack.isEmpty()
stack.push(5)
stack.push(4)
stack.push(9)
stack.isEmpty()
stack.peek()
stack.pop(9)
stack.max()




/*
 given two sorted arrays, return an array that contains common values
 */

func returnCommons(arr1: [Int], arr2: [Int]) -> [Int]  {
    
    var commonArr = Set<Int>()

    var pointer1 = 0
    var pointer2 = 0
    
    while pointer1 < arr1.count && pointer2 < arr2.count {
        if arr1[pointer1] < arr2[pointer2] {
            pointer1 += 1
        } else if arr1[pointer1] > arr2[pointer2] {
            pointer2 += 1
        } else if arr1[pointer1] == arr2[pointer2] {
            commonArr.insert(arr1[pointer1])
            pointer2 += 1
            pointer1 += 1
        }
    }
    
    return Array(commonArr)
    
}

returnCommons(arr1: [1, 5, 7, 9], arr2: [9, 10, 11])

/*
 use the method .intersection() on both the sets!
 */



/*
 given a string one and string two, find the minimum window in string one which will contain all the characters in string two.
 */

func returnSubstring(one: String, two: String) {
//    var resultString = ""
//    var one = two
//    if resultString.count <= 0 {
//        if two.prefix(3).sorted() == resultString.sorted() {
//            resultString += two.prefix(3)
//        } else {
//            let newStringB = two.suffix(two.count - 1)
//            print(two.prefix(3))
//            print(resultString)
//            returnSubstring(one: one, two: String(newStringB))
//        }
//    } else {
//        return resultString
//    }
    
    
    var letterAndIndexFound = [Character: [Int]]()
    
    for (index, char) in one.enumerated() {
        if two.contains(char) {
            if letterAndIndexFound[char] != nil {
                letterAndIndexFound[char]?.append(index)
            } else {
                letterAndIndexFound[char] = [index]
            }
        }
    }
    
    print(letterAndIndexFound)
    
    
}
returnSubstring(one: "ADOBECODEBANC", two: "ABC")



/*
 
 given 2d array of ones and zeros, where ones represents represent islands and zeros represent water, find the height of the island if there can only be one island
 
 [[0, 0, 0, 0],
  [0, 1, 1, 0],
  [0, 1, 1, 0],
  [0, 1, 1, 0]]
 
 */

func returnIslandHeight(islandMatrix: [[Int]]) -> (Int, Int)  {
    
    var rows = Set<Int>()
    var columns = Set<Int>()
    
    for i in 0...(islandMatrix.count - 1) {
        for j in 0...(islandMatrix[0].count - 1) {
            if islandMatrix[i][j] == 1 {
                rows.insert(i)
                columns.insert(j)
            }
        }
    }
    
    return (rows.count, columns.count)
    
}
print(returnIslandHeight(islandMatrix: [[0, 1, 1, 0],
                                        [0, 1, 1, 0],
                                        [0, 0, 0, 0],
                                        [0, 0, 0, 0]]))










































































































































