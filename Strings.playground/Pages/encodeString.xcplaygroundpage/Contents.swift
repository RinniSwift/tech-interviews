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


//: [Next](@next)
