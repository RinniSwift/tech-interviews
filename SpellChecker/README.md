# Spell Checker Algorithm
*Using the Damerau-Lavenshtein Distance to generate different possible corrections of a string*\

File: [spellChecker.playground](https://github.com/RinniSwift/tech-interviews/blob/master/SpellChecker/SpellChecker.playground/Contents.swift)


**Functions**


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
"hallo" -> Optional("hello")
"calt" -> Optional("cult")
```

*Function takes in the splitted words and returns one word that is found in the dictionary.*\
Loop through each splitted pair, if there is a character on the right side of the splitted pair, check if it is a vowel, if it is, loop through all the vowels and replace it with the existing vowel, each checking with the dictionary. If the word contains in the dictionary, return with the corrected word.



3. **Delete**

```swift
func deletes(words: [(Substring, Substring)]) -> String?
```

```swift
// Samples
"hello" // will generate: "ello", "hllo", "helo", "helo", "hell"
"swift" // will generate: "wift", "sift", "swft", "swit", "swif"
```

*Function takes in the spitted words, remove them from each index, and returns one word that is found in the dictionary*\
Loop through each splitted pair, remove the first character out of the right splitted pair and add it to an array. Loop through the array, check it with the dictionary if it does contain, return with the corrected word.
