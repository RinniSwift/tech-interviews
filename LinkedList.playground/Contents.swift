
// TODO: Create a node class that contains data(stored value) and next(node that comes after current one)
class Node<T: Equatable>: Equatable {
    // protocol stubs
    static func == (lhs: Node<T>, rhs: Node<T>) -> Bool {
        return true
    }
    
    // main variables
    var data: T
    var next: Node?
    
    // initializer requirements
    init(_ data : T) {
        self.data = data
    }
}

// TODO: Create a linked list class that contains nodes and different methods
class LinkedList<T: Equatable> {
    
    // main variables
    var head: Node<T>? = nil    // initializes head as empty
    var tail: Node<T>? = nil    // initializes tail as empty
    
    // TODO: items() returns a dynamic array of all items in the linked list.
    func items() -> [T] {
        var items: [T] = []
        
        var curr = self.head
        
        while true {
            guard curr != nil else {
                break
            }
            items.append((curr?.data)!)
            curr = curr?.next
        }
        
        return items
    }
    
    // TODO: isEmpty() return bool indicating if linked list is empty
    func isEmpty() -> Bool {
        return head == nil
    }
    
    // TODO: length() returns count of total length in the linked list
    var long: Int = 0
    var length: Int {
        return long
    }
    
    // TODO: append() appends the node to the last of the linked list
    func append(_ value: T) {
        let newNode = Node(value)
        long += 1
        
        guard tail != nil else {
            self.tail = newNode
            self.head = newNode
            return
        }
        self.tail?.next = newNode
        self.tail = newNode
    }
    
    // TODO: prepend() prepends the node to the beginning of the linked list
    func prepend(_ value: T) {
        let newNode = Node(value)
        long += 1
        guard head != nil else {
            self.head = newNode
            self.tail = newNode
            return
        }
        newNode.next = self.head
        self.head = newNode
    }
    
    // TODO: delete() deletes the node that was specified
    func delete(_ value: T) {
        
        long -= 1
        var curr = self.head
        var previous: Node<T>? = nil
        
        while true {
            guard curr?.data != nil else {
                return
            }
            
            if curr?.data == value {    // found matching data
                
                if previous != nil {    // there is previous data
                    if curr == self.tail {  // deleted node is tail
                        self.tail = previous
                        previous?.next = nil
                    }
                    previous?.next = curr?.next
                } else {    // if there is no previous data
                    if curr == self.tail {  // deleted node is the head and tail
                        self.head = nil
                        self.tail = nil
                    }
                    self.head = curr?.next
                }
            }
            // didnt find matching data
            previous = curr
            curr = curr?.next
        }
        
    }
    
    // TODO: replace(old, new) replace the old nodes data to the new nodes data
    func replace(oldVal: T, newVal: T) {
        var curr = self.head
        
        while curr != nil {
            if curr?.data == oldVal {
                curr?.data = newVal
            }
            curr = curr?.next
        }
    }
    
    func findKey(key: T) -> T? {
        var curr = self.head
        
        while curr != nil {
            if curr?.data == key {
                return (curr?.data)!
            }
            curr = curr?.next
        }
        return nil
    }
    
}


// ***TEST***

// instantiating a linked list
let linkedList = LinkedList<Int>()

// isEmpty()
linkedList.isEmpty()    // true
linkedList.append(5)
linkedList.isEmpty()    // false

// head, tail
linkedList.append(6)
linkedList.append(1)
linkedList.head?.data
linkedList.tail?.data

// items()
linkedList.items()

// length
linkedList.length

// prepend()
linkedList.prepend(9)
linkedList.items()
linkedList.head?.data

// delete()
linkedList.delete(9)
linkedList.items()
linkedList.length
linkedList.head?.data
linkedList.tail?.data

// replace()
linkedList.replace(oldVal: 5, newVal: 10)
linkedList.items()
linkedList.head?.data

// findKey()
linkedList.findKey(key: 9)
linkedList.findKey(key: 10)
