"""

given two list of characters find the longest matching combination.

 """

list_1 = ["r", "g", "e", "j", "q", "c", "m"]
list_2 = ["y", "w","x", "g", "a", "e", "j"]

def biggest_twins(list_1, list_2):
	temp_result = []
	final_result = []
 	# loop through the first list and compare it to the values in the second list
	for i, value_1 in enumerate(list_1): # could be a method in a class
		for j, value_2 in enumerate(list_2):
			if value_1 is value_2:
				temp_result.append([(value_1, i), (value_2, j)])



	if temp_result
	return temp_result
			
			






print(biggest_twins(list_1, list_2))
