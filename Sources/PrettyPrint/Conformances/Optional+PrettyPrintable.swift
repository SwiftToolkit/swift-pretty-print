import Foundation

extension Optional: PrettyPrintable {
    public var isFoundationType: Bool {
        switch self {
            case .none: true
            case let .some(value): (value as? PrettyPrintable)?.isFoundationType ?? false
        }
    }

    public var requiresNewline: Bool {
        switch self {
            case .none: false
            case let .some(value): (value as? PrettyPrintable)?.requiresNewline ?? true
        }
    }

    public func pretty() -> String {
        switch self {
            case .none:
                "nil"
            case let .some(value):
                (value as? PrettyPrintable)?.pretty() ?? prettyContent(value, indent: 0)
        }
    }
}