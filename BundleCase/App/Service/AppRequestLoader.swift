import Foundation
import Promises

final class AppRequestLoader: NSObject, RequestLoaderProtocol {
    
    var session: URLSession
    
    init(session: URLSession) {
        self.session = session
        
        super.init()
        self.session = URLSession(configuration: .default, delegate: self, delegateQueue: nil)
    }
    
    public func load(request: URLRequest) -> Promise<HttpResponse> {
        return wrap { (handler: @escaping (Data?, URLResponse?, Error?) -> Void) in
            self.session.dataTask(with: request, completionHandler: handler).resume()
        }.then { data, urlResponse in
            return self.parseHTTPURLResponse(response: urlResponse).then { (data, $0) }
        }.then { data, httpResponse in
            let response = HttpResponse(data: data ?? Data(), httpCode: httpResponse.statusCode)
            return Promise(response)
        }
    }
    
    private func parseHTTPURLResponse(response: URLResponse?) -> Promise<HTTPURLResponse> {
        return Promise { fullfill, reject in
            guard let httpResponse = response as? HTTPURLResponse else {
                reject(PromiseError.validationFailure)
                return
            }
            return fullfill(httpResponse)
        }
    }
}

private extension URLRequest {
    var apiName: String {
        return url?.path.components(separatedBy: "/").last ?? ""
    }
}

extension AppRequestLoader: URLSessionDelegate { }

public enum URLRequestError: Int, Error {
    case invalidUrl
}
