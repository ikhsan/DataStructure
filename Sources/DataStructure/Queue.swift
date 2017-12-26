import Foundation

public class Queue<T> {

    public class Node {
        public var value: T
        public var next: Node? = nil

        public init(_ value: T) {
            self.value = value
        }
    }

    internal var head: Node?
    internal var tail: Node?

    public init() {
        self.head = nil
        self.tail = nil
    }
}

extension Queue {

    public var isEmpty: Bool { return head == nil && tail == nil}

    public func peek() -> T? {
        return head?.value
    }

    public func enqueue(_ value: T)  {
        let newNode = Node(value)
        tail?.next = newNode
        tail = newNode

        if (head == nil) {
            head = newNode
        }
    }

    public func dequeue() -> T? {
        let value = head?.value
        head = head?.next

        if (head == nil) {
            tail = nil
        }

        return value
    }

}


extension Queue: CustomStringConvertible {

    public var description: String {
        var result = "["

        var current = head
        while (current != nil) {
            result += "\(current!.value)"
            if (current?.next != nil) { result += ", " }
            current = current?.next
        }

        result += "]"
        return result
    }
    
}

