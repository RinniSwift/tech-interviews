

/*
 
 Given a sorted list of integer ranges (see Range in Use Me), merge all overlapping ranges.
 
 e.x.
 Input  : [[1,10], [5,8], [8,15]]
 Output : [[1,15]]
 
 */

/*
 
 - Restate the problem:
 
 I'm given an array of ranges. Each range is within an array where the first item is the starting range and the last item is the end of the range. And the return value is a range that includes in all the given ranges
 
 
 - Ask clarifying questions
 
 . The ranges are given in an array format where there will only be 2 values?
 
 
 - State your assumptions
 
 . I assume there can contain negative values
 . I assume that the first item in the range is the starting value
 . I assume that the last item in the range is the ending value
 
 - Think out loud
 
    - Brainstorm solutions
 . I'm thinking of keeping two values; one which will be the starting range, one which will be the ending range.
 I loop through each range and check the starting range; if it's greater than the current, don't change. If it's less than the current, update the starting range value. Then check the ending range; if it's less than the current, don't change. If it's greater than the current, update the ending range value.
 
    - Explain your rational
 . This makes run time O(n) by looping over all ranges. and just updating 2 values as we loop through.
 
    - Discuss tradeoffs
 
    - Suggest improvements
 
 
*/


// instantiate the starting variable at the first items starting range
// instantiate the ending variable at the first items ending range
// loop through each range item
// check if item at 0 is less than the starting variable, if so, update to that value
// check if item at 1 is greater than the ending variable, if so, update to that value

func mergeRanges(arr: [[Int]]) -> [Int] {
    
    var starting = arr[0][0]
    var ending = arr[0][1]
    
    for rangeItem in arr {
        print(rangeItem)
        if rangeItem[0] < starting {
            starting = rangeItem[0]
        }
        if rangeItem[1] > ending {
            ending = rangeItem[1]
        }
    }
    
    return [starting, ending]
}
mergeRanges(arr: [[1,10], [5,8], [8,15]])
