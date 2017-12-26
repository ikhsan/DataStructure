import XCTest
import DataStructure

class StackTests: XCTestCase {

    func testEmpty() {
        let subject = Stack<Int>()
        XCTAssert(subject.isEmpty)
    }

    func testPeekEmptyStack() {
        let subject = Stack<Int>()
        XCTAssertNil(subject.peek())
    }

    func testPush() {
        let subject = Stack<Int>()
        subject.push(1)
        XCTAssertEqual(subject.peek(), 1)
        subject.push(5)
        XCTAssertEqual(subject.peek(), 5)
    }

    func testPopEmptyStack() {
        let subject = Stack<Int>()
        XCTAssertNil(subject.pop())
        XCTAssertNil(subject.peek())
    }

    func testPop() {
        let subject = Stack<Int>()
        subject.push(1)
        subject.push(5)
        subject.push(6)

        let value = subject.pop()
        XCTAssertEqual(value, 6)
        XCTAssertEqual(subject.peek(), 5)
    }

    func testDescription() {
        let subject = Stack<Int>()
        subject.push(1)
        subject.push(5)
        subject.push(6)

        XCTAssertEqual(subject.description, "[1, 5, 6]")
    }

}
