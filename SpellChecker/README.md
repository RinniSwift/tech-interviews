# Spell Checker Algorithm
*Using the Damerau-Lavenshtein Distance to generate different possible corrections of a string*

File: [spellChecker.playground](https://github.com/RinniSwift/tech-interviews/blob/master/SpellChecker/SpellChecker.playground/Contents.swift)

### This algorithm includes 3 steps
1. Create global variables
	1. `dictionary`: word in the dictionary contained in a set
	2. `vowels`: all vowel characters contained in a set
	3. `consonants`: all consonant characters contained in a set

2. Create functions that will edit the incorrect word
	1. `split`: split the word into two pieces to be a helper function for other functions
	2. `replace`: replace 1 character in the string with different vowels or consonants
	3. `delete`: delete 1 character from every index of the string
	4. `transposition`: swap 2 neighbor characters at every index in the string

3. Create a main function that will call the 3 functions.\
The functions will return a string only if the edit was found in the dictionary. If it wasn't found across all operations, it will return nil. So we want to call functions in order of how we prioritize editing. I will be prioritizing edits with replacing vowels first, then replacing consonants, deleting a character, and finally transpositioning.

> **Note**\
> `replacingVowels` *and* `replacingConsonants` *are seperate functions because we want to prioritize mispelled words that are vowels before.*\
> All functions are case sensitive. Functions are preferred lower cased.\
> This approach does not include choosing between most suggested words.

---

## Global Variables

1. `dictionary`\
	A `Set` of words in the dictionary. This makes look up in the dictionary constant time Since sets are hashable.

2. `vowels`\
	A `Set` of vowels. This makes look up in the vowels set constant time.

3. `consonants`\
	A `Set` of consonants. This makes look up in the consonants set constant time.


## Functions


1. **Split**

```swift
func split(word: String) -> [(Substring, Substring)] { }
```

```swift
// Samples
"hello" -> [("", "hello"), ("h", "ello"), ("he", "llo"), ("hel", "lo"), ("hell", "o")]
"swift" -> [("", "swift"), ("s", "wift"), ("sw", "ift"), ("swi", "ft"), ("swif", "t")]
```

*Function takes in a string and returns all possible splitted strings from the word.*\
Loop through the word's index and cut it at each index seperating them into 2 substrings. Form these substrings into a tuple. Append them into an array of all splitted words and return that array.


2. **Replace**

```swift
func replaceVowels(splits: [(Substring, Substring)]) -> String? { }
```

```swift
// Samples
"hallo" // will generate: "hello", "hillo", "hollo", ..., "halla", "halle", "halli"
"calt" // will generate: "celt", "cilt", "colt", ...
```

*Function takes in the splitted words and returns one word that is found in the dictionary.*\
Loop through each splitted pair, if there is a character on the right side of the splitted pair, check if it is a vowel, if it is, loop through all the vowels and replace it with the existing vowel, each checking with the dictionary. If the word contains in the dictionary, return with the corrected word.


```swift
func replaceConsonants(splits: [(Substring, Substring)]) -> String? { }
```

```swift
// Samples
"hallo" // will generate: "bello", "cello", ..., "heblo", "heclo", ..., "helbo", "helco", ...
"calt" // will generate: "balt", "malt", ..., "caft", "cart", ..., "calb", "calf", ...
```

*Function takes in the splitted words and returns one word that is found in the dictionary.*\
Loop through each splitted pair, if there is a character on the right side of the splitted pair, check if it is a consonant, if it is, loop through all the consonants and replace it with the existing consonant, each checking with the dictionary. If the word contains in the dictionary, return with the corrected word.



3. **Delete**

```swift
func deletes(splits: [(Substring, Substring)]) -> String? { }
```

```swift
// Samples
"hello" // will generate: "ello", "hllo", "helo", "helo", "hell"
"swift" // will generate: "wift", "sift", "swft", "swit", "swif"
```

*Function takes in the splitted words, remove them from each index, and returns one word that is found in the dictionary*\
Loop through each splitted pair, remove the first character out of the right splitted pair and add it to an array. Loop through the array, check it with the dictionary if it does contain, return with the corrected word.



4. **Transposition**

```swift
func transpositions(splits: [(Substring, Substring)]) -> String? { }
```

```swift
// Samples
"hello" // will generate: "ehllo", "hlelo", "hello", "helol"
"swift" // will generate: "wsift", "siwft", "swfit", "switf"
```

*Function takes in the splitted words, swap places from every current index with the one next to it, and returns one word that is found in the dictionary*\
Loop through each splitted pair, make sure the right splitted pair contains more than or equal to two characters, swap the first character in the right splitted index and swap it with the right splitted string at index 2, append the swapped strings into an array. Loop over the array and check in the dictionary. If it contains, return the string else return nil.


## Main Function

```swift
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
   let replacesConstants = replaceConsonants(splits: splits)
   guard replacesConstants == nil else { return replacesConstants }
        
   // delete/drop one character
   let deleteds = deletes(splits: splits)
   guard deleteds == nil else { return deleteds }
        
   // transpose 2 characters in the string
   let transpos = transpositions(splits: splits)
   guard transpos == nil else { return transpos }
        
   // failed to create a correct word from 1 edit distance
   return nil
}
```

This function should be called on a whole string, without extra characters, symbols, and digits, and preferebally lower cased. It attempts to edit words and check up with the dictionary. If words are edited and found in the dictionary, this function returns immediately without calling other functions. And returns nil if the spell check did not edit words that are found in the dictionary.
