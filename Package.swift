import PackageDescription

let package = Package(
    name: "DataStructure",
    products: [
        .library(
            name: "DataStructure",
            targets: ["DataStructure"]),
    ],
    targets: [
        .target(name: "DataStructure"),
        .testTarget(
            name: "DataStructureTests",
            dependencies: ["DataStructure"]),
    ]
)
