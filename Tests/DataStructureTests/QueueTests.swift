import XCTest
@testable import DataStructure

class QueueTests: XCTestCase {

    func testEmpty() {
        let subject = Queue<Int>()
        XCTAssert(subject.isEmpty)
    }

    func testPeekEmptyStack() {
        let subject = Queue<Int>()
        XCTAssertNil(subject.peek())
    }

    func testEnqueue() {
        let subject = Queue<Int>()
        subject.enqueue(1)
        XCTAssertEqual(subject.peek(), 1)

        subject.enqueue(5)
        XCTAssertEqual(subject.peek(), 1)
    }

    func testDequeueEmptyStack() {
        let subject = Queue<Int>()
        XCTAssertNil(subject.dequeue())
        XCTAssertNil(subject.peek())
    }

    func testDequeue() {
        let subject = Queue<Int>()
        subject.enqueue(1)
        subject.enqueue(5)
        subject.enqueue(6)

        XCTAssertEqual(subject.dequeue(), 1)
        XCTAssertEqual(subject.peek(), 5)
        XCTAssertEqual(subject.dequeue(), 5)
        XCTAssertEqual(subject.peek(), 6)
        XCTAssertEqual(subject.dequeue(), 6)
        XCTAssertNil(subject.peek())
    }

    func testQueueCleanup() {
        let subject = Queue<Int>()

        XCTAssertNil(subject.head)
        XCTAssertNil(subject.tail)

        subject.enqueue(1)

        XCTAssertNotNil(subject.head)
        XCTAssertNotNil(subject.tail)

        _ = subject.dequeue()

        XCTAssertNil(subject.head)
        XCTAssertNil(subject.tail)
    }

    func testDescription() {
        let subject = Queue<Int>()
        subject.enqueue(1)
        subject.enqueue(5)
        subject.enqueue(6)

        XCTAssertEqual(subject.description, "[1, 5, 6]")
    }

}
