
struct PrefixIterator: IteratorProtocol {
    // protocol stub Element type that is getting iterated over. This is not necessary to specify since it can infer the type when called in the PrefixSequence
//    typealias Element = Substring
    
    // we will iterate over the string with the given offset
    let string: String
    var offset: String.Index
    
    init(string: String) {
        self.string = string
        self.offset = string.startIndex
    }
    
    // protocol stub Iterate over every substring which increases with the offset
    mutating func next() -> Substring? {
        guard offset < string.endIndex else { return nil }
        offset = string.index(after: offset)
        return string[string.startIndex..<offset]
    }
}

struct PrefixSequence: Sequence {
    let string: String
    
    func makeIterator() -> PrefixIterator {
        return PrefixIterator(string: string)
    }
}


for prefix in PrefixSequence(string: "hello") {
    print(prefix)
}

/*
 Using sequence(first:next:)
 and using sequence(state:next:)
 */
let randomNumbers = sequence(first: 100) { (previous: UInt32) in
    let newValue = UInt32.random(in: 0...previous)
    guard newValue > 0 else { return nil }
    return newValue
}
Array(randomNumbers)

let fibsSequence = sequence(state: (0, 1)) {
    // compiler needs type inference help here
    (state: inout(Int, Int)) -> Int? in
    let upcomingNumber = state.0
    state = (state.1, state.0 + state.1)
    return upcomingNumber
}
Array(fibsSequence.prefix(10))
