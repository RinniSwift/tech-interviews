/*
 
 find the diagonal difference in a matrix from left to right and right to left
 e.g. [[1, 2, 3],
       [4, 5, 6],
       [7, 8, 9]]          the difference will be: |(1 + 5 + 9) - (3 + 5 + 7)|
 
 */
func diagonalDifference(matrix: [[Int]]) {
    
    let leftToRight = matrix.enumerated().reduce(0) {(result, arr) in
        return result + arr.element[arr.offset]
    }
    let rightToLeft = matrix.reversed().enumerated().reduce(0) {(result, arr) in
        return result + arr.element[arr.offset]
    }
    
    print(abs(leftToRight - rightToLeft))
}
diagonalDifference(matrix: [[1, 2, 3],
                            [4, 5, 6],
                            [7, 8, 9]])


/*
 
 Given an array of integers, calculate the fractions of its elements that are positive, negative, and are zeros. Print the decimal value of each fraction on a new line.
 arr = [1, 1, 0, -1, -1]
 returns 0.400000 fraction of positive number
 0.400000 fraction of negative number
 0.200000 fraction of number zero
 
 */
func ratiosOfNumbers(numbers: [Int]) {
    
    var positives = 0
    var negatives = 0
    var zeros = 0
    
    for number in numbers {
        if number > 0 {
            positives += 1
        } else if number < 0 {
            negatives += 1
        } else {
            zeros += 1
        }
    }
    
    print(Double(positives) / Double(numbers.count))
    print(Double(negatives) / Double(numbers.count))
    print(Float(zeros) / Float(numbers.count))
    
}
ratiosOfNumbers(numbers: [1, 1, 0, -1, -1])


/*
 
 create a function that prints out the staircase
 n = 6
      #
     ##
    ###
   ####
  #####
 ######
 
 clean up the code!
 
 */
func staircase(n: Int) {
    var string = ""
    
    for i in 1...n {
        let spaces = n - i
        if spaces > 0 {
            for _ in 1...(spaces) {
                string += " "
            }
        }
        while string.count != n {
            string += "#"
        }
        print(string)
        string = ""
    }
    
}
staircase(n: 6)


/*
    calculate the number of candles your neice can blow out if there are amount of numbers she is old and different heights. she can only blow once so the candles that have the highest height will be blown out.
    [3 2 1 3] -> 2
    because there are only 2 candles whihc are the highest.
 */
func birthdayCakeCandles(ar: [Int]) -> Int {
    let maxNum = ar.sorted().reversed()[0]
    var count = 0
    
    for num in ar {
        if num == maxNum {
            count += 1
        }
    }
    return count
    
//    return ar.reduce(0, {(x, y) in
//        if y == maxNum {
//            count + 1
//        }
//        return y
//    })
}
birthdayCakeCandles(ar: [3, 2, 1, 5, 9, 9, 9])


/*
 
 convert the time function where it returns a 12 hour clock to a 24 hour clock
 e.g. string input: 07:05:45PM
      string output: 19:05:45
 
 */


func timeConversion(s: String) -> String {
    var timeArray = [Character]()
    for item in s {
        timeArray.append(item)
    }
    
    if timeArray[0] == "1" && timeArray[1] == "2" && timeArray.reversed()[1] == "A" {
        return "00:\(timeArray[3])\(timeArray[4]):\(timeArray[6])\(timeArray[7])"
    } else if timeArray[0] == "1" && timeArray[1] == "2" && timeArray.reversed()[1] == "P" {
        return "\(timeArray[0])\(timeArray[1]):\(timeArray[3])\(timeArray[4]):\(timeArray[6])\(timeArray[7])"
    } else if timeArray.reversed()[1] == "P" {
        let hour = 12 + Int("\(timeArray[0])\(timeArray[1])")!
        if hour > 9 {
            return "\(hour):\(timeArray[3])\(timeArray[4]):\(timeArray[6])\(timeArray[7])"
        } else if hour < 10 {
            return "0\(hour):\(timeArray[3])\(timeArray[4]):\(timeArray[6])\(timeArray[7])"
        }
    } else if timeArray.reversed()[1] == "A" {
        return "\(timeArray[0])\(timeArray[1]):\(timeArray[3])\(timeArray[4]):\(timeArray[6])\(timeArray[7])"
    }
    return ""
}

timeConversion(s: "07:05:45PM")
timeConversion(s: "12:00:00AM")
timeConversion(s: "12:00:00PM")
timeConversion(s: "11:05:45PM")
timeConversion(s: "01:00:00AM")


/*
 find every possible substring of a string
 
             ********************
             *** not complete ***
             ********************
 
 */



/*
 
 determine the amount of matching socks there are in the sock pile (array).
 ar = [1, 2, 1, 2, 1, 3, 2]
 --> 2 since there are only 2 pairs of socks that have the same color.
 
 */
