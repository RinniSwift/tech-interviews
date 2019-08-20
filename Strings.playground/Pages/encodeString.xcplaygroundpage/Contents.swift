//: [Previous](@previous)

/*
 
 given a string, encode the string to make it shorter and compressed
 
 input: "aaabbcccc"
 output: "a3b2c3"
 
 input: "aabaaac"
 output: "a2ba3c"
 
 */


func encodeString(str: String) -> String {
    
    var encodedStr: String = ""
    var currCount = 0
    var currChar: Character = "."
    
    for char in str {
        if char != currChar {
            // append to the encodedStr with or without the count
            if currCount > 1 {
                encodedStr += (String(currChar) + String(currCount))
            } else if currCount == 1 {
                encodedStr += String(currChar)
            }
            currChar = char
            currCount = 1
            
        } else {
            // increment the count
            currCount += 1
        }
    }
    
    if currCount > 1 {
        encodedStr += (String(currChar) + String(currCount))
    } else if currCount == 1 {
        encodedStr += String(currChar)
    }
    
    
    return encodedStr
}
encodeString(str: "aaabbcccc")



// Higher Order Function

func compressStringHOF(str: String) -> String {
    
    guard !str.isEmpty else { return "" }
    
    var currChar: Character = str.first!
    var currCount = 0

    let cmprStr = str.reduce(String(currChar)) { (result, char) in
        
        if char == currChar {
            currCount += 1
            return result
        } else {
            let prevCount = currCount
            
            if currCount == 1 {
                currChar = char
                return result + String(char)
            } else {
                currCount = 1
                currChar = char
                
                return result + String(prevCount) + String(char)
            }
        }
    }
    
    guard currCount != 1 else { return cmprStr }
    return cmprStr + String(currCount)
}
compressStringHOF(str: "aaabbccc")


// Iterative

func compressString(str: String) -> String {
    
    guard !str.isEmpty else { return "" }
    
    var currChar: Character = str.first!
    var currCount = 0
    var compressedStr: String = "\(currChar)"
    
    
    for char in str {
        
        if char == currChar {
            currCount += 1
            
        } else {
            guard currCount != 1 else { compressedStr += String(char); currChar = char; continue }
            compressedStr += (String(currCount) + String(char))
            currCount = 1
            currChar = char
        }
    }
    
    guard currCount != 1 else { return compressedStr }
    compressedStr += String(currCount)
    return compressedStr

}
compressString(str: "abbbbccc")





//: [Next](@next)
