import Foundation

protocol ContentDetailItemCellModelDataSource: AnyObject {
    var name: String { get }
    var isAdded: Bool { get }
}

class ContentDetailItemCellModel: ContentDetailItemCellModelDataSource {
    
    var name: String
    var isAdded: Bool
    
    init(name: String,
         isAdded: Bool) {
        self.name = name
        self.isAdded = isAdded
    }
}
