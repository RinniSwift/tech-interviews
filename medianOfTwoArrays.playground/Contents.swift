
/*
 
 - Problem
 
 There are two sorted arrays nums1 and nums2 of size m and n respectively.
 Find the median of the two sorted arrays.
 You may assume nums1 and nums2 cannot be both empty.
 
 
 1. - Restating the problem
 
 So this function should take in 2 parameters which are arrays of integers that are sorted. And I should return the median of both the arrays. And median meaning the value that is in the middle of the structure so in this case would be both the arrays combined in sorted order.
 
 
 2. - Ask clarifying questions
 
 . Are all the numbers positive integers? (no)

 
 3. - Assumptions on the question
 
 . I assume there can be an empty input array (yes)

 
 4. - Think out loud
 
 . The solution I came up with was to check the last and first values of each input array, and check if they align perfectly to be sorted when they are combined together. If so, get the total count of items in the array and index them. If not, then check the one that starts lower and indicate how many elements added and the index.
 
 . join the two arrays together with merge sort and then get the middle index
 
 */

// 5. - Implementation

