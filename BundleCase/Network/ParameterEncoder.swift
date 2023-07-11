import Foundation

enum ParameterEncodingError: Error {
    case jsonEncoding
    case invalidUrl
}

public protocol ParameterEncoder: AnyObject {

    func encode<Parameters: Encodable>(_ parameters: Parameters?, into request: inout URLRequest) throws -> URLRequest
}
