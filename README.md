# Tech Interview
## tech-interview.playground
**solutions to the algorithm and data structure questions in tech-interview.playground**

1. list the values in an array that contains the exact order in the other array.
	["a", "b", "c", "f", "h", "y"]
	["c", "f", "d", "h", "w"]
	-> ["c", "f"]

	we want to loop through all the items in the first array and see if that item is in the second array. if it is, the check the next item from the first and second array if they are equal. if is, append to the output array.