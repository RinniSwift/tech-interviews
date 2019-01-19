
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
