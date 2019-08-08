import UIKit

public let dictionary: Set<String> = Set(["cats", "cat", "halo", "hello", "hell"])
public let vowels: Set<Character> = ["a", "e", "i", "o", "u"]


class SpellChecker {
    
    let vowels: Set<Character> = ["a", "e", "i", "o", "u"]
    
    func check(word: String) -> String? {
        // 1 edit distance
        
        if dictionary.contains(word) {
            return word
        }
        
        let splits = split(word)
        
        // replace vowels with different vowels
        let replacedVowels = replaceVowels(splits: splits)
        guard replacedVowels == nil else { return replacedVowels }
        
        // replace letters with dif letters
        
        // delete/drop one character
        let deleteds = deletes(words: splits)
        guard deleteds == nil else { return deleteds }
        
        // transpose 2 characters in the string
        let transpos = transpositions(words: splits)
        guard transpos == nil else { return transpos }
        
        // failed to create a correct word from 1 edit distance
        return nil
    }
    
    
    
    
    private func split(_ word: String) -> [(Substring, Substring)] {
        var allSplits = [(Substring, Substring)]()
        
        for index in word.indices {
            allSplits.append((word[..<index], word[index...]))
        }
        
        return allSplits
    }
    
    private func replaceVowels(splits: [(Substring, Substring)]) -> String? {
        
        for split in splits {
            let leftHand = split.0
            let rightHand = split.1
            
            if vowels.contains(rightHand.first!) {
                // loop through all vowels and replace the first character of the righthand string
                for vowel in vowels {
                    let str = String(rightHand)
                    var repl = str.replacingCharacters(in: ...str.startIndex, with: String(vowel))
                    repl.insert(contentsOf: String(leftHand), at: repl.startIndex)
                    if dictionary.contains(repl) {
                        return repl
                    }
                }
            }
        }
        return nil
    }
    
    private func deletes(words: [(Substring, Substring)]) -> String? {
        
        let deletes = words.map {
            $0.0 + $0.1.dropFirst()
        }
        
        for item in deletes {
            if dictionary.contains(String(item)) {
                return String(item)
            }
        }
        
        return nil
    }
    
    private func transpositions(words: [(Substring, Substring)]) -> String? {
        
        var allTransposotions = [String]()
        
        for split in words {
            guard split.1.count >= 2 else {
                continue
            }
            
            let firChar = split.1.first!
            let secChar = split.1[split.1.index(split.1.startIndex, offsetBy: 1)]
            
            let rearanged = split.0 + Substring(String(secChar)) + Substring(String(firChar)) + split.1[split.1.index(split.1.startIndex, offsetBy: 2)...]
            allTransposotions.append(String(rearanged))
            
        }
        
        for transpoWord in allTransposotions {
            if dictionary.contains(transpoWord) {
                return transpoWord
            }
            
        }
        
        return nil
    }
}

let checker = SpellChecker()
checker.check(word: "helll")

