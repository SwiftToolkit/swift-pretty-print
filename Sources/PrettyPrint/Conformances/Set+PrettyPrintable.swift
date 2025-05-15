import Foundation

extension Set: PrettyPrintable {
    public var isFoundationType: Bool { true }
    public var requiresNewline: Bool { true }

    public func pretty() -> String {
        map {
            prettyContent($0, indent: 0)
        }
        .joined(separator: "\n")
    }
}
