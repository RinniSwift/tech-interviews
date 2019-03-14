
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


class HashElement<T: Hashable, U>: Equatable {
    static func == (lhs: HashElement<T, U>, rhs: HashElement<T, U>) -> Bool {
        return lhs.key.hashValue == rhs.key.hashValue
    }
    
    var key: T
    var value: U?
    
    init(key: T, value: U?) {
        self.key = key
        self.value = value
    }
}


class HashTable<Key: Hashable, Value> {
    
    typealias Bucket = HashElement<Key, Value>
    
    var initSize: Int
    var buckets = [LinkedList<Bucket>]()
    
    init(size: Int) {
        assert(size > 0)
        self.initSize = size
        for _ in 0...(size - 1) {
            buckets.append(LinkedList<Bucket>())
        }
        
    }
    
    func bucketIndex(key: Key) -> Int {
        return abs(key.hashValue) % initSize
    }
    
    func length() -> Int {
        return items().count
    }
    
    func keys() -> [Key] {
        var allKeys: [Key] = []
        
        for bucket in buckets {
            allKeys += (bucket.items().map{ $0.key })
        }
        return allKeys
    }
    
    func values() -> [Value] {
        var allValues: [Value] = []
        
        for bucket in buckets {
            allValues += (bucket.items().map{ $0.value! })
        }
        return allValues
    }
    
    func items() -> [HashElement<Key, Value>] {
        // Return a list of all items (key-value pairs) in the hash table.
        var allItems: [HashElement<Key, Value>] = []
        for bucket in buckets {
            allItems += (bucket.items())
        }
        
        return allItems
    }
    
    func set(key: Key, value: Value) {
        // Insert or update the given key with its associated value.
        let bucketIndex = self.bucketIndex(key: key)
        
        // TODO: find key value in linked list
        // TODO: append to the linked list.
        buckets[bucketIndex].append(HashElement(key: key, value: value))
    }
    
    // TODO: contains() return true if given key contains in hashtable
    
    // TODO: get() return the value associated with the key in the hashtable. nil if none
    
    // TODO: delete() delete the key-value pair associated in the hashtable
}


let ht = HashTable<String, Any>(size: 8)
print(ht.buckets.count)

ht.set(key: "happy", value: 5)
ht.keys()
ht.values()
ht.items()
ht.set(key: "hi there", value: 9)
ht.length()


//for i in ht.buckets {
//    i.append(HashElement(key: "hi", value: 5))
//}
//ht.buckets[4].append(HashElement(key: "something", value: 5))
//for i in ht.buckets {
//    print(i.head?.data.key)
//    print(i.items())
//}

