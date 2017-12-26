import Foundation

// MARK: - LinkedList

public final class LinkedList<T: Equatable> {
    public class Node {
        public var value: T
        public var next: Node? = nil

        public init(_ value: T) {
            self.value = value
        }
    }

    public var head: Node?

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
        let newNode = Node(value)
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
        let node = Node(value)
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
        var next: LinkedList<T>.Node? = nil
        var previous: LinkedList<T>.Node? = nil

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

extension LinkedList: ExpressibleByArrayLiteral {
    public convenience init(arrayLiteral elements: T...) {
        self.init()

        var previous: Node? = nil

        for element in elements {
            let newNode = Node(element)
            previous?.next = newNode

            if head == nil {
                head = newNode
            }
            previous = newNode
        }
    }
}

extension LinkedList: Equatable {
    public static func ==(lhs: LinkedList, rhs: LinkedList) -> Bool {
        var leftValue = lhs.head
        var rightValue = rhs.head

        while (leftValue != nil && rightValue != nil) {
            leftValue = leftValue?.next
            rightValue = rightValue?.next

            if (leftValue?.value != rightValue?.value) {
                return false
            }
        }

        return true
    }
}

public class LinkedListIterator<T: Equatable>: IteratorProtocol {
    public typealias Element = LinkedList<T>.Node

    var current: Element?

    init(_ list: LinkedList<T>) {
        current = list.head
    }

    public func next() -> Element? {
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
