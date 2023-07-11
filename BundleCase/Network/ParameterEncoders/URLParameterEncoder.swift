import Foundation

public class URLParameterEncoder: ParameterEncoder {
    
    static let shared = URLParameterEncoder()
    
    public init() {
        
    }
    
    open func encode<Parameters: Encodable>(_ parameters: Parameters?,
                                            into request: inout URLRequest) throws -> URLRequest {
        let encoder: URLQueryItemEncoderProtocol = URLQueryItemEncoder()
        
        guard let url = request.url, var components = URLComponents(url: url, resolvingAgainstBaseURL: false) else {
            throw ParameterEncodingError.invalidUrl
        }
        guard let parameters = parameters else {
            return request
        }
        let queryItems = try encoder.encode(parameters)
        if !queryItems.isEmpty {
            components.queryItems = queryItems
        }
        guard let encodedUrl = components.url else {
            throw ParameterEncodingError.invalidUrl
        }
        request.url = encodedUrl
        return request
    }
}
