


class CircularBuffer<T> {

    var bufferMaxSize: Int
    var size = 0
    var elements = Array<T?>(repeating: nil, count: 8)
    
    var front: T? {
        if self.isEmpty() {
            return nil
        } else {
            return elements[bufferMaxSize - size]
        }
    }

    init(maxSize: Int) {
        self.bufferMaxSize = maxSize
        self.elements = Array(repeating: nil, count: self.bufferMaxSize)
    }

    func isEmpty() -> Bool {
        return self.size == 0
    }

    func isFull() -> Bool {
        return size == bufferMaxSize
    }

    func enqueue(item: T) {
        // insert item at the back of the buffer
        if isEmpty() {
            elements[bufferMaxSize-1] = item
        } else {
            // move all elements one down and then add element to the back
            for index in 0...bufferMaxSize - 2 {
                elements[index] = elements[index + 1]
            }
            elements[bufferMaxSize - 1] = item
        }
        size += 1
    }
    

}

let circularBuffer = CircularBuffer<Int>(maxSize: 6)
print(circularBuffer.elements)
circularBuffer.enqueue(item: 4)
print(circularBuffer.elements)
circularBuffer.enqueue(item: 5)
print(circularBuffer.elements)
print(circularBuffer.front!)
