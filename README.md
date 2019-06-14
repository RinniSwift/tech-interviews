# Tech Interview

## Pramp
1. [busiestTimePeriod.playground](https://github.com/RinniSwift/tech-interviews/blob/master/busiestTimePeriod.playground/Contents.swift)
*find buiest time in a set of data which has a time stamp, visitors, and exit/enter*
2. [fourSum.playground](https://github.com/RinniSwift/tech-interviews/blob/master/fourSum.playground/Contents.swift)
*return 4 numbers that add up to the sum*

---

## LeetCode
*Hard Questions*
1. [medianOfTwoArrays.playground](https://github.com/RinniSwift/tech-interviews/blob/master/medianOfTwoArrays.playground/Contents.swift)
*find the median of two sorted arrays combined together. [SPD]*
---
*Medium Questions*
1. [romanNumbers.playground](https://github.com/RinniSwift/tech-interviews/blob/master/romanNumbers.playground/Contents.swift)
*involves indexing strings, returning numbers from roman numeral*
2. [spiralMatrix.playground](https://github.com/RinniSwift/tech-interviews/blob/master/spiralMatrix.playground/Contents.swift)
*matrix question returning array of numbers in spiral order*
3. [largestContainerSize.playground](https://github.com/RinniSwift/tech-interviews/blob/master/largestContainerSize.playground/Contents.swift)
*involves searching for the largest container from an array of blocks*
4. [jumpingToLast.playground](https://github.com/RinniSwift/tech-interviews/blob/master/jumpingToLast.playground/Contents.swift)
*return true if the items can jump to the last index*
5. [firstToLastIndex.playground](https://github.com/RinniSwift/tech-interviews/blob/master/firstLastIndexOfTarget.playground/Contents.swift)
*find start and last index that the target number occurred*
6. [longestSubstring.playground](https://github.com/RinniSwift/tech-interviews/blob/master/longestSubString.playground/Contents.swift)
*find the longest length of a unique substring from a string. [SPD]*
---
*Easy Questions*
1. [twoSum.playground](https://github.com/RinniSwift/tech-interviews/blob/master/twoSum.playground/Contents.swift)
*return bool, indexes, all indexes, of two numbers that add up to the target number*
2. [ransomNote.playground](https://github.com/RinniSwift/tech-interviews/blob/master/ransomNote.playground/Contents.swift)
*return true if the second string can be created from the first string*
3. [firstUniqueIndex.playground](https://github.com/RinniSwift/tech-interviews/blob/master/findFirstUniqueStrIndex.playground/Contents.swift)
*returns the first index of a unique letter in a string*

## [Arrays.playground](https://github.com/RinniSwift/tech-interviews/blob/master/Arrays.playground/Contents.swift)
*The above file demonstrates*
1. return the highest product of 3 numbers from a given array
2. rotate an array to the right by k amount of times
3. given two arrays, return the items that contain in both arrays
4. given two arrays, compute their intersections (X)
5. given an array of integers, add 1 to it and return the result number in an array format
6. given a matrix containg 0's and 1's, return a boolean indicating whether there is a path of 0's
7. given an array and a limit, find the two indices that add up to that number
8. given two arrays, return items that contain in both arrays
9. given an array, return the product of every item except the item at index i
10. given an array of duplicates, return only the numbers once
11. reverse the array that contains characters that form a sentence.
12. given an array of numbers, return the peak.

## [Tech-Interview-New.playground](https://github.com/RinniSwift/tech-interviews/blob/master/Tech-Interview-New.playground/Contents.swift)
*The above file demonstrates:*
1. create a Queue with the following functions: 
	pop: removes the item out of the queue.
	push: inserts item into the queue.
	peek: returns the top element on the stack.
	isEmpty: returns true if there are no elemnts in the stack.
	max: returns the max value in the stack.
2. return an array of integers that are the product of every item in a given int array but itself.
3. return an array of similar items from both arrays with O(1) space complexity and O(n) of run time.
4. given string one and string two, find the minimum window in string one which will contain all the characters in string two. *"ADOBECODEBANC", "ABC" -> "BANC"*
5. given 2d array of ones and zeros, where ones represent islands and zeros represent water, find the height of the island if there can only be one island. return height and width in tuple values.
6. rotate an array of ints k times. 

## [LinkedList.playground](https://github.com/RinniSwift/tech-interviews/blob/master/LinkedList.playground/Contents.swift)
*The above file demonstrates:*
1. creating a Node and LinkedList class that conforms to the *Equatable* protocol
2. isEmpty() returns bool indicating linked lists items
3. items() returns an array of all items' data
4. append() appends item to the linked list. takes value parameter
5. prepend() prepends item to the linked list. taked value parameter
6. delete() deletes the node with that value specified
7. replace() replaces old items value to new value. takes in two parameters: old value and new value.

## [HashTable.playground](https://github.com/RinniSwift/tech-interviews/blob/master/HashTable.playground/Contents.swift)
*The above file demonstrates:*
1. Node and LinkedList class from [linkedlist.playground](https://github.com/RinniSwift/tech-interviews/blob/master/LinkedList.playground/Contents.swift)
2. creating a HashElement class which has two parameters, key which conforms to the hashable and value. which conform to the Equatable protocol.
3. creating a HashTable class which has two types, Key: Hashable and Value. initializing hashtable has 1 parameter: size.
4. buckets variable which contains an array of linkedlist of type HashElement<Key, Value>
5. bucketIndex() returns Int indicating the bucket index
6. keys() returns all keys in the hashtable
7. values() returns all values in the hashtable
8. items() returns all key-value pairs in the hashtable
9. set() insert the given key and value to the hashtable. takes two parameters: key and value

## [HackerRank Challenges Playground](https://github.com/RinniSwift/tech-interviews/blob/master/HackerRankChallenges.playground/Contents.swift)
check out some questions from HackerRank that I went through along with solutions!

## [tech-interview.playground](https://github.com/RinniSwift/tech-interviews/blob/master/tech-interview.playground/Contents.swift)
**solutions to the algorithm and data structure questions in tech-interview.playground**

1. List the values in an array that contains the exact order in the other array.

``` swift
["a", "b", "c", "f", "h", "y"]
["c", "f", "d", "h", "w"]
-> ["c", "f"]
```

we want to loop through all the items in the first array and see if that item is in the second array. if it is, the check the next item from the first and second array if they are equal. if is, append to the output array.

2. Given an array of numbers, return the second largest number

2.1 used a tuple to store the highest two numbers and looped through the array to update the values.
Sort the number array and index the item before the last in the sorted array.

3. Given an array of ints, return the largest product of three numbers

we should sort the array, and multiply the last three items since those will be the largest numbers and return that value.
An edge case would be when the array contains 2 or more negative numbers which can be larger. In this case, we use the same sorted array and multiply the first two numbers in the array with the last and compare the values

4. Given an array of duplicate ints, return the the unique number

one way is to keep a count for all numbers in the input array. We would update the count by loop through the array and add it to another array where we would be comparing the input array with the new array so if the new array contains the item in the input array, we increment the count by 1(this means that the number has been repeated one time) then we should return the number with the count of 1 which will be the unque number.

second way is to use a dictionary with the key being the number and the value being the count of times it has been seen in the array. we loop through the numbers in the input array and check to see if there's a same value in the dictionaries key. if not, we append it to the dictionary with the value of 1. But if there is a same value, we increment the count(value) by 1. after the loop, we simply return the key with the value of 1 which means it has been seen once.

5. Given an array of ints and a value k, find the pairs that add up to k

one implementation would be by using a set. create a set which will contain all the unique numbers of the array. Loop through the set and calculate the complement to k and store it in a new constant. we then check if the set contains that constant, if so, store the number and complement of it in a new dictionary. We then have to remove the item out of the set as well as the complement number.

edge case would be if there are duplicate numbers which add up to k. In this case we would sort the array and keep a counter on each edge of the array. if both of them add up, we return the numbers, if not, the complement is bigger than the number given, we reduce the pointer at the right side of the array which will point to a lower number.


