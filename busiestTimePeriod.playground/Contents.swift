
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


/*
 
 2. Solution
 variable: busiestTime -- time stamp of the busiest time
 variable: totalVisits -- total visits during that time stamp
 variable: highVisits  -- highest number of visits in a timestamp (to check if having to update the busiestTime)
 
 loop through the indexes, increment or decrement the values to the totalVisits. If the next index is the same time stamp, continue to do that, else, check if the amount of visitors is greater than the highVisits. If so, update the time stamp and the highVisits to be the currents time
 
 */


func findBusiestPeriodCorrect(data: [[Int]]) -> Int {
    var busiestTime = data[0].first!
    var currTime = data[0].first!
    var totalVisits = 0
    var highestVisits = 0
    
    for i in 0..<data.count {
        if data[i][2] == 1 {
            
            totalVisits += data[i][1]
            if currTime == data[i][0] {
                highestVisits += data[i][1]
            } else {
                currTime = data[i][0]
            }
            if totalVisits > highestVisits {
                busiestTime = data[i][0]
            }
            
        } else {
            
            totalVisits -= data[i][1]
            if currTime == data[i][0] {
                highestVisits -= data[i][1]
            } else {
                currTime = data[i][0]
            }
            if totalVisits > highestVisits {
                busiestTime = data[i][0]
            }
            
        }
    }
    
    return busiestTime
}
findBusiestPeriod(data: data)








func findBusiestPeriodPramp(data: [[Int]]) -> Int {
    
    var curLargestTime = data[0].first!
    var totalVisits = 0
    var visitors = 0
    
    for item in data {
        if item[2] == 1 {
            
            totalVisits += item[1]
            if item[1] > visitors {
                visitors = item[1]
                curLargestTime = item[0]
            }
            
        } else {
            
            totalVisits -= item[1]
            if totalVisits > visitors {
                visitors = totalVisits
                curLargestTime = item[0]
            }
            
        }
    }
    
    return curLargestTime
    
}


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






var data1 = [ [1487799425, 14, 1],
             [1487799425,  4, 0],
             [1487799425,  2, 0],
             [1487800378, 10, 1],
             [1487801478, 18, 0],
             [1487801478, 18, 1],
             [1487901013,  1, 0],
             [1487901211,  7, 1]]

// WHITEBOARD SOLUTION

func busiestPeriod(data: [[Int]]) -> Int {
    var busiestTime = data[0].first!
    var currVisitors = 0
    var currTime = data[0].first!
    var highest = 0
    
    for item in data {
        
        if item == data[data.count - 1] {
            if item[0] == currTime {
                if item[2] == 1 {
                    currVisitors += item[1]
                } else {
                    currVisitors -= item[1]
                }
            } else {
                currTime = item[0]
                if item[2] == 1 {
                    currVisitors += item[1]
                } else {
                    currVisitors -= item[1]
                }
            }
            
            if currVisitors > highest {
                return item[0]
            }
        }
        
        if item[0] == currTime {
            if item[2] == 1 {
                currVisitors += item[1]
            } else {
                currVisitors -= item[1]
            }
        } else {
            if currVisitors > highest {
                busiestTime = currTime
                highest = currVisitors
            }
            currTime = item[0]
            if item[2] == 1 {
                currVisitors += item[1]
            } else {
                currVisitors -= item[1]
            }
        }
    }
    return busiestTime
}
busiestPeriod(data: data1)
