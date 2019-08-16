import UIKit

/*
 
 Given a string s, find the longest palindromic substring in s. You may assume that the maximum length of s is 1000.
 
 e.g.1
 Input: "babad"
 Output: "bab"
 Note: "aba" is also a valid answer.
 
 e.g.2
 Input: "cbbd"
 Output: "bb"
 
 Clarifying questions:
 . when checking, is it case sensitive
 . is the input lower case
 
 */

func longestPalindrome(from s: String) -> Substring {
    // window frame approach
    
    // start from s.startIndex,s.endIndex
    // check the characters at each end, if they're not equal, shift the startIndex up
    // if it can't find, loop again and shift the endIndex down.
    
    var start = s.startIndex
    var end = s.index(before: s.endIndex)
    
    var palindrome: Substring = ""
    
    
    while start <= end {
//        print("character at start: \(s[start]). character at end: \(s[end])")
        if s[start] == s[end] {
            print("EQUAL: character at start: \(s[start]). character at end: \(s[end])")

            if start == end {
                palindrome.insert(s[start], at: palindrome.index(palindrome.startIndex, offsetBy: palindrome.count / 2))
                return palindrome
            }

            palindrome.insert(s[start], at: palindrome.index(palindrome.startIndex, offsetBy: palindrome.count / 2))
            palindrome.insert(s[end], at: palindrome.index(palindrome.startIndex, offsetBy: palindrome.count / 2))
            print(palindrome)
            
            start = s.index(after: start)
            end = s.index(before: end)

        } else {
            print("NOT EQUAL: character at start: \(s[start]). character at end: \(s[end])")
            
            
            start = s.index(after: start)
            palindrome.removeAll()
        }

    }
    
    return ""
    
}
longestPalindrome(from: "babbab")




func isPalindrome(word: String) -> Bool {
    
    var startNum = 0
    var endNum = word.count - 1
    
    while startNum <= (word.count / 2) && endNum >= (word.count / 2) {
        let startInd = word.index(word.startIndex, offsetBy: startNum)
        let endInd = word.index(word.startIndex, offsetBy: endNum)
        
        if word[startInd] == word[endInd] {
            startNum += 1
            endNum -= 1
        } else {
            return false
        }
    }
    
    return true
}
isPalindrome(word: "rinnir")




