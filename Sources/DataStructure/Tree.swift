import Foundation

public class TreeNode<T: Hashable> {
    public var value: T
    public var children: [TreeNode<T>] { return _children }
    public var childrenCount: Int { return _children.count }

    private var _children: [TreeNode<T>]

    public init(_ value: T) {
        self.value = value
        self._children = []
    }
}

extension TreeNode {

    public func addChild(_ node: TreeNode<T>) {
        _children.append(node)
    }

    public func addChild(_ value: T) {
        addChild(TreeNode(value))
    }

    public var isLeaf: Bool { return _children.isEmpty }

}

extension TreeNode: CustomStringConvertible {
    private func describeTree(node: TreeNode<T>, indent: String, isLast: Bool) -> String {
        // root
        let prefix = isLast ? "└── " : "├── "
        let root = "\(indent)\(prefix)\(node.value)"

        // children
        let childrenTree = node.children.enumerated().map { (offset_child) -> String in
            let (offset, child) = offset_child
            let isChildLast = ((node.childrenCount - 1) == offset)
            let childIndentation = (isLast ? " " : "│") + String(repeating: " ", count: 3)

            return describeTree(node: child, indent: indent + childIndentation, isLast: isChildLast)
        }

        let lines = [ root ] + childrenTree
        return lines.joined(separator: "\n")
    }

    public var description: String {
        return describeTree(node: self, indent: "", isLast: true)
    }
}
