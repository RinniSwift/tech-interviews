

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

print(fiboSequence(times: 10))

// Function based iterator
func fiboIterator() -> AnyIterator<Int> {
    var state = (0, 1)
    return AnyIterator {
        let upcomingNumber = state.0
        state = (state.1, state.0 + state.1)
        return upcomingNumber
    }
}
let fibSequence = AnySequence(fiboIterator)
Array(fibSequence.prefix(10))

// Function based sequence
let fiboSequenceTwo = sequence(state: (0, 1)) {
    (state: inout (Int, Int)) -> Int? in
    let upcomingNumber = state.0
    state = (state.1, state.0 + state.1)
    return upcomingNumber
}
Array(fiboSequenceTwo.prefix(10))



