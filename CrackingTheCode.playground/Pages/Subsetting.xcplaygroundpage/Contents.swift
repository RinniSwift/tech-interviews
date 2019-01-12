/*
 
 Given two strings, check if the first or second is a subset of the other
 
 
 
 "sarin" --- "rain"   -> true
 
 if all the letters in the second string is contained in the first string, we return true
 loop through the letter in the one that count is less than the other
 check if the letter contains in the other string, keep a count
 
 if word counts are the same, 
 
 */

func isSubstring(strOne: String, strTwo: String) -> Bool {
    var strO = strOne
    var strT = strTwo
    var count = 0
    if strOne.count > strTwo.count {
        for item in strTwo {
            if strO.contains(item) {
                count += 1
                strO.remove(at: strO.index(of: item)!)
            }
        }
        if count == strTwo.count {
            return true
        } else {
            return false
        }
    } else if strOne.count < strTwo.count {
        for item in strOne {
            if strT.contains(item) {
                count += 1
                strT.remove(at: strT.index(of: item)!)
            }
        }
        if count == strOne.count {
            return true
        } else {
            return false
        }
    } else if strOne.count == strTwo.count {
        if strO.sorted() == strT.sorted() {
            return false
        }
    }
    return false
}
isSubstring(strOne: "sarin", strTwo: "naris")
