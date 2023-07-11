import Foundation

protocol ContentListItemCellModelDataSource: AnyObject {
    var id: Int { get }
    var name: String { get }
    var imageURL: URL? { get }
    var isAdded: Bool { get }
    
}

class ContentListItemCellModel: ContentListItemCellModelDataSource {
    
    var id: Int
    var name: String
    var imageURL: URL?
    var isAdded: Bool
    
    init(id: Int,
         name: String,
         imageURL: String,
         isAdded: Bool) {
        self.id = id
        self.name = name
        self.imageURL = URL(string: imageURL)
        self.isAdded = isAdded
    }
}
