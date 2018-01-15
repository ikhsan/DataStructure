import XCTest
import DataStructure

class GraphTests: XCTestCase {

    class IntVertex: Vertex {
      var value: Int
      public required init(_ value: String) { self.value = Int(value) ?? 0 }
      public var description: String { return "\(value)" }
      public static func ==(lhs: IntVertex, rhs: IntVertex) -> Bool { return lhs.value == rhs.value }
    }

    func testInitWithStrings() {
        let subject = Graph<IntVertex>(vertices: ["1", "2", "3", "4"], edges: [("2","1"), ("2","3"), ("1","4"), ("2","4")])
        XCTAssertEqual(subject.vertices.count, 4)

        XCTAssertEqual(subject.getEdges("1").count, 1)
        XCTAssertEqual(subject.getEdges("2").count, 3)
        XCTAssertEqual(subject.getEdges("3").count, 0)
        XCTAssertEqual(subject.getEdges("4").count, 0)
    }

    // MARK: - Vertex methods

    func testAddVertices() {
        let subject = Graph<IntVertex>(vertices: ["1", "2"], edges: [("2","1")])

        subject.addVertex(IntVertex("3"))
        XCTAssertEqual(subject.vertices.count, 3)
    }

    func testGetVertices() {
        let subject = Graph<IntVertex>(vertices: ["1", "2"], edges: [("2","1")])

        let vertex = IntVertex("3")
        subject.addVertex(vertex)
        XCTAssertEqual(subject.getVertex("3"), vertex)
    }

    func testGetUnknownVertices() {
        let subject = Graph<IntVertex>(vertices: ["1", "2"], edges: [("2","1")])

        XCTAssertNil(subject.getVertex("3"))
    }

    // MARK: - Edge methods

    func testGetEdges() {
        let subject = Graph<IntVertex>(vertices: ["1", "2"], edges: [("2","1")])
        let one = subject.getVertex("1")!
        let two = subject.getVertex("2")!

        let edge = subject.getEdges(two)
        XCTAssertEqual(edge.first!, one)
    }

    func testGetStringEdges() {
      let subject = Graph<IntVertex>(vertices: ["1", "2"], edges: [("2","1")])
      let one = subject.getVertex("1")!

      let edge = subject.getEdges("2")
      XCTAssertEqual(edge, [one])
    }

    func testAddEdges() {
        let subject = Graph<IntVertex>(vertices: ["1", "2"])

        let one = subject.getVertex("1")!
        let two = subject.getVertex("2")!
        subject.addEdge(from: one, to: two)

        XCTAssertEqual(subject.getEdges(one).count, 1)
    }

    func testAddEdgesWithExcludedVertex() {
        let subject = Graph<IntVertex>(vertices: ["1", "2"])

        let two = subject.getVertex("2")!
        let three = IntVertex("3")
        subject.addEdge(from: two, to: three)

        XCTAssertEqual(subject.getEdges(two).count, 0)

        subject.addEdge(from: three, to: two)
        XCTAssertEqual(subject.getEdges(three).count, 0)
    }

    func testAddStringEdges() {
        let subject = Graph<IntVertex>(vertices: ["1", "2"])
        subject.addEdge(from: "1", to: "2")
        XCTAssertEqual(subject.getEdges("1").count, 1)
    }

}
