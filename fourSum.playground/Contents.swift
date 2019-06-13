import UIKit

/*
 
 - Problem
 
 Given an array of unsorted integers, arr, and a number, s, write a function that finds four numbers in arr that sum up to s.
 Note that there can be more than one quadruplet that add up but just return the first one found. If such a quadruple doesn't exiist, return an empty array.
 e.x. arr = [2, 7, 4, 0, 9, 5, 1, 3], s = 20 --> [0, 4, 7, 9]
 
 1. - First Solution
 loop through each number, have two pointers that start at 0 and 1, add them together and get the complement of that from s and find the other pair that can be found there.
 
 2. - Second Solution
 sort the array, grab the 4 items at the end, if they're greater than the sum, calculate the difference and shift the left index to the left accordingly
 
 */

func findArrayQuadruplet(arr: [Int], s: Int) -> [Int] {
    
}
