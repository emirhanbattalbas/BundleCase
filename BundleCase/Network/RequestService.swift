import Foundation
import Promises

protocol RequestService: AnyObject {
    func send<T>(request: T) -> Promise<T.ResponseType> where T: Request
}
