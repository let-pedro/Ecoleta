import Foundation


struct State: Codable {
    let id: Int
    let nameState: String
    let cities: [City]
}
