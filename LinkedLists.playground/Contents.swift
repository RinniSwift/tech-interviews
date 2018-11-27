
// Doubly linked list

public class Node {
    // MARK: - Variables
    
    var value: Int
    var next: Node?
    // to avoid ownership cycles. add weak pointers to break the cycle. avoid deleted cells that are still alive
    weak var previous: Node?
    
    init(value: Int) {
        self.value = value
    }
    
}

public class LinkedList {
    
    // MARK: - Variables
    fileprivate var head: Node?
    private var tail: Node?
    
    // MARK: - Helper Function
    public var isEmpty: Bool {
        return head == nil
    }
    
    public var first: Node? {
        return head
    }
    
    public var last: Node? {
        return tail
    }
    
    // MARK: - Functions
    public func append(value: Int) {
        let newNode = Node(value: value)
        
        if let tailNode = tail {
            newNode.previous = tailNode
            tailNode.next = newNode
        } else {
            head = newNode
        }
        
        tail = newNode
    }
    
    public func nodeAt(index: Int) -> Node? {
        if index >= 0 {
            var node = head
            var i = index
            
            while node != nil {
                if i == 0 { return node }
                i -= 1
                node = node?.next
            }
        }
        return nil
    }
    
    public func removeAll() {
        head = nil
        tail = nil
    }
    
    public func removeNode(node: Node) -> Int {
        let prev = node.previous
        let next = node.next
        
        if let prev = prev {
            prev.next = next        // update the next if you were'nt removing the first index
        } else {
            head = next             // update the head pointer if you are removing the first index
        }
        next?.previous = prev       // update the previous pointer to previous pointer of the deleted node
        
        if next == nil {
            tail = prev             // update the tail if you are removing the last node
        }
        
        node.previous = nil
        node.next = nil             // assign nil to the removed nodes previous and next pointers
        
        return node.value           // return the value of the removed node
    }
    
}

extension LinkedList: CustomStringConvertible {
    
    public var description: String {
        var text = "["
        var node = head
        
        /* loop through the list as long as the head is not nil. put the node value in a string, concatinate it to the text. update the node to be the next node in the list. finally check if the next node is nil -- if is, add a comma. finally close the brackets.
         */
        while node != nil {
            var stringNode = String(node!.value)
            text += "\(stringNode)"
            node = node?.next
            if node != nil {
                text += ", "
            }
            
        }
        return text + "]"
    }
    
}

var numbers = LinkedList()

numbers.append(value: 4)
numbers.append(value: 3)
numbers.append(value: 6)

print(numbers)
