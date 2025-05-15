import Foundation

extension String {
    var bold: String {
        "\u{001B}[1m\(self)\u{001B}[0m"
    }
}