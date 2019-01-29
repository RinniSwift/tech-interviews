import UIKit


class Node<T : Comparable > {
    var left: Node?
    var right: Node?
    var data: T
    
    init(data: T) {
        self.data = data
        self.right = nil
        self.left = nil
    }
}


class Tree {
    var root: Node<Int>?
    
    func insert(root: Node<Int>?, target: Node<Int>) {
        var current = root
        if current == nil {
            current = target
        } else {
            if target.data < (current?.data)! {
                if current?.left == nil {
                    current?.left = target
                } else {
                    insert(root: current?.left, target: target)
                }
            } else if target.data > (current?.data)! {
                if current?.right == nil {
                    current?.right = target
                } else {
                    insert(root: current?.right, target: target)
                }
            }
        }
    }
    
    
}

let node = Node(data: 5)
let tree = Tree()
tree.insert(root: Node(data: 10), target: node)


