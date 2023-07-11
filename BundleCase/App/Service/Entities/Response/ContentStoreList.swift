import Foundation

struct ContentStoreList: Codable {
    let data: [ContentStoreItem]
    let errorMessage: String?
    let bundleStatusCode: Int
}

struct ContentStoreItem: Codable {
    var id: Int
    var isAdded: Bool
    var name: String
    var description: String
    var index: Int
    var image: String
    var style: Style
    var sourceCount: Int
}

struct Style: Codable {
    var fontColor: String
}
