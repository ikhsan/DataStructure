import XCTest
import DataStructure

class BinaryTreeTests: XCTestCase {

    func createSampleTree() -> BinaryTree<Int> {
        let one = BinaryTree.node(.empty, 1, .empty)
        let three = BinaryTree.node(one, 3, .empty)
        let six = BinaryTree.node(.empty, 6, .empty)
        let thirteen = BinaryTree.node(.empty, 13, .empty)
        let twenty = BinaryTree.node(.empty, 20, .empty)
        let five = BinaryTree.node(three, 5, six)
        let sixteen = BinaryTree.node(thirteen, 16, twenty)
        let tree = BinaryTree.node(five, 9, sixteen)

        return tree
    }

    func testDescription() {
        XCTAssertEqual(BinaryTree<Int>.empty.description, "└─ .")
        XCTAssertEqual(BinaryTree.node(.empty, 10, .empty).description, "└─ 10")

        let tree = createSampleTree()
        XCTAssertEqual(tree.description, """
        └─ 9
           ├─ 5
           │  ├─ 3
           │  │  ├─ 1
           │  │  └─ .
           │  └─ 6
           └─ 16
              ├─ 13
              └─ 20
        """)
    }

    func testEquality() {
        XCTAssertEqual(BinaryTree<Int>.empty, BinaryTree<Int>.empty)
        XCTAssertNotEqual(BinaryTree<Int>.empty, BinaryTree.node(.empty, 10, .empty))

        XCTAssertEqual(BinaryTree.node(.empty, 10, .empty), BinaryTree.node(.empty, 10, .empty))
        XCTAssertNotEqual(BinaryTree.node(.empty, 10, .empty), BinaryTree.node(.empty, 20, .empty))

        XCTAssertEqual(createSampleTree(), createSampleTree())
    }

}
