# PrettyPrint

PrettyPrint is a Swift library that allows printing complex objects and data structures in a more readable format than the default Swift print.

You can read more about it in the [full blog post](https://swifttoolkit.dev/posts/pretty-print).

## Features

- 🎨 **Readable output** for complex nested objects
- 🏎️ **Built-in support** for Swift's core types
- 🔌 **Extensible** with custom type formatting via `PrettyPrintable` protocol
- 📦 **Zero dependencies**
- 🖥️ **CLI tool** included for demonstration

## Installation

### Swift Package Manager

Add the following to your `Package.swift` file:

```swift
dependencies: [
    .package(url: "https://github.com/swifttoolkit/swift-pretty-print.git", from: "0.1.0")
]
```

Then add the dependency to your target:

```swift
.target(
    name: "YourTarget",
    dependencies: [
        .product(name: "PrettyPrint", package: "swift-pretty-print")
    ]
)
```

## Usage

```swift
import PrettyPrint

// Simple usage
let user = User(
    id: UUID(),
    name: "John Doe",
    age: 32,
    // ... other properties
)

// Pretty print the entire object with proper formatting
prettyPrint(user)
```

### Supported Types

PrettyPrint supports many standard Swift types out of the box:

- Basic types (String, Bool, Numeric types)
- Collections (Array, Dictionary, Set)
- Other Foundation types (Date, URL, UUID)
- Optionals
- Custom types through reflection

### Implementing Custom Formatting

You can implement the `PrettyPrintable` protocol to customize how your types are printed.

The only required method is `pretty()`, in which you should return a string that describes your type and its contents.

If your type is a collection, the property `requiresNewline` can be used to control whether a newline is printed after the property name, instead of inlining the pretty-printed contents after the property name.

## CLI Tool

The package includes a CLI demonstration tool, to demonstrate how a complex type is printed:

```bash
$ swift run pretty-print-cli
```

To compare the output with the default Swift print, you can pass the `--ugly` flag:

```bash
$ swift run pretty-print-cli --ugly
```

## Alternatives

If you need a more feature-complete solution, focusing more on Apple platforms, check out PointFree's [CustomDump](https://github.com/pointfreeco/swift-custom-dump). It has support for types belonging to SwiftUI, UIKit, and other Apple platforms frameworks.

CustomDump provides also diffing capabilities and testing utilities.