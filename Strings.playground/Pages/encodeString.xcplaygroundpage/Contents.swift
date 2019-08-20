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

func compressString(str: String) -> String {
    
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
                return result
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
compressString(str: "aaabbccc")


//: [Next](@next)
