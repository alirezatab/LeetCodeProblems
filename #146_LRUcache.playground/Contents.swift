final class Node {
    var value: Int
    var key: Int
    var prev: Node?
    var next: Node?
    
    init(_ key: Int, _ val: Int) {
        self.key = key
        self.value = val
    }
}

final class DoublyLinkedList {
    
    private var head: Node?
    private var tail: Node?
    private (set) var count = 0
    
    func addToHead(_ key: Int,_ val: Int) -> Node {
        let node = Node(key, val)
        
        defer {
            head = node
            count += 1
        }
        
        guard let headNode = head else {
            tail = node
            return node
        }

        headNode.prev = node
        
        node.prev = nil
        node.next = headNode
        
        print("addToHead: \(tail)")
        
        return node
    }
    
    func moveToHead(_ node: Node?) {
        guard node !== head else {return}
        
        let prevNode = node?.prev
        let nextNode = node?.next
        
        prevNode?.next = nextNode
        nextNode?.prev = prevNode
        
        node?.next = head
        node?.prev = nil
        
        if node === tail {
            tail = prevNode
            print(tail)
            print("move to head .. tail \(tail)")

        }
        self.head = node
    }
    
    func removeLast() -> Node? {
        
        //print("remvove last was called \(tail)")
        
        guard let tailNode = tail else {return nil}
        
        let prevNode = tailNode.prev
        prevNode?.next = nil
        tail = prevNode
        if count == 1 {
            head = nil
        }
        
        count -= 1
        return tailNode
    }
}

class LRUCache {
    let list = DoublyLinkedList()
    var dic = [Int: Node]()
    var maxCapacity: Int
    
    init(_ capacity: Int) {
        self.maxCapacity = max(0, capacity)
    }
    
    func get(_ key: Int) -> Int {
        guard let node = dic[key] else {
            return -1
        }
        
        list.moveToHead(node)
        return node.value
    }
    
    func put(_ key: Int, _ value: Int) {
        if let node = dic[key] {
            node.value = value
            list.moveToHead(node)
        } else {
            let newNode = list.addToHead(key, value)
            dic[key] = newNode
        }
        
        if list.count > self.maxCapacity {
            let nodeRemoved = list.removeLast()
            print(nodeRemoved?.key)
            if let key = nodeRemoved?.key {
                dic[key] = nil
            }
        }
    }
}


//[5],[2,9],[13,4],[8,18],[1,7],[6],[9,29],[8,21],[5],[6,30],[1,12],[10],[4,15],[7,22],[11,26],[8,17],[9,29],[5],[3,4],[11,30],[12],[4,29],[3],[9],[6],[3,4],[1],[10],[3,29],[10,28],[1,20],[11,13],[3],[3,12],[3,8],[10,9],[3,26],[8],[7],[5],[13,17],[2,27],[11,15],[12],[9,19],[2,15],[3,16],[1],[12,17],[9,1],[6,19],[4],[5],[5],[8,1],[11,7],[5,2],[9,28],[1],[2,2],[7,4],[4,22],[7,24],[9,26],[13,28],[11,26]
let obj = LRUCache(10)
obj.put(10, 13)
obj.put(3, 17)
obj.put(6, 11)
obj.put(10, 5)
obj.put(9, 10)
obj.get(13)      //-1
obj.put(2, 19)
obj.get(2)
obj.get(3)       //17
obj.put(5, 25)
obj.get(8)       //-1
obj.put(9, 22)      // should update 9, and put in front
obj.put(5, 5)        // should update 5, and put in front
obj.put(1, 30)
obj.get(11)           // returns -1 (not found)
obj.put(9, 12)       //should update 9, and put in front
obj.get(7)           // returns -1 (not found)
obj.get(5)        // should update 5, and put in front
obj.get(8)           // returns -1 (not found)
obj.get(9)          // return 12 and keep in fron
obj.put(4, 30)
obj.put(9, 3)
obj.get(9)
obj.get(10)
obj.get(10)
obj.put(6, 14)
obj.put(3, 1)
obj.get(3)
obj.put(10, 11)
obj.get(8)
obj.put(2, 14)
obj.get(1)
obj.get(5)
obj.get(4)
obj.put(11, 4)
obj.put(12, 24)
obj.put(5, 18)
obj.get(13)
obj.put(7, 23)
obj.get(8)
obj.get(12)
obj.put(3, 27)
obj.put(2, 12)
obj.get(5)
obj.put(2, 9)
obj.put(13, 4)
obj.get(6)
//obj.put(8, 18)
//obj.put(1, 7)
//obj.get(6)







//[6],[9,29],[8,21],[5],[6,30],[1,12],[10],[4,15],[7,22],[11,26],[8,17],[9,29],[5],[3,4],[11,30],[12],[4,29],[3],[9],[6],[3,4],[1],[10],[3,29],[10,28],[1,20],[11,13],[3],[3,12],[3,8],[10,9],[3,26],[8],[7],[5],[13,17],[2,27],[11,15],[12],[9,19],[2,15],[3,16],[1],[12,17],[9,1],[6,19],[4],[5],[5],[8,1],[11,7],[5,2],[9,28],[1],[2,2],[7,4],[4,22],[7,24],[9,26],[13,28],[11,26]
