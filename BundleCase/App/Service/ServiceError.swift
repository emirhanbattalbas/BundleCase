import Foundation

public struct ServiceError: Error {
    public let errorMessage: String?
    public let httpCode: Int
}
