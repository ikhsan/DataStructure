import Foundation

// MARK: - Node
public class LinkedListNode<T> {
    public var value: T
    public var next: LinkedListNode<T>? = nil

    public init(_ value: T) {
        self.value = value
    }
}

// MARK: - LinkedList

public class LinkedList<T> {
    public var head: LinkedListNode<T>?

    public init() {
        self.head = nil
    }
}

// MARK: - Methods

extension LinkedList {
    public var isEmpty: Bool {
        return head == nil
    }

    public func append(_ value: T) {
        let newNode = LinkedListNode(value)
        guard head != nil else {
            head = newNode
            return
        }

        var node = head
        while (node?.next != nil) {
            node = node?.next
        }
        node?.next = newNode
    }

    public func prepend(_ value: T) {
        let node = LinkedListNode(value)
        node.next = head
        head = node
    }

    public func ds_reversed() -> LinkedList {
        let list = LinkedList()

        var node = head
        while (node != nil) {
            let surelyNode = node!
            list.prepend(surelyNode.value)
            node = surelyNode.next
        }

        return list
    }

    public func reverse() {
        if (head == nil) { return }
        if (head?.next == nil) { return }

        var node = head
        var next: LinkedListNode<T>? = nil
        var previous: LinkedListNode<T>? = nil

        while (node != nil) {
            head = node
            next = node?.next

            node?.next = previous

            previous = node
            node = next
        }
    }

    public var first: T? {
        return head?.value
    }

    public var last: T? {
        var node = head

        while let current = node?.next {
            node = current
        }

        return node?.value
    }
}

// MARK: - Swift niceties

public class LinkedListIterator<T>: IteratorProtocol {

    var current: LinkedListNode<T>?

    init(_ list: LinkedList<T>) {
        current = list.head
    }

    public func next() -> LinkedListNode<T>? {
        let node = current
        current = current?.next
        return node
    }
}

extension LinkedList: Sequence {
    public func makeIterator() -> LinkedListIterator<T> {
        return LinkedListIterator<T>(self)
    }
}

extension LinkedList: CustomStringConvertible {
    public var description: String {
        var result = "["
        for item in self {
            result += "\(item.value)"
            if (item.next != nil) { result += ", " }
        }
        result += "]"
        return result
    }
}
