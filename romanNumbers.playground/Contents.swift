import UIKit

/*
 
 Roman numerals are represented by seven different symbols: I, V, X, L, C, D and M.
 
 Symbol       Value
 I             1
 V             5
 X             10
 L             50
 C             100
 D             500
 M             1000
 
 Input: "III"
 Output: 3
 
 Input: "IX"
 Output: 4
 
 */


func returnNumber(romanNumbers: String) -> Int {
    
    let romanValues = ["I": 1, "V": 5, "X": 10, "L": 50, "C": 100, "D": 500, "M": 1000]
    var result: Int = 0
    
    guard romanNumbers.count > 1 else {
        return romanValues[romanNumbers]!
    }
    
    for index in 0...(romanNumbers.count - 2) {
        let charIndex = romanNumbers.index(romanNumbers.startIndex, offsetBy: index)
        let char = romanNumbers[charIndex]
        let number = romanValues[String(char)]
        
        let nextCharIndex = romanNumbers.index(romanNumbers.startIndex, offsetBy: index + 1)
        let nextChar = romanNumbers[nextCharIndex]
        let nextNum = romanValues[String(nextChar)]
        
        if nextNum! > number! {
            result -= number!
        } else {
            result += number!
        }
        
        if index + 2 >= romanNumbers.count {
            result += nextNum!
        }
    }
    
    return result
}
returnNumber(romanNumbers: "IXX")
