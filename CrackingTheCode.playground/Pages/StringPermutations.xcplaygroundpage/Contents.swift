/*
 
 Given two strings, check if both of them are permutations of each other.
 
 */

func stringIsPerm(strOne: String, strTwo: String) -> Bool {
    var dictOne = [ Character : Int]()
    var dictTwo = [Character : Int]()
    
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
