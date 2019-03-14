
class Node<T: Equatable>: Equatable {
    static func == (lhs: Node<T>, rhs: Node<T>) -> Bool {
        return true
    }
    
    var data: T
    var next: Node?
    
    init(_ data : T) {
        self.data = data
    }
}

class LinkedList<T: Equatable> {
    
    var head: Node<T>? = nil
    var tail: Node<T>? = nil
    var long: Int = 0
    
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
    
    func isEmpty() -> Bool {
        return head == nil
    }
    
    var length: Int {
        return long
    }
    
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
    
    func delete(_ value: T) {
        
        long -= 1
        var curr = self.head
        var previous: Node<T>? = nil
        
        while true {
            guard curr?.data != nil else {
                return
            }
            
            if curr?.data == value {   
                
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
    
    func replace(oldVal: T, newVal: T) {
        var curr = self.head
        
        while curr != nil {
            if curr?.data == oldVal {
                curr?.data = newVal
            }
            curr = curr?.next
        }
    }
}


class HashTable {
    
    var initSize: Int
    var buckets = [LinkedList<Int>]()
    
    init(size: Int) {
        self.initSize = size
        for _ in 0...(size - 1) {
            buckets.append(LinkedList<Int>())
        }
        
    }
    
    func bucketInde(key: String) -> Int {
        return abs(key.hashValue) % initSize
    }
    
}
let ht = HashTable(size: 8)
print(ht.buckets.count)


//for i in ht.buckets {
//    i.append(10)
//}
//ht.buckets[4].append(7)
//for i in ht.buckets {
////    print(i.head?.data)
//    print(i.items())
//}

