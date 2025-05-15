import Foundation

/// PrettyPrint's core protocol:
/// Implement this to make your types printable.
public protocol PrettyPrintable {
    /// The pretty representation of the type.
    func pretty() -> String

    /// Whether the conforming type belongs to Foundation.
    /// When true, the type name is ommited in the output.
    /// Defaults to false, meaning the custom type name will be printed,
    /// except for Foundation types.
    var isFoundationType: Bool { get }

    /// Whether the type requires a newline after the property name.
    /// If true, the type will be printed with a newline after the property name.
    /// Defaults to false, meaning the type will be printed inlined after the property name.
    var requiresNewline: Bool { get }
}

public extension PrettyPrintable {
    var isFoundationType: Bool { false }
    var requiresNewline: Bool { false }
}
