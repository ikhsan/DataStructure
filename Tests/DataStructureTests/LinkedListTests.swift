import XCTest
import DataStructure

class LinkedListTests: XCTestCase {

    // MARK: - Swift niceties tests

    func testArrayLiteralInit() {
        let subject: LinkedList<Int> = [1, 5, 6]

        let expected = LinkedList<Int>()
        let one = LinkedList.Node(1)
        expected.head = one

        let five = LinkedList.Node(5)
        one.next = five

        let six = LinkedList.Node(6)
        five.next = six
        XCTAssertEqual(subject, expected)
    }

    func testEquality() {
        let subject1: LinkedList<Int> = [1, 5, 6]
        let subject2: LinkedList<Int> = [1, 5, 6, 10]
        XCTAssertNotEqual(subject1, subject2)

        XCTAssertNotEqual(subject1, LinkedList<Int>())
        XCTAssertNotEqual(LinkedList<Int>(), subject1)

        XCTAssertEqual(LinkedList<Int>(), LinkedList<Int>())

        subject1.append(10)
        XCTAssertEqual(subject1, subject2)
    }

    func testIteration() {
        let subject: LinkedList<String> = ["A", "B", "C"]

        var string = ""
        for item in subject {
            string += item.value
        }
        XCTAssertEqual(string, "ABC")
    }

    func testStringDescription() {
        let subject = LinkedList<Int>()
        XCTAssertEqual(subject.description, "[]")
        subject.append(1)
        XCTAssertEqual(subject.description, "[1]")

        subject.append(5)
        subject.append(6)
        XCTAssertEqual(subject.description, "[1, 5, 6]")

        let subject2: LinkedList<String> = ["I", "X", "N"]
        XCTAssertEqual(subject2.description, "[I, X, N]")
    }

    // MARK: - Custom method tests

    func testEmpty() {
        let subject = LinkedList<Int>()
        XCTAssert(subject.isEmpty)
    }

    func testNotEmpty() {
        let subject: LinkedList<Int> = [4]
        XCTAssertFalse(subject.isEmpty)
    }

    func testAppend() {
        let subject: LinkedList<Int> = [1]
        subject.append(3)
        subject.append(5)
        subject.append(15)

        XCTAssertEqual(subject, [1, 3, 5, 15])
    }

    func testPrepend() {
        let subject: LinkedList<Int> = [1]
        subject.prepend(3)
        subject.prepend(5)
        subject.prepend(15)

        XCTAssertEqual(subject, [15, 5, 3, 1])
    }

    func testFirst() {
        let subject = LinkedList<Int>()
        XCTAssertNil(subject.first)

        subject.append(4)
        XCTAssertEqual(subject.first, 4)
    }

    func testLast() {
        let subject = LinkedList<Int>()
        XCTAssertNil(subject.last)

        subject.append(4)
        subject.append(5)
        XCTAssertEqual(subject.last, 5)
    }

    func testReverse() {
        let subject: LinkedList<Int> = [6, 10, 2, 22]

        subject.reverse()
        XCTAssertEqual(subject, [22, 2, 10, 6])
    }

    func testReversed() {
        let subject: LinkedList<Int> = [6, 10, 2, 22]

        let reversed = subject.ds_reversed()
        XCTAssertEqual(reversed, [22, 2, 10, 6])
    }

}
