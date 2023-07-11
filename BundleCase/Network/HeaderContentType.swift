import Foundation

enum HeaderContentType {
    case json
    case url
}

extension HeaderContentType {
    var value: [String: String] {
        var headers: [String: String] = [:]
        switch self {
        case .json:
            headers["content-type"] = "application/json"
            return headers
        case .url:
            return headers
        }
    }
}