func returnSockPairs(socks: [Int]) -> Int {
    // histogram approach
    var hist = [Int: Int]()
    var count = 0

    for color in socks {
        if hist[color] == nil {
            hist[color] = 1
        } else {
            hist[color]! += 1
        }
    }

    for item in hist {
        let pairs = item.value / 2
        count += pairs
    }
    return count
}
returnSockPairs(socks: [1, 2, 1, 2, 1, 3, 2])




/*
 
 given a string = UDDDUDUU
 return the number of valleys the hiker will go through:
 
 
                         /\
 _/\      _         _   /  \_
    \    /      \  /
     \/\/        \/
 
 return 2
 
 */
func countingValleys(n: Int, s: String) -> Int {
    var seaLevel = 0
    var currLevel = seaLevel
    var valleyCount = 0
    var currentlyInValley = false
    
    // check if it was a positive number that came down to level 0: this will not count as being a valleyr
    
    for route in s {
        if route == "D" {
            currLevel -= 1
        } else if route == "U" {
            currLevel += 1
        }
        
        if currLevel == seaLevel && currentlyInValley == true {
            currentlyInValley = false
            valleyCount += 1
        } else if currLevel < seaLevel && !currentlyInValley {
            currentlyInValley = true
        }
    }
    return valleyCount
}
//countingValleys(n: 8, s: "UDDDUDUUDDUUUUDD")


/*
 
 create a function to help Emma calculate the minimal jumps she has to take to get to the highest point possible:
 given an array of number 0(representing clouds she can jump on) and 1(representing clouds she cant jump on)
 clouds = [0, 1, 0, 0, 0, 1, 0]
 returns 3
 
             ********************
             *** not complete ***
             ********************
 
 
 */
func jumpingOnClouds(c: [Int]) -> Int {
    
    var currentInd = 0
    var jumps = 0
    
    while currentInd < (c.count - 1) {
        
        if currentInd == c.count - 2 && c[currentInd] != 1 && c[currentInd + 1] == c[currentInd] {
            jumps += 1
            break
        } else if currentInd == c.count - 2 && c[currentInd] == 1 && c[currentInd + 1] == 0 {
            jumps += 1
            break
        } else if currentInd == c.count - 2 && c[currentInd] == 0 && c[currentInd + 1] != 0 {
            break
        } else if c[currentInd] == c[currentInd + 1] && c[currentInd] == c[currentInd + 2] {
            jumps += 1
            print("first")
            currentInd = currentInd + 2
            print(currentInd)
        } else if c[currentInd] != c[currentInd + 1] {
            jumps += 1
            print("sec")
            currentInd = currentInd + 2
        } else if c[currentInd] == c[currentInd + 1] && c[currentInd] != c[currentInd + 2] {
            jumps += 1
            print("third")
            currentInd = currentInd + 1
        }
        
    }
    return jumps
}
jumpingOnClouds(c: [0, 0, 1, 0, 1, 0, 0, 1, 0])


/*
 
 given a string and a number, repeat the string count to that amount of numbers and count the charcter a in the string
 
 count the original 'a's in the original string, divide it by the original string count. get that value to times by the count of the next item.
 
 */


func repeatedString(letters: String, numberOfLetters: Int) -> Int {
    
    // (numberOfLetters / letters.count) % 2 == 0, then we calculate the number
    // of 'a's in the letters and times it by the division.
    
    var totalACount = 0
    
    if (numberOfLetters % letters.count) == 0 {
        var aCount = 0
        for char in letters {
            if char == "a" {
                aCount += 1
            }
        }
        totalACount = aCount * (numberOfLetters / letters.count)
        return totalACount
    } else {
        var appendString = ""
        while appendString.count != numberOfLetters {
            for char in letters {
                if appendString.count != numberOfLetters {
                    appendString += String(char)
                }
            }
        }
        for a in appendString {
            if a == "a" {
                totalACount += 1
            }
        }
        return totalACount
    }
    
    return totalACount
    
}
repeatedString(letters: "abcd", numberOfLetters: 10)



/*
 
 given an array of numbers and a number indicating the amount of times the array rotates to the left, return the array after the n times of rotates
 e.g.
 arr: [1, 2, 3, 4, 5] n: 3       --> [4, 5, 1, 2, 3]
 
 */

func rotateArray(arr: [Int], n: Int) -> [Int] {
    if arr.count == n {
        return arr
    } else {
        let newArray = arr[n...] + arr[0...(n - 1)]
        return Array(newArray)
    }
}
rotateArray(arr: [1, 2, 3, 4, 5], n: 4)



/*
 
 given an array of switched numbers, count the times the numbers have to be swapped in ordr to make the numbers be sorted again.
 
        ********************
        *** not complete ***
        ********************
 
 */

func minimumSwaps(arr: [Int]) -> Int {
    
    var wrongIndCount = 0
    
    for (ind, item) in arr.enumerated() {
        if item != (ind + 1) {
            wrongIndCount += 1
        }
    }
    
    if wrongIndCount == 0 || wrongIndCount == 1 {
        return wrongIndCount
    } else if wrongIndCount > 1 {
        return wrongIndCount - 1
    }
    return wrongIndCount
}
minimumSwaps(arr: [2, 1, 3, 5, 4])
