# Tech Interview

## [HackerRank Challenges](https://github.com/RinniSwift/tech-interviews/tree/master/HackerRankChallenges.playground)
check out some questions I went through along with solutions from HackerRank!

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


