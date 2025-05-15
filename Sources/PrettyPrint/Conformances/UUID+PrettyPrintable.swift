import Foundation

extension UUID: PrettyPrintable {
    public var isFoundationType: Bool { true }

    public func pretty() -> String {
        uuidString
    }
}
