import UIKit

/*
 Given an array of strings, group anagrams together.
 
 Example:
 
 Input: ["eat", "tea", "tan", "ate", "nat", "bat"],
 Output:
 
 [["ate","eat","tea"],
   ["nat","tan"],
   ["bat"]]
 
 */


func groupAnagrams(strings: [String]) -> [[String]] {
    
    var allWords = [[String]]()
    var dict = [Set<Character>: [String]]()
    
    for word in strings {
        
        if dict[Set(word)] != nil {
            dict[Set(word)]?.append(word)
        } else {
            dict[Set(word)] = [word]
        }
    }
    
    for item in dict.values {
        allWords.append(item)
    }
    
    return allWords
}

print(groupAnagrams(strings: ["eat", "tea", "tan", "ate", "nat", "bat", "aba", "abb"]))
