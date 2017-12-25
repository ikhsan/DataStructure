// Generated using Sourcery 0.10.0 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT

import XCTest
@testable import DataStructureTests

extension LinkedListTests {
  static var allTests: [(String, (LinkedListTests) -> () throws -> Void)] = [
    ("testArrayLiteralInit", testArrayLiteralInit),
    ("testEmpty", testEmpty),
    ("testNotEmpty", testNotEmpty),
    ("testAppend", testAppend),
    ("testPrepend", testPrepend),
    ("testFirst", testFirst),
    ("testLast", testLast),
    ("testReverse", testReverse),
    ("testReversed", testReversed),
    ("testIteration", testIteration),
    ("testStringDescription", testStringDescription)
  ]
}

// swiftlint:disable trailing_comma
XCTMain([
  testCase(LinkedListTests.allTests),
])
// swiftlint:enable trailing_comma
