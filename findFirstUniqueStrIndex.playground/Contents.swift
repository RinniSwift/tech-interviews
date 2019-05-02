import UIKit

/*
 
 Given a string, find the first non-repeating character in it and return it's index. If it doesn't exist, return -1.
 
*/

// loop over string
// create empty dictionary: key being the letter, value being the frequency of occurence
// "leetcode"   ->  0
//



// "leetcode"   ->  0
// ["l": (1, 0), "e": (3, 1), "t": (1, 3), "c": (1, 4), "o": (1, 6), "d": (1, 7)]
//
// if letter is in the dictionary: DO NOTHING
// if letter is not: APPEND letter: (count, index)

func firstUniqueIndex(string: String) -> Int {
    var dict = [Character: (Int, Int)]()
    
    for (index, letter) in string.enumerated() {
        if dict.keys.contains(letter) {
            // change the value to increment the count by 1 but same index
            let value = dict[letter]
            let newValue = (value!.0 + 1, value?.1)
            dict[letter] = newValue as! (Int, Int)
        } else {
            // create entry
            dict[letter] = (1, index)
        }
    }
    
    var smallestIndex = string.count - 1
    for value in dict.values {
        if value.0 == 1 {
            if value.1 <= smallestIndex {
                smallestIndex = value.1
            }
        }
    }
    
    return smallestIndex
}
firstUniqueIndex(string: "leetcode")
firstUniqueIndex(string: "loveleetcode")
