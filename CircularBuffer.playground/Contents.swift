
class CircularBuffer<T> {
    
    var bufferMaxSize: Int
    var size = 0
    var elements = Array<T?>(repeating: nil, count: 8)
    
    var front: T? {
        if isEmpty() {
            return nil
        } else {
            return elements[bufferMaxSize - size]
        }
    }
    
    init(maxSize: Int) {
        self.bufferMaxSize = maxSize
        self.elements = Array(repeating: nil, count: self.bufferMaxSize)
    }
    
    convenience init() {
        self.init(maxSize: 8)
    }
    
    func isEmpty() -> Bool {
        return self.size == 0
    }
    
    func isFull() -> Bool {
        return size == bufferMaxSize
    }
    
    func enqueue(item: T) {
        // if empty, update last element to be the item
        if isEmpty() {
            elements[bufferMaxSize-1] = item
        } else {
            // if not empty, loop through the indexes and update the item to be that of the one ahead
            for index in 0...bufferMaxSize - 2 {
                elements[index] = elements[index + 1]
            }
            // after shifting all elements, update the last item to be the item enqueued
            elements[bufferMaxSize - 1] = item
        }
        // increase the size only if the buffer isnt full
        if !isFull() {
            size += 1
        }
    }
    
    func dequeue() -> T? {
        
        if !isEmpty() {
            // set a variable to equal the front item, update it to nil, and return the front item
            let front = elements[bufferMaxSize - size]
            elements[bufferMaxSize - size] = nil
            size -= 1
            return front
        }
        // return nil buffer is empty
        return nil
    }
}

let circularBuffer = CircularBuffer<Int>(maxSize: 4)

circularBuffer.elements     // [nil, nil, nil, nil]
circularBuffer.front        // nil
circularBuffer.size         // 0
circularBuffer.bufferMaxSize // 4
circularBuffer.isFull()     // false
circularBuffer.isEmpty()    // true

circularBuffer.enqueue(item: 7)
circularBuffer.elements // [nil, nil, nil, 7]
circularBuffer.front    // 7
circularBuffer.size     // 1
circularBuffer.isEmpty()// false

circularBuffer.enqueue(item: 8)
circularBuffer.elements // [nil, nil, 7, 8]
circularBuffer.front    // 7
circularBuffer.size     // 2

circularBuffer.enqueue(item: 9)
circularBuffer.elements // [nil, 7, 8, 9]

circularBuffer.enqueue(item: 10)
circularBuffer.elements // [7, 8, 9, 10]

circularBuffer.enqueue(item: 11)
circularBuffer.elements // [8, 9, 10, 11]

circularBuffer.dequeue() // 8
circularBuffer.elements  // [nil, 9, 10, 11]
