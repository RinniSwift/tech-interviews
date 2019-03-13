
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
    
    // TODO: append() appends the node to the last of the linked list
    func append(_ value: T) {
        let newNode = Node(value)
        
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
        
        guard head != nil else {
            self.head = newNode
            self.tail = newNode
            return
        }
        newNode.next = self.head
        self.head = newNode
    }
    
    // TODO: delete() deleted the node that was specified
    
    // TODO: replace(old, new) replace the old nodes data to the new nodes data
    
}



let linkedList = LinkedList<Int>()
linkedList.isEmpty()

linkedList.append(5)
linkedList.append(6)
linkedList.append(1)
linkedList.prepend(9)
linkedList.head?.data
linkedList.tail?.data

linkedList.items()
