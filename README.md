# ImpostorKit

ImpostorKit is a Swift-based mocking framework designed to simplify the process of creating mock objects for unit testing by using the advanced macro features introduced in Swift 5.9. This framework allows you to generate mocks dynamically, ensuring type safety and ease of use.

## Features

- **Dynamic Mock Generation**: Automatically generate mock objects for any protocol.
- **Compile-Time Type Safety**: Utilizes Swift 5.9 macros to ensure that mocks adhere strictly to their protocols.
- **No Runtime Overhead**: Since mocks are generated at compile time, there is no runtime overhead.
- **Easy Integration**: Designed to be easy to integrate with any existing Swift project that uses XCTest.

## Requirements

- Swift 5.9+
- macOS 11.0 or later

## Installation

### Swift Package Manager

You can add ImpostorKit to your project via Swift Package Manager by adding the following to your `Package.swift`:

```swift
dependencies: [
    .package(url: "https://github.com/jsambuo/ImpostorKit.git", .upToNextMajor(from: "1.0.0"))
]
```

Replace `"https://github.com/jsambuo/ImpostorKit.git"` with the actual URL of your repository.

## Usage

To use ImpostorKit in your tests, import the framework and use the `#mock` macro to create a mock for any protocol:

```swift
import ImpostorKit

protocol MyProtocol {
    func doSomething() -> String
}

class MyTests: XCTestCase {
    func testExample() {
        let mock = #mock(MyProtocol.self)
        XCTAssertEqual(mock.doSomething(), "Expected Value")
    }
}

```

Replace `"Expected Value"` with the actual value you expect based on your mock configuration.

## Contributing

Contributions are welcome! Please fork the repository and submit pull requests, or create issues for bugs and feature suggestions.

## License

ImpostorKit is released under the MIT License. See [LICENSE](LICENSE) for details.
