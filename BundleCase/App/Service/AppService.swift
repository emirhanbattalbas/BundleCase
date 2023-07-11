import Foundation
import Promises

final class AppService: RequestService {
    let loader: RequestLoaderProtocol
    
    init(loader: RequestLoaderProtocol) {
        self.loader = loader
    }
    
    func send<T>(request: T) -> Promise<T.ResponseType> where T: Request {
        return Promise { try request.asURLRequest() }
            .then(loader.load(request:))
            .then(on: .main) { result in
                return try request.parser(result)
            }
    }
}
