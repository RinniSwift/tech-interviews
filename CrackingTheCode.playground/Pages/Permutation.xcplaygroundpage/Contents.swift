/*
 
 Given two strings, check if both of them are permutations of each other.
 
 */

func stringIsPerm(strOne: String, strTwo: String) -> Bool {
    var dictOne = [Character: Int]()
    var dictTwo = [Character: Int]()
    
    if strOne.count == strTwo.count {
        for item in strOne {
            if dictOne[item] == nil {
                dictOne[item] = 1
            } else {
                dictOne[item]! += 1
            }
        }
        
        for item in strTwo {
            if dictTwo[item] == nil {
                dictTwo[item] = 1
            } else {
                dictTwo[item]! += 1
            }
        }
        if dictOne == dictTwo {
            return true
        }
    } else {
        return false
    }
    return false
}
stringIsPerm(strOne: "noahw", strTwo: "onwah")




/*
 
 Find all the ways an string can be permutated
 
 get the index of the string
 
 - fix the first character by swaping the [0, 1, 2] index of the string
     - fix the following character. and replace that with the remaig index in the string [1, 2]

 
 */

func permutate(string: String) {
    var current = string
    var wordsArr = [Character]()
    for item in string {
        wordsArr.append(item)
    }
    
    for i in 0...string.count - 1 {
        
    }
}
permutate(string: "abc")


