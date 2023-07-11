import UIKit

final class RootCoordinator: RootCoordinatorProtocol {
    weak var parentCoordinator: Coordinator?
    var navigationController: NavigationController!
    var childCoordinators: [Coordinator]
    weak var window: UIWindow?
    weak var view: RootViewProtocol?

    init(window: UIWindow?) {
        self.window = window
        self.navigationController = NavigationController()
        self.childCoordinators = []
    }
    
    func start() {
        let rootViewModel = RootViewModel()
        rootViewModel.coordinator = self
        let rootViewController = RootViewController(viewModel: rootViewModel)
        rootViewModel.view = rootViewController
        view = rootViewController
        navigationController.viewControllers = [rootViewController]
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
    }
    
    func finish() {
        
    }
    
    func navigateContentList(dependencies: Dependencies) {
        let coordinator = ContentListCoordinator(navigationController: navigationController,
                                                 dependencies: dependencies)
        coordinator.start()
    }
}
