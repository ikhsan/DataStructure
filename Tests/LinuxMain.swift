// Generated using Sourcery 0.10.0 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT

import XCTest
@testable import DataStructureTests

extension GraphTests {
  static var allTests: [(String, (GraphTests) -> () throws -> Void)] = [
    ("testInitWithStrings", testInitWithStrings),
    ("testAddVertices", testAddVertices),
    ("testGetVertices", testGetVertices),
    ("testGetUnknownVertices", testGetUnknownVertices),
    ("testGetEdges", testGetEdges),
    ("testGetStringEdges", testGetStringEdges),
    ("testAddEdges", testAddEdges),
    ("testAddEdgesWithExcludedVertex", testAddEdgesWithExcludedVertex),
    ("testAddStringEdges", testAddStringEdges)
  ]
}
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
extension TreeTests {
  static var allTests: [(String, (TreeTests) -> () throws -> Void)] = [
    ("testIsNodeLeaf", testIsNodeLeaf),
    ("testChildrenCount", testChildrenCount),
    ("testDescription", testDescription)
  ]
}

// swiftlint:disable trailing_comma
XCTMain([
  testCase(GraphTests.allTests),
  testCase(LinkedListTests.allTests),
  testCase(QueueTests.allTests),
  testCase(StackTests.allTests),
  testCase(TreeTests.allTests),
])
// swiftlint:enable trailing_comma
