/*
 
 Given an array, data, of data points, write a function findBusiestPeriod that returns the time at which the mall reached its busiest moment last year. The return value is the timestamp, e.g. 1487800378. Note that if there is more than one period with the same visitor peak, return the earliest one.
 
 input:  data = [ [1487799425, 14, 1],
                  [1487799425, 4,  0],
                  [1487799425, 2,  0],
                  [1487800378, 10, 1],
                  [1487801478, 18, 0],
                  [1487801478, 18, 1],
                  [1487901013, 1,  0],
                  [1487901211, 7,  1],
                  [1487901211, 7,  0] ]
 
 output: 1487800378  since the increase in the number of people in the mall is the highest at that point
 
 */

func findBusiestPeriod(data: [[Int]]) -> Int {
    var currBussiest = 0
    var dict = [Int: Int]()
    
    for item in data {
        if dict[item[0]] == nil {
            if item[2] == 1 {
                dict[item[0]] = item[1]
            } else {
                dict[item[0]] = -(item[1])
            }
        } else  {
            if item[2] == 1 {
                dict[item[0]]! += item[1]
            } else {
                dict[item[0]]! -= item[1]
            }
        }
    }
    
    var currentHigh = 0
    for item in dict {
        if item.value > currentHigh {
            currentHigh = item.value
        }
    }
    for item in dict {
        if item.value == currentHigh {
            return item.key
        }
    }
    return 0
}
findBusiestPeriod(data: [ [1487799425, 14, 1],
                          [1487799425, 4,  0],
                          [1487799425, 2,  0],
                          [1487800378, 10, 1],
                          [1487801478, 18, 0],
                          [1487801478, 18, 1],
                          [1487901013, 1,  0],
                          [1487901211, 7,  1],
                          [1487901211, 7,  0] ])


