
/*
 
 palindrome: the word is read the same backwords
 
 */

func isPalindrome(string: String) -> Bool {

    // remove all the spaces in the string
    // reverse the string if it is equal to the input
    
    var stringArray = [Character]()
    
    for letter in string {
        if letter != " " {
            stringArray.append(letter)
        }
    }
    
    if stringArray.reversed() == stringArray {
        return true
    }
    
    return false
}
isPalindrome(string: "hannah")



/*
 
   +++ check if a number is read the same backwards
        implementing with the string format and without using a string
 
 */

func numberIsPalindrom(number: Int) -> Bool {
    let stringNum = String(number)
    if String(number) == String(stringNum.reversed()) {
        return true
    } else {
        return false
    }
    /*
     if number.description == String(number.description.reversed()) {
        return true
     } else {
        return false
     }
    */
}
numberIsPalindrom(number: 1221)

func numberIsPalindromeTwo(num: Int) -> Bool {
    var number = num
    var reversednumber = 0
    while number > 0 {
        let remainder = number % 10
        reversednumber = (reversednumber * 10) + remainder
        number = number / 10
        
    }
    if reversednumber == num {
        return true
    } else {
        return false
    }
    
    
}
numberIsPalindromeTwo(num: 121)

