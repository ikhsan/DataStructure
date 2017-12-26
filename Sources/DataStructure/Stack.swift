import Foundation

public class Stack<T: Equatable> {

    public class Node {
        public var value: T
        public var next: Node? = nil

        public init(_ value: T) {
            self.value = value
        }
    }

    private var top: Node?

    public init() {
        self.top = nil
    }
}

extension Stack {

    public var isEmpty: Bool { return top == nil }

    public func peek() -> T? {
        return top?.value
    }

    public func push(_ value: T)  {
        let node = Stack.Node(value)
        guard top != nil else {
            top = node
            return
        }

        node.next = top
        top = node
    }

    public func pop() -> T? {
        guard let node = top else { return nil }
        top = node.next
        return node.value
    }

}

extension Stack: CustomStringConvertible {
    public var description: String {
        var result = "]"

        var current = top
        while (current != nil) {
            let node = current!

            result = "\(node.value)\(result)"
            if node.next != nil {  result = ", \(result)" }

            current = current?.next
        }

        result = "[\(result)"
        return result
    }
}

