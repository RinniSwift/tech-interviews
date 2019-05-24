
/// A type that can `enqueue` and `dequeue` elements.
protocol Queue {
    /// The type of elements held in `self`
    associatedtype Element
    /// Enqueue `element` to `self`
    mutating func enqueue(_ newElement: Element)
    /// Dequeue an `element` from `self`
    mutating func dequeue() -> Element?
}



/// An efficient variable-size FIFO queue of elements of type `Element`
struct FIFOQueue<T>: Queue {
    
    typealias Element = T
    
    private var left: [Element] = []
    private var right: [Element] = []
    
    /// Add an element to the back of the queue.
    /// - Complexity: O(1).
    mutating func enqueue(_ newElement: Element) {
        right.append(newElement)
    }

    /// Removes front of the queue.
    /// Returns `nil` in case of an empty queue.
    /// - Complexity: Amortized O(1).
    mutating func dequeue() -> Element? {
        if left.isEmpty {
            left = right.reversed()
            right.removeAll()
        }
        return left.popLast()
    }
}

extension FIFOQueue: Collection {
    /// The position of the first element in a non empty collection.
    public var startIndex: Int { return 0 }
    /// The collection's "past the end" position--that is, the position one greater than the last valid subscript argument.
    public var endIndex: Int { return left.count + right.count }
    
    /// Returns the position immediarely after the given index.
    public func index(after i: Int) -> Int {
        precondition(i < endIndex)
        return i + 1
    }
    
    /// Accesses the element at the specified position
    public subscript(position: Int) -> Element {
        precondition((0..<endIndex).contains(position), "Index out of bounds")
        if position < left.endIndex {
            return left[left.count - position - 1]
        } else {
            return right[position - left.count]
        }
    }
}

var fifoQueue = FIFOQueue<Int>()

fifoQueue.enqueue(9)
fifoQueue.enqueue(10)
