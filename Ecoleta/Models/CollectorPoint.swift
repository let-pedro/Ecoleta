import Foundation

struct CollectorPoint: Codable{
    let id: Int
    let image: String
    let entityName: String
    let email: String
    let numberPhone: String
    let state: String
    let city: String
    let location: [Location]
    let collectItems: [Item]
}

struct Item: Codable {
    let name: String
}
