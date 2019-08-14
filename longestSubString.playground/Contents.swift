
/*
 
 Given a string, find the length of the longest substring without repeating characters
 
 1. - Restating the problem
 
 So I have to write a function that takes in a string and then return the length of the longest substring that doesn't contain any repeating letters.
 
 
 2. - Ask clarifying questions
 
 . Does repeating characters have to be case sensitive where a != A?
 
 
 3. - Assumptions on the question
 
 . Can I assume the input string will always be lower cased? (no)
 . Can I assume to return the length of 0 if there are no characters in the string input? (yes)
 . Assuming it will return 0 for inputs that are empty strings
 . Can I assume a substring can equal the full string input's length? (yes)
 
 4. - Think out loud
 
 . The first solution that came to mind was to loop through the string, and while we're looping through it, check if the letter contains in a set--assuming I had already created an empty set--and if it does not contain in it, increment the count variable by one--assuming I had already created a count variable which starts at 0--if the letter does contain in the set, check if the count is greater than the highest count variable--which we initialize as 0--if it is greater, replace the count with that. and if it isnt greater then keep its highest count and remove all items in the set except itself and update the count back down to 1. This may seem confusing so let me draw it out.
 
     'abcabcbb' -> 3
 
     currCount = 0,
     highestCount = 0,
     set = Set<Character>()
 
     In the for loop:
 
     'abcabcbb'
      ^
     set = [a]
     currCount = 1
 
     'abcabcbb'
        ^
     set = [a, b, c]
     currCount = 3
 
     'abcabcbb'
         ^
     set = []
     currCount = 1
     highestCount = 3
 
 
 So with this solution that I created a set, it allows me to check with the characters previously with constant lookup time. However I had to loop through all the characters in the string which is O(n) run time. And creating a new set would be O(n) space complexity where n would be the amount of unique characters (longest unique string)
 
 Let me try to implement this solution and I'll se how i can improve it later.
 
 */

// 5. - Implementation

func longestSubstring(string: String) -> Int {
    
    var set = Set<Character>()
    
    var highestCount = 0
    var currCount = 0
    
    for char in string {
        if set.contains(char) {
            if currCount > highestCount {
                highestCount = currCount
            }
            currCount = 1
            set = [char]
        } else {
            set.insert(char)
            currCount += 1
            if currCount > highestCount {
                highestCount = currCount
            }
        }
    }
    return highestCount
}
longestSubstring(string: "")   // 0
longestSubstring(string: " ")    // 1
longestSubstring(string: "bbbbb")   // 1
longestSubstring(string: "abcabcbb")   // 3


longestSubstring(string: "dvdf")   // 3
longestSubstring(string: "bbbbb")  // 1
longestSubstring(string: "pwwkew")  // 3


// second solution. Loop through the indexes, since we have to reverse back to the index that it has started at since found the repeated character.

func lengthOfLongestSubstring(_ s: String) -> Int {
        
    var highestCount = 0
    var currCount = 0
    
    var seenChar = Set<Character>()
    var currInd = 0
    
    while currInd < s.count {
        
        let index = s.index(s.startIndex, offsetBy: currInd)
        let character = s[index]
        if seenChar.contains(character) {
            
            seenChar.removeAll()
            currInd = (currInd - currCount) + 1
            currCount = 0
            
        } else {
            seenChar.insert(character)
            currInd += 1
            currCount += 1
            if currCount > highestCount {
                highestCount = currCount
            }
        }
    }
    
    return highestCount
}

lengthOfLongestSubstring("pwwkew") // 3
lengthOfLongestSubstring("bbbbb")  // 1
lengthOfLongestSubstring(" ") // 1
lengthOfLongestSubstring("") // 0
lengthOfLongestSubstring("abcabcbb") // 3
