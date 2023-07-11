import UIKit

class ContentDetailCoordinator: ContentDetailCoordinatorProtocol {
    let navigationController: UINavigationController
    var childCoordinators: [Coordinator]
    let dependencies: Dependencies
    let contentId: Int

    init(navigationController: UINavigationController,
         dependencies: Dependencies,
         contentId: Int) {
        self.navigationController = navigationController
        self.dependencies = dependencies
        self.contentId = contentId
        childCoordinators = []
    }
    
    func start() {
        let controller = ContentDetailViewController()
        let viewModel = ContentDetailViewModel(dependencies: dependencies, contentId: contentId)
        controller.viewModel = viewModel
        viewModel.view = controller
        viewModel.coordinator = self
        navigationController.pushViewController(controller, animated: true)
    }
    
}
