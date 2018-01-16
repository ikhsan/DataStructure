import Foundation

public indirect enum BinaryTree<T: Equatable> {
    case empty
    case node(BinaryTree<T>, T, BinaryTree<T>)
}

extension BinaryTree: Equatable {
    public static func ==(lhs: BinaryTree<T>, rhs: BinaryTree<T>) -> Bool {
        switch (lhs, rhs) {
        case (.empty, .empty):
            return true
        case (.node, .empty), (.empty, .node):
            return false
        case (.node(let lhsLeft, let lhsVal, let lhsRight), .node(let rhsLeft, let rhsVal, let rhsRight)):
            return lhsVal == rhsVal && lhsLeft == rhsLeft && lhsRight == rhsRight
        }
    }
}

extension BinaryTree: CustomStringConvertible {
    private func describeTree(tree: BinaryTree<T>, indent: String, isRight: Bool) -> String {
        let prefix = isRight ? "└─ " : "├─ "

        switch tree {
        case .empty:
            return "\(indent)\(prefix)."

        case .node(let leftChild, let value, let rightChild):
            let root = "\(indent)\(prefix)\(value)"
            let childIndent = indent + (isRight ? " " : "│") + String(repeating: " ", count: 2)

            let leftTree = describeTree(tree: leftChild, indent: childIndent, isRight: false)
            let rightTree = describeTree(tree: rightChild, indent: childIndent, isRight: true)

            switch (leftChild, rightChild) {
            case (.empty, .empty):
                return root
            default:
                return [root , leftTree, rightTree].joined(separator: "\n")
            }
        }
    }

    public var description: String {
        return describeTree(tree: self, indent: "", isRight: true)
    }
}
