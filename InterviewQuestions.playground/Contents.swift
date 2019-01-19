/*
 
 Given an array of arrays, return the tuple of numbers that have no parents and that has only one parent
 [[1,2], [2, 5], [2, 6], [3,8]]     ->      ([1, 3], [2, 5, 6, 8])
 return value:
 ([nodes that have no parents], [nodes that have only one parent])
 ([         1, 3             ]  [           2, 5, 6, 8          ])
 
 */

/*
 
 all parents are on the 0 index
 all children are on the 1 index
 
 keep a count on all the parents found
 keep a count on all the children found
 if the parent shows up once, and is not contained in the child dict, that means there are no parents of that node
 if the child value count is 1, that means that that child contains 1 parent
 
 
 parArr: [1: 1, 2: 2, 3: 1]
 childArr: [2: 1, 5: 1, 6: 1, 8: 1]
 
 */

func returnNoParAndOnePar(arr: [[Int]]) -> ([Int], [Int]) {
    
    var parDict = [Int: Int]()
    var childDict = [Int: Int]()
    
    var noParArr = [Int]()
    var oneParArr = [Int]()
    
    for pair in arr {
        for (index, item) in pair.enumerated() {
            if index == 0 {
                var count = 1
                if parDict[item] != nil {
                    count += 1
                    parDict[item] = count
                } else {
                    parDict[item] = count
                }
            } else if index == 1 {
                var count = 1
                if childDict[item] != nil {
                    count += 1
                    childDict[item] = count
                } else {
                    childDict[item] = count
                }
            }
        }
    }
    for dict in parDict {
        if !childDict.keys.contains(dict.key) {
            noParArr.append(dict.key)
        }
    }
    for dict in childDict {
        if dict.value == 1 {
            oneParArr.append(dict.key)
        }
    }
    return (noParArr, oneParArr)
}
print(returnNoParAndOnePar(arr: [[1,2], [2, 5], [2, 6], [3,8], [9, 1]]))


/*
 
 Given an array of Integeres, return true if there are 3 items in the array that add to the value k

 
 */

func checkIfThereAreNumbers(array: [Int], k: Int) -> Bool {
    for i in 0...array.count {
        for j in 1...array.count {
            let difference = k - (array[i] + array[j])
            let differenceT = (array[i] + array[j]) - k
            if array.contains(difference) || array.contains(differenceT) {
                return true
            } else {
                return false
            }
        }
    }
    return false
}
checkIfThereAreNumbers(array: [2, 3, 4, 6, 5, 1, 3, 2], k: 7)


/*
 
 given an array of characters in order which form a three word sentence, reverse the sentence
 
 inputArray = [ 'p', 'e', 'r', 'f', 'e', 'c', 't', ' ',
                'm', 'a', 'k', 'e', 's', ' ',
                'p', 'r', 'a', 'c', 't', 'i', 'c', 'e' ]
 
 -->
 
 reurnArray = [ 'p', 'r', 'a', 'c', 't', 'i', 'c', 'e', ' ',
                'm', 'a', 'k', 'e', 's', ' ',
                'p', 'e', 'r', 'f', 'e', 'c', 't' ]
 
 
 join all the characters together, split them from the spaces, get the individual words, reverse them(rearanging the order), join them in a string, split them and get the individual characters
 
 */

func reverseWordsArray(arr: [Character]) -> [Character] {
    var splitWords = String(arr).split(separator: " ")              // the individual words stored in an array
    
    var reversedArray = [String]()
    reversedArray.append(String(splitWords[2]))
    reversedArray.append(String(splitWords[1]))
    reversedArray.append(String(splitWords[0]))                     // append the rearanged words in an array
    
    let joinedReversedArr = reversedArray.joined(separator: " ")    // join the words into a string seperated by a space
    var resultArray = [Character]()
    for item in joinedReversedArr {
        resultArray.append(item)                                    // append all the characters in the string into the array to keep the same format
    }
    return resultArray
    
}
reverseWordsArray(arr: ["p", "r", "a", "c", "t", "i", "c", "e", " ",
                    "m", "a", "k", "e", "s", " ",
                    "p", "e", "r", "f", "e", "c", "t"])



func reverseWordString(arr: [Character]) -> String {
    // we want to put al the words into an array.
    // then rearange the indexes
    // then join them into a string
    // then split al characters
    
    let individualWord = String(arr).split(separator: " ")          // return array of individual words
    
    var rearangedArr = [String]()                                   // rearanged array of words
    rearangedArr.append(String(individualWord[2]))
    rearangedArr.append(String(individualWord[1]))
    rearangedArr.append(String(individualWord[0]))
    
    var joined = ""                                                 // append the words to the string
    for word in rearangedArr {
        joined += word
        joined += " "
    }
    return joined
    
}
reverseWordString(arr: ["p", "r", "a", "c", "t", "i", "c", "e", " ",
                  "m", "a", "k", "e", "s", " ",
                  "p", "e", "r", "f", "e", "c", "t"])
