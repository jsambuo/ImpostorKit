// swift-tools-version:5.10
import PackageDescription
import CompilerPluginSupport

let package = Package(
    name: "ImpostorKit",
    platforms: [
        .iOS(.v15),
        .macOS(.v10_15),
        .watchOS(.v8),
        .tvOS(.v15),
        .macCatalyst(.v15),
        .driverKit(.v22),
        .visionOS(.v1),
    ],
    products: [
        // Products define the executables and libraries produced by your package.
        .library(
            name: "ImpostorKit",
            targets: ["ImpostorKit"]
        ),
        .executable(
            name: "ImpostorKitClient",
            targets: ["ImpostorKitClient"]
        ),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "version"),
        .package(url: "https://github.com/apple/swift-syntax", from: "510.0.1")
    ],
    targets: [
        // Targets are the basic building blocks of a package.
        .macro(
            name: "ImpostorKitMacros",
            dependencies: [
                .product(name: "SwiftSyntaxMacros", package: "swift-syntax"),
                .product(name: "SwiftCompilerPlugin", package: "swift-syntax")
            ]
        ),
        .target(
            name: "ImpostorKit",
            dependencies: ["ImpostorKitMacros"]
        ),
        .executableTarget(name: "ImpostorKitClient", dependencies: ["ImpostorKit"]),
        .testTarget(
            name: "ImpostorKitTests",
            dependencies: [
                "ImpostorKitMacros",
                .product(name: "SwiftSyntaxMacrosTestSupport", package: "swift-syntax"),
            ]
        )
    ]
)
