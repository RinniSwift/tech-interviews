

// Normal iterating
func fiboSequence(times: Int) -> [Int] {
    var seq = [Int]()
    
    var state = (0, 1)
    for iterator in 0..<times {
        seq.append(state.0)
        state = (state.1, state.0 + state.1)
    }
    
    return seq
}
//print(fiboSequence(times: 10))


// Function based iterator
func fiboIterator() -> AnyIterator<Int> {
    var state = (0, 1)
    return AnyIterator {
        let upcomingNumber = state.0
        state = (state.1, state.0 + state.1)
        return upcomingNumber
    }
}
//let fibSequence = AnySequence(fiboIterator)
//Array(fibSequence.prefix(10))


// Function based sequence
let fiboSequenceTwo = sequence(state: (0, 1)) {
    (state: inout (Int, Int)) -> Int? in
    let upcomingNumber = state.0
    state = (state.1, state.0 + state.1)
    return upcomingNumber
}
//Array(fiboSequenceTwo.prefix(10))



/*
 write a function that takes in a number, n, and returns the fibo sequence at that number
 
 n: 2 : (0, 1) -> 1
 n: 5 : (0, 1, 1, 2, 3) -> 3
 
 Clarifying questions:
    . I'm assuming that all iterations start at [0, 1] -- yes
    . What if the input is something less than 0 -- return (-1)
 
 */

func fibo(n: Int) -> Int {
    var fiboSeq = (0, 1)
    
    guard n > 1 else {
        if n == 1 {
            return 0
        }
        return -1
    }
    
    for _ in 0..<n - 2 {
        let sum = (fiboSeq.0 + fiboSeq.1)
        fiboSeq = (fiboSeq.1, sum)
        
    }
    
    return fiboSeq.1
}
fibo(n: 5)



/*
 write a recurrsive function that takes in a number, n, and returns the fibo sequence at that number
 
 n: 2 : (0, 1) -> 1
 n: 5 : (0, 1, 1, 2, 3) -> 3
 
 Clarifying questions:
 . I'm assuming that all iterations start at [0, 1] -- yes
 
 */

func fiboReccur(n: Int) -> Int {
    
    if n == 0 {
        return 0
    } else if n == 1 {
        return 1
    }
    
    return fiboReccur(n: n - 1) + fiboReccur(n: n - 2)
    
}
fiboReccur(n: 5)
