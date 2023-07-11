import Foundation

struct ContentStoreDetail: Codable {
    var id: Int
    var isAdded: Bool
    var name: String
    var index: Int
    var channelCategoryId: Int
    var countryId: Int
    var isVideoChannel: Bool
}
