import XCTest
import DataStructure

class TreeTests: XCTestCase {

    func testIsNodeLeaf() {
        let leaf = TreeNode<String>("leaf")
        XCTAssert(leaf.isLeaf)

        leaf.addChild("a")
        leaf.addChild("b")
        XCTAssertFalse(leaf.isLeaf)
    }

    func testChildrenCount() {
        let a = TreeNode<String>("A")
        XCTAssertEqual(a.childrenCount, 0)

        let b = TreeNode<String>("B")
        let c = TreeNode<String>("C")
        a.addChild(b)
        a.addChild(c)
        XCTAssertEqual(a.childrenCount, 2)

        let d = TreeNode<String>("D")
        let e = TreeNode<String>("E")
        let f = TreeNode<String>("F")
        b.addChild(d)
        b.addChild(e)
        c.addChild(f)

        XCTAssertEqual(b.childrenCount, 2)
        XCTAssertEqual(b.childrenCount, 2)

        let g = TreeNode<String>("G")
        let h = TreeNode<String>("H")
        d.addChild(g)
        e.addChild(h)

        XCTAssertEqual(d.childrenCount, 1)
        XCTAssertEqual(g.childrenCount, 0)
        XCTAssertEqual(e.childrenCount, 1)
        XCTAssertEqual(h.childrenCount, 0)

    }

    func testDescription() {
        let a = TreeNode<String>("A")
        XCTAssertEqual(a.description, """
        └── A
        """)

        let b = TreeNode<String>("B")
        let c = TreeNode<String>("C")
        a.addChild(b)
        a.addChild(c)

        let d = TreeNode<String>("D")
        let e = TreeNode<String>("E")
        let f = TreeNode<String>("F")
        b.addChild(d)
        b.addChild(e)
        c.addChild(f)

        XCTAssertEqual(a.description, """
        └── A
            ├── B
            │   ├── D
            │   └── E
            └── C
                └── F
        """)

        let g = TreeNode<String>("G")
        let h = TreeNode<String>("H")
        d.addChild(g)
        e.addChild(h)
        XCTAssertEqual(a.description, """
        └── A
            ├── B
            │   ├── D
            │   │   └── G
            │   └── E
            │       └── H
            └── C
                └── F
        """)
    }

}
