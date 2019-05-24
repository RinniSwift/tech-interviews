
/*
 return fibonacci sequence up to n times
 */

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
