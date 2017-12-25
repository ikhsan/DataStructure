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

// swiftlint:disable trailing_comma
XCTMain([
  testCase(LinkedListTests.allTests),
])
// swiftlint:enable trailing_comma
