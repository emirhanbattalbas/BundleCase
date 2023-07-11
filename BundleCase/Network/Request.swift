import Foundation

public protocol Request: URLRequestConvertible {
    associatedtype ResponseType
    associatedtype Parameter: Encodable

    var path: String { get }
    var parameters: Parameter? { get }
    var headers: [String: String] { get }
    var method: HttpMethod { get }
    var encoder: ParameterEncoder { get }
    var parser: ResponseParser<ResponseType> { get }
}
