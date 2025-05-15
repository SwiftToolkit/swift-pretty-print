import Foundation

public func prettyPrint(_ value: Any) {
    print(String(describing: type(of: value)) + ":")
    print(prettyContent(value, indent: 0))
}

public func prettyContent(_ value: Any, indent: Int) -> String {
    let indentation = indentString(count: indent)

    if let printable = value as? PrettyPrintable {
        return indentation + "∙ \(printable.pretty())\n"
    }

    if let rawRepresentable = value as? any RawRepresentable,
       let rawPrintable = rawRepresentable.rawValue as? PrettyPrintable {
        return indentation + "∙ \(rawPrintable.pretty())\n"
    }

    return MirrorBasedPrintable(value: value, indent: indent).pretty()
}

func indentString(count: Int) -> String {
    String(repeating: " ", count: count * 4)
}
