import Foundation

extension URL: PrettyPrintable {
    public var isFoundationType: Bool { true }

    public func pretty() -> String {
        absoluteString
    }
}
