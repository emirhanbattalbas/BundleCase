import UIKit
import Combine

final class RootViewModel: RootViewModelProtocol {
    
    weak var view: RootViewProtocol?
    weak var coordinator: RootCoordinatorProtocol?
    private var dependencies: Dependencies = Dependencies()
    
    private var service: RequestService {
        return dependencies.service
    }
    
    func viewDidLoad() {
        coordinator?.navigateContentList(dependencies: dependencies)
    }
}
