import Foundation

extension Dictionary: PrettyPrintable {
    public var isFoundationType: Bool { true }
    public var requiresNewline: Bool { true }

    public func pretty() -> String {
        map { key, value in
            let keyString = String(describing: key)
            if let printable = value as? PrettyPrintable,
                !printable.requiresNewline {
                return "∙ \(keyString.bold): \(printable.pretty())"
            }

            let rawPretty = (value as? PrettyPrintable)?.pretty() ?? prettyContent(value, indent: 0)

            let pretty = rawPretty
                .components(separatedBy: "\n")
                .filter { !$0.isEmpty }
                .map { indentString(count: 1) + $0 }
                .joined(separator: "\n")

            return "∙ \(keyString.bold):\n\(pretty)"
        }
        .joined(separator: "\n")
    }
}
