import Foundation

extension Date: PrettyPrintable {
    public var isFoundationType: Bool { true }

    public func pretty() -> String {
        dateFormatter.string(from: self) + " (\(timeIntervalSince1970))"
    }
}

private let dateFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    formatter.timeStyle = .short
    return formatter
}()
