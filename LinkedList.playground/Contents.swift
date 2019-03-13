
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
    
    // TODO: isEmpty() return bool indicating if linked list is empty
    
    // TODO: length() returns count of total length in the linked list
    
    // TODO: append() appends the node to the last of the linked list
    
    // TODO: prepend() prepends the node to the beginning of the linked list
    
    // TODO: delete() deleted the node that was specified
    
    // TODO: replace(old, new) replace the old nodes data to the new nodes data
    
}
