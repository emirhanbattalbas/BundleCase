import UIKit

public protocol AppView: AnyObject {
    func showIndicatorLoading()
    func hideIndicatorLoading()
    func showIndicatorLoadingOnView()
    func hideIndicatorLoadingOnView()
    func popViewController(animated: Bool)
    func dismiss(animated: Bool, completion: (() -> Void)?)
}

public extension AppView where Self: UIViewController {
    
    func showIndicatorLoading() {

    }
    
    func showIndicatorLoadingOnView() {

    }
    
    func hideIndicatorLoadingOnView() {

    }
    
    func hideIndicatorLoading() {

    }
    
    func popViewController(animated: Bool) {
        navigationController?.popViewController(animated: animated)
    }
    
    func popToRoot(animated: Bool) {
        navigationController?.popToRootViewController(animated: animated)
    }

    func dismiss(animated: Bool, completion: (() -> Void)?) {
        navigationController?.dismiss(animated: animated, completion: completion)
    }
    
    func present(viewController: UIViewController, animated: Bool, completion: (() -> Void)?) {

    }

}
