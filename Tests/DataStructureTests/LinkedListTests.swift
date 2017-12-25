import XCTest
import DataStructure

class LinkedListTests: XCTestCase {

    func testEmpty() {
        let subject = LinkedList<Int>()
        XCTAssert(subject.isEmpty)
    }

    func testNotEmpty() {
        let subject = LinkedList<Int>()
        subject.append(4)

        XCTAssertFalse(subject.isEmpty)
    }

    func testPrepend() {
        let subject = LinkedList<Int>()
        subject.append(1)
        subject.prepend(3)
        subject.prepend(5)
        subject.prepend(15)

        XCTAssertEqual(subject.description, "[15, 5, 3, 1]")
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
        let subject = LinkedList<Int>()
        subject.append(6)
        subject.append(10)
        subject.append(2)
        subject.append(22)

        subject.reverse()
        XCTAssertEqual(subject.description, "[22, 2, 10, 6]")
    }

    func testReversed() {
        let subject = LinkedList<Int>()
        subject.append(6)
        subject.append(10)
        subject.append(2)
        subject.append(22)

        let reversed = subject.ds_reversed()
        XCTAssertEqual(reversed.description, "[22, 2, 10, 6]")
    }

    func testIteration() {
        let subject = LinkedList<String>()
        subject.append("A")
        subject.append("B")
        subject.append("C")

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
        subject.append(5)
        subject.append(6)

        XCTAssertEqual(subject.description, "[1, 5, 6]")

        let subject2 = LinkedList<String>()
        subject2.append("I")
        subject2.append("X")
        subject2.append("N")

        XCTAssertEqual(subject2.description, "[I, X, N]")
    }

}
