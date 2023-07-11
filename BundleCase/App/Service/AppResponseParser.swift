import Foundation

final class AppResponseParser {
    static func responseParser<T>() -> ResponseParser<T> where T: Decodable {
        return { response in
            
            guard 200 ..< 300 ~= response.httpCode else {
                throw ServiceError(errorMessage: "", httpCode: response.httpCode)
            }

            let responseModel = try JSONDecoder().decode(T.self, from: response.data)
            return responseModel
        }
    }
}

extension Request where ResponseType: Decodable {
    public var parser: ResponseParser<ResponseType> {
        return AppResponseParser.responseParser()
    }
}

// MARK: - BaseModel
struct BaseModel<T: Decodable>: Decodable {
    let data: T?
    let errorMessage: String?
    let bundleStatusCode: Int
}
