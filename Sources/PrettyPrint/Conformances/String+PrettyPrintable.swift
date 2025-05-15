import Foundation

extension String: PrettyPrintable {
    public var isFoundationType: Bool { true }

    public func pretty() -> String {
        self
    }
}
