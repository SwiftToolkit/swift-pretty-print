import ArgumentParser
import PrettyPrint
import Foundation

struct Address {
    let street: String
    let city: String
    let zipCode: String
    let coordinates: (Double, Double)
    let metadata: [String: Any]?
}

struct ContactInfo {
    let phoneNumbers: Set<String>
    let email: String
    let socialProfiles: [String: String]
}

struct User {
    let id: UUID
    let name: String
    let age: Int
    let isActive: Bool
    let score: Double
    let favoriteColor: String?
    let tags: Set<String>
    let preferences: [String: Any]
    let address: Address
    let contactInfo: ContactInfo
    let favoriteNumbers: [Int]
    let recentActivities: [(date: Date, action: String)]
}

@main
struct CLI: ParsableCommand {
    @Flag(help: "Print in the regular, non-pretty format")
    var ugly = false

    func run() throws {
        let user = User(
            id: UUID(),
            name: "John Doe",
            age: 32,
            isActive: true,
            score: 85.5,
            favoriteColor: nil,
            tags: ["developer", "swift", "ios"],
            preferences: [
                "theme": "dark",
                "notifications": true,
                "autoSave": 30,
                "filters": ["date", "priority"]
            ],
            address: Address(
                street: "123 Swift Street",
                city: "Cupertino",
                zipCode: "95014",
                coordinates: (37.3320, -122.0312),
                metadata: ["type": "residential", "verified": true]
            ),
            contactInfo: ContactInfo(
                phoneNumbers: ["555-1234", "555-5678"],
                email: "john.doe@example.com",
                socialProfiles: [
                    "twitter": "@johndoe",
                    "github": "johndoe",
                    "linkedin": "john-doe"
                ]
            ),
            favoriteNumbers: [3, 7, 13, 42],
            recentActivities: [
                (date: Date(), action: "logged in"),
                (date: Date().addingTimeInterval(-86400), action: "updated profile"),
                (date: Date().addingTimeInterval(-172800), action: "posted comment")
            ]
        )

        if ugly {
            print("\nHere's how a regular print looks like:\n")
            print(user)
        } else {
            print("\nHere's what it PrettyPrint looks like:\n")
            prettyPrint(user)
        }
    }
}
