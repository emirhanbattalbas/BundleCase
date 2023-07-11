import Foundation

protocol AppRequest: Request { }

extension AppRequest {
    
    var baseUrl: URL {
        return URL(string: "https://bundle-api-contentstore-production.bundlenews.co/")!
    }
}

extension AppRequest {
    public var encoder: ParameterEncoder {
        switch method {
        case .get: return URLParameterEncoder.shared
        case .post, .put, .delete, .patch, .head: return JSONParameterEncoder.shared
        }
    }
    
    public var headers: [String: String] {
        let defaultHeaders: [String: String] = ["language": "TR",
                                                "country" : "TR",
                                                "DeviceToken": "9aa43dab-d2ca-4dc1-b374-afb462b3b8e5",
                                                "Platform": "IOS"]
        switch method {
        case .get: return defaultHeaders.merging(HeaderContentType.url.value) { $1 }
        case .post, .put, .delete, .patch, .head: return  defaultHeaders.merging(HeaderContentType.json.value) { $1 }
        }
    }

    public var parameters: [String: String]? {
        return nil
    }
    
    func asURLRequest() throws -> URLRequest {
        let url = path.isEmpty ? baseUrl : baseUrl.appendingPathComponent(path)
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        headers.forEach { key, value in request.setValue(value, forHTTPHeaderField: key) }
        return try encoder.encode(parameters, into: &request)
    }
    
}
