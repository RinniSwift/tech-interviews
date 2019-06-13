
/*
 
 - Problem
 
 Given an array, data, of data points, write a function findBusiestPeriod that returns the time at which the mall reached its busiest moment last year. The return value is the timestamp, e.g. 1480640292. Note that if there is more than one period with the same visitor peak, return the earliest one.
 
 input:  data = [ [1487799425, 14, 1],
                  [1487799425,  4, 0],
                  [1487799425,  2, 0],
                  [1487800378, 10, 1],
                  [1487801478, 18, 0],
                  [1487801478, 18, 1],
                  [1487901013,  1, 0],
                  [1487901211,  7, 1],
                  [1487901211,  7, 0] ]
 
        -> 1487800378
 
 - Brain Storm
 
 1. Solution
 keep a variable for keeping the time stamp that is the busiest moment
 keep a variable for keeping track of the total number of visitors as the time increases
 keep a variable for keeping track of the current highest number of users (to tell if time stamp should be updated)
 
 loop through each array in the data array
    if visitors entering, add number of visitors to the totalVisitors. Check if the total visitors was greater than the last. If so, update the time stamp.
    if visitors exiting, decrement the number of visitors to the totalVisitors. Check if the total visitors was greater than the last. If so, update the time stamp.
 
 */




func findBusiestPeriod(data: [[Int]]) -> Int {
    
    var curLargestTime = data[0].first!
    var totalVisits = 0
    
    for item in data {
        if item[2] == 1 {
            if totalVisits + item[1] > totalVisits {
                curLargestTime = item[0]
            }
            totalVisits += item[1]
            
        } else {
            
            if totalVisits - item[1] > totalVisits {
                curLargestTime = item[0]
            }
            totalVisits -= item[1]
            
        }
    }
    
    return curLargestTime
    
}

var data = [ [1487799425, 14, 1],
             [1487799425,  4, 0],
             [1487799425,  2, 0],
             [1487800378, 10, 1],
             [1487801478, 18, 0],
             [1487801478, 18, 1],
             [1487901013,  1, 0],
             [1487901211,  7, 1],
             [1487901211,  7, 0] ]
findBusiestPeriod(data: data)

// 14 10 8 18 0 18 17 24 17


/*
 Didn't pass:
 
 [[1487799425,14,1],
 [1487799425,4,0],
 [1487799425,2,0],
 [1487800378,10,1],
 [1487801478,18,0],
 [1487801478,18,1],
 [1487901013,1,0],
 [1487901211,7,1],
 [1487901211,7,0]]
 
 -> 1487800378
 
 */

