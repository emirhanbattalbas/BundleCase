import Foundation
import Promises

protocol RequestLoaderProtocol {
    func load(request: URLRequest) -> Promise<HttpResponse>
}
