import Foundation

struct ContentStoreListRequest: AppRequest {
            
    typealias ResponseType = ContentStoreList
        
    var path: String = "contentstore/packages"
        
    var method: HttpMethod = .get
    
}
