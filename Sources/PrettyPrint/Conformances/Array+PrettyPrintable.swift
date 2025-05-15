import Foundation

extension Array: PrettyPrintable {
    public var isFoundationType: Bool { true }
    public var requiresNewline: Bool { true }

    public func pretty() -> String {
        enumerated()
            .map { index, element in
            let boldIndex = "[\(index)]".bold
                guard let printable = element as? PrettyPrintable else {
                    return "∙ \(boldIndex)\n\(prettyContent(element, indent: 1))"
                }

                let newLineIfNeeded = printable.requiresNewline ? "\n" : " "
                return "∙ \(boldIndex)\(newLineIfNeeded)\(printable.pretty())"
            }
            .joined(separator: "\n")
    }
}
