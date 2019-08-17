import UIKit

/*Given a string S and a string T, find the minimum window in S which will contain all the characters in T in complexity O(n)

Input: S = "ADOBECODEBANC", T = "ABC"
Output: "BANC"
 */

func minimumWindow(s: String, t: String) -> String {
    
    var leftIndex = 0
    var rightIndex = t.count - 1
    var window: String? = nil
    
    while leftIndex < s.count - 1 && rightIndex <= s.count - 1 {
        
        if window != nil {
            leftIndex += 1
            rightIndex += 1
        }
        print(window)
        let checkString = s.dropFirst(leftIndex).prefix(rightIndex + 1)
        print(checkString)
        if !checkString.contains("A") && !checkString.contains("B") && !checkString.contains("C") {   // come back to this
            rightIndex += 1
        } else {
            if checkString.count < window!.count {
                window = String(checkString)
            }
        }
    }
    
    return window ?? ""
    
}
//minimumWindow(s: "ADOBECODEBANC", t: "ABC")


func action(string: String) {
    print("From the function: \(string)")
}
action(string: "Hello")


var actionClosure: (String) -> () = { s in
    print("From the function: \(s)")
}
actionClosure("hello closure")

var iLikeThis: (Int) -> Bool = { num in
    num % 2 == 0
}
iLikeThis(6)



func printSubstring(text: String, check: String) -> String {
    var index = 0
    
    for char in text {
        let currIndex = check.index(check.startIndex, offsetBy: index)
        
        if char == check[currIndex] {
            if index == check.count - 1 {
                return check
            }
            if (index + 1) < check.count {
                index += 1
            }
        } else {
            index = 0
        }
    }
    
    return ""
}

print(printSubstring(text: "Rinni", check: "in"))
