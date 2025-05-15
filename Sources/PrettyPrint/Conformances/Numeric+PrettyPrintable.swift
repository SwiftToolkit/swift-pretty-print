import Foundation

extension Numeric where Self: LosslessStringConvertible, Self: PrettyPrintable {
    public var isFoundationType: Bool { true }

    public func pretty() -> String {
        String(self)
    }
}

extension Int: PrettyPrintable {}
extension Int8: PrettyPrintable {}
extension Int16: PrettyPrintable {}
extension Int32: PrettyPrintable {}
extension Int64: PrettyPrintable {}
extension UInt: PrettyPrintable {}
extension UInt8: PrettyPrintable {}
extension UInt16: PrettyPrintable {}
extension UInt32: PrettyPrintable {}
extension UInt64: PrettyPrintable {}
extension Float: PrettyPrintable {}
extension Double: PrettyPrintable {}