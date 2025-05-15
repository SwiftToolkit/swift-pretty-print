import Foundation

extension Bool: PrettyPrintable {
    public var isFoundationType: Bool { true }

    public func pretty() -> String {
        String(self)
    }
}
