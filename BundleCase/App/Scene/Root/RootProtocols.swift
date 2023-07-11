import UIKit

// MARK: View
protocol RootViewProtocol: AppView where Self: UIViewController {
    
}

// MARK: ViewModel
protocol RootViewModelProtocol: AnyObject {
    var view: RootViewProtocol? { get set }
    var coordinator: RootCoordinatorProtocol? { get set }
    func viewDidLoad()
}

// MARK: Coordinator
protocol RootCoordinatorProtocol: Coordinator {
    func navigateContentList(dependencies: Dependencies)
}
