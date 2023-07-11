import UIKit

class ContentListCoordinator: ContentListCoordinatorProtocol {
    let navigationController: UINavigationController
    var childCoordinators: [Coordinator]
    let dependencies: Dependencies
        
    init(navigationController: UINavigationController, dependencies: Dependencies) {
        self.navigationController = navigationController
        self.dependencies = dependencies
        childCoordinators = []
    }
    
    func start() {
        let controller = ContentListViewController()
        let viewModel = ContentListViewModel(dependencies: dependencies)
        controller.viewModel = viewModel
        viewModel.view = controller
        viewModel.coordinator = self
        navigationController.pushViewController(controller, animated: true)
    }
    
    func navigateContentDetail(_ contentId: Int) {
        let coordinator = ContentDetailCoordinator(navigationController: navigationController,
                                                   dependencies: dependencies,
                                                   contentId: contentId)
        coordinator.start()
    }
    
}
