import UIKit


class SpellChecker {
    
    public let dictionary: Set<String> = Set(["cats", "cat", "halo", "cake", "helol"])
    
    let vowels: Set<Character> = ["a", "e", "i", "o", "u"]
    
    func findCorrectWord(_ forWord: String) -> String? {
        
        let splits = split(word: forWord)
        
        let replaces = replaceVowels(words: splits)
        if replaces != nil {
            return replaces
        }
        
        let deleteds = deletes(words: splits)
        if deleteds != nil {
            return deleteds
        }
        
        let transpos = transpositions(words: splits)
        if transpos != nil {
            return transpos
        }
        
        return nil
    }
    
    private func split(word: String) -> [(Substring, Substring)] {
        var allSplits = [(Substring, Substring)]()
        
        for index in word.indices {
            allSplits.append((word[..<index], word[index...]))
        }
        
        return allSplits
    }
    
    private func replaceVowels(words: [(Substring, Substring)]) -> String? {
        
        for split in words {
            let leftHand = split.0
            let rightHand = split.1
            
            if vowels.contains(rightHand.first!) {
                for vowel in vowels {
                    guard vowel != rightHand.first else {
                        continue
                    }
                    
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
checker.findCorrectWord("hello")
