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
 
 */

func longestPalindrome(from string: String) {
    // 1. create a histogram
    // 2. loop over the string
    // 3. create a string, if there is more than two counts, add two of those characters to the string, decrement 2 out of the count histogram
    // 4. if there is 1 count, skip the character.
    
    var histogram = [Character: Int]()
    
    for char in string {
        if histogram[char] == nil {
            histogram[char] = 1
        } else {
            histogram[char]! += 1
        }
    }
    print(histogram)
}
longestPalindrome(from: "babad")


