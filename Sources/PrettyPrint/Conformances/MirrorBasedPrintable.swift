import Foundation

struct MirrorBasedPrintable: PrettyPrintable {
    let value: Any
    let indent: Int

    var isFoundationType: Bool { false }
    var requiresNewline: Bool { true }

    func pretty() -> String {
        let indentation = indentString(count: indent)
        var result = ""

        let mirror = Mirror(reflecting: value)
        mirror.children.forEach {
            var prefix = indentation + "∙ " + ($0.label?.bold ?? "?")
            let value = $0.value

            let printable = value as? PrettyPrintable
            if !(printable?.isFoundationType ?? false) {
                var subjectType = String(describing: type(of: $0.value))
                if subjectType.first == "(", subjectType.last == ")" {
                    subjectType = "Tuple of: " + subjectType.dropFirst().dropLast()
                }

                prefix += " (\(subjectType)):"
            } else {
                prefix += ":"
            }

            if let printable {
                let prettyContent = printable.pretty()
                if printable.requiresNewline {
                    let prettyContentWithIndent = prettyContent
                        .components(separatedBy: "\n")
                        .filter { !$0.isEmpty }
                        .map { indentString(count: indent + 1) + $0 }
                        .joined(separator: "\n")
                    result += prefix + "\n" + prettyContentWithIndent
                } else {
                    result += prefix + " " + prettyContent
                }
            } else {
                result += prefix + "\n" + prettyContent(value, indent: indent + 1)
            }

            result += "\n"
        }

        return result.removingEmptyLines()
    }
}

extension String {
    func removingEmptyLines() -> String {
        components(separatedBy: "\n")
            .filter { !$0.isEmpty }
            .joined(separator: "\n")
    }
}
