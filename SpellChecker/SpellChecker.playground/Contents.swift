import UIKit

public let dictionary: Set<String> = Set(["cats", "cat", "halo", "hello", "hell"])
public let vowels: Set<Character> = ["a", "e", "i", "o", "u"]  // count = v
public let consonants: Set<Character> = ["b", "c", "d", "f", "g", "h", "j", "k", "l", "m", "n", "p", "q", "r", "s", "t", "v", "w", "x", "y", "z"] // count = c


class SpellChecker {
    
    let vowels: Set<Character> = ["a", "e", "i", "o", "u"]
    
    func check(word: String) -> String? {
        // 1 edit distance
        
        if dictionary.contains(word) {
            return word
        }
        
        let splits = split(word)  // count = w
        
        // replace vowels with different vowels
        let replacedVowels = replaceVowels(splits: splits)
        guard replacedVowels == nil else { return replacedVowels }
        
        // replace letters with dif letters
        let replacesConstants = replaceConsonants(splits: splits)
        guard replacesConstants == nil else { return replacesConstants }
        
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
        
        for index in word.indices { // O(w) iterations
            allSplits.append((word[..<index], word[index...]))
        }
        
        return allSplits
    }
    
    
    private func replaceVowels(splits: [(Substring, Substring)]) -> String? {
        
        for split in splits { // O(w) iterations => O(w^2*v) overall
            let rightHand = split.1
            
            if vowels.contains(rightHand.first!) { // O(1)
                for vowel in vowels { // O(v) iterations => O(v*w) overall
                    var leftHand = split.0
                    let replaced = rightHand.replacingCharacters(in: ...rightHand.startIndex, with: String(vowel))  // O(w)
                    leftHand.append(contentsOf: replaced)
                    print(leftHand)
                    if dictionary.contains(String(leftHand)) { // O(1)
                        return replaced
                    }
                }
            }
        }
        return nil
    }
    
    
    private func replaceConsonants(splits: [(Substring, Substring)]) -> String? {
        
        for split in splits {
            let leftHand = split.0
            let rightHand = split.1
            
            if consonants.contains(rightHand.first!) {  // O(1)
                for cons in consonants { // O(c)
                    let str = String(rightHand)
                    var repl = str.replacingCharacters(in: ...str.startIndex, with: String(cons))
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
        
        for split in words { // O(w) iterations => O(w^2???) overall
            // ?
            guard split.1.count >= 2 else {
                continue
            }
            
            // ?
            let firChar = split.1.first!  // O(1)
            let secCharInd = split.1.index(split.1.startIndex, offsetBy: 1)  // O(w)??? -- need to look up
            let secChar = split.1[secCharInd]  // O(1)
            let swapped = Substring(String(secChar)) + Substring(String(firChar))

            // ?
            let thirdCharInd = split.1.index(split.1.startIndex, offsetBy: 2)  // O(w)???
            let rearranged = split.0 + swapped + split.1[thirdCharInd...]  // O(?)
            if dictionary.contains(String(rearranged)) {
                return String(rearranged)
            }
            
        }
        
        return nil
    }
}

let checker = SpellChecker()
checker.check(word: "helll")

