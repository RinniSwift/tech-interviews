



func checkPal(str: String) -> Bool {
    
    var dict = [Character: Int]()
    var countOdd = 0
    
    for letter in str {
        if letter != " " {
            if dict[letter] == nil {
                dict[letter] = 1
            } else {
                dict[letter]! += 1
            }
        }
    }
    
    for item in dict {
        if item.value % 2 != 0 {
            countOdd += 1
        }
    }
    
    if countOdd >= 2 {
        return false
    } else {
        return true
    }
    return false
}

checkPal(str: "red pepper")
checkPal(str: "tact coa")
checkPal(str: "race car")
checkPal(str: "wwo")
