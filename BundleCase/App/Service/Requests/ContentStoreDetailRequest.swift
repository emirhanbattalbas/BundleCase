import Foundation

struct ContentStoreDetailRequest: AppRequest {

    typealias ResponseType = [ContentStoreDetail]
    
    var path: String
    
    var method: HttpMethod = .get
    
    init(id: Int) {
        self.path = "contentstore/package/\(id)"
    }
}
