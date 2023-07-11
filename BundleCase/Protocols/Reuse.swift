import UIKit

public protocol Reuse: AnyObject {
    static var reuseIdentifier: String { get }
}
