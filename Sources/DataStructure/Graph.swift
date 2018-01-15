import Foundation

/// Vertex
///
/// Protocol for vertices in the graph that is initialisable and accessible using string.

public protocol Vertex: CustomStringConvertible, Equatable {
    init(_ value: String)
}

/// Graph
///
/// Graph object with vertices that are initialisable and accessible using string.

public class Graph<T: Vertex> {

    private var _vertices: [String : T]
    private var edges: [String : [T]]

    public var vertices: [T] { return Array(_vertices.values) }

    public init() {
        _vertices = [:]
        edges = [:]
    }

    public convenience init(vertices: [String], edges: [(String, String)] = []) {
        self.init()

        vertices.forEach { addVertex(T($0)) }
        edges.forEach { addEdge(from: $0.0, to: $0.1) }
    }

    public func addVertex(_ vertex: T)  {
        _vertices[vertex.description] = vertex
    }

    public func getVertex(_ key: String) -> T? {
        return _vertices[key]
    }

    public func addEdge(from source: String, to target: String) {
        guard let s = _vertices[source], let t = _vertices[target] else { return }

        addEdge(from: s, to: t)
    }

    public func addEdge(from source: T, to target: T) {
        // source must exist
        guard _vertices[source.description] != nil,
            _vertices[target.description] != nil
            else { return }

        edges[source.description, default: []] += [target]
    }

    public func getEdges(_ value: T) -> [T] {
        return edges[value.description] ?? []
    }

    public func getEdges(_ key: String) -> [T] {
        guard let vertex = getVertex(key) else { return [] }
        return getEdges(vertex)
    }


}
