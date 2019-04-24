import UIKit

var str = "Hello, playground"

/*
 The first line contains two space-separated integers, m  and , n the numbers of words in the  and the note.
 The second line contains m space-separated strings, each magazine[i] .
 The third line contains n space-separated strings, each note[i] .
 

 */
func checkMagazine(magazine: [String], note: [String]) -> Void {
    
    var dictOfWords = [String: Int]()
    
    for word in magazine {
        if dictOfWords.keys.contains(word) {
            dictOfWords[word]! += 1
        } else {
            dictOfWords[word] = 1
        }
    }
    for wordPiece in note {
        if dictOfWords.keys.contains(wordPiece) {
            if dictOfWords[wordPiece]! <= 0 {
                dictOfWords[wordPiece]! -= 1
                print("No")
                return
            }
            dictOfWords[wordPiece]! -= 1
        } else {
            print("No")
            return
        }
    }
    
    print("Yes")
}
