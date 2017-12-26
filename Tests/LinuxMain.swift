// Generated using Sourcery 0.10.0 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT

import XCTest
@testable import DataStructureTests

extension LinkedListTests {
  static var allTests: [(String, (LinkedListTests) -> () throws -> Void)] = [
    ("testArrayLiteralInit", testArrayLiteralInit),
    ("testEquality", testEquality),
    ("testIteration", testIteration),
    ("testStringDescription", testStringDescription),
    ("testEmpty", testEmpty),
    ("testNotEmpty", testNotEmpty),
    ("testAppend", testAppend),
    ("testPrepend", testPrepend),
    ("testFirst", testFirst),
    ("testLast", testLast),
    ("testReverse", testReverse),
    ("testReversed", testReversed)
  ]
}
extension QueueTests {
  static var allTests: [(String, (QueueTests) -> () throws -> Void)] = [
    ("testEmpty", testEmpty),
    ("testPeekEmptyStack", testPeekEmptyStack),
    ("testEnqueue", testEnqueue),
    ("testDequeueEmptyStack", testDequeueEmptyStack),
    ("testDequeue", testDequeue),
    ("testQueueCleanup", testQueueCleanup),
    ("testDescription", testDescription)
  ]
}
extension StackTests {
  static var allTests: [(String, (StackTests) -> () throws -> Void)] = [
    ("testEmpty", testEmpty),
    ("testPeekEmptyStack", testPeekEmptyStack),
    ("testPush", testPush),
    ("testPopEmptyStack", testPopEmptyStack),
    ("testPop", testPop),
    ("testDescription", testDescription)
  ]
}

// swiftlint:disable trailing_comma
XCTMain([
  testCase(LinkedListTests.allTests),
  testCase(QueueTests.allTests),
  testCase(StackTests.allTests),
])
// swiftlint:enable trailing_comma
