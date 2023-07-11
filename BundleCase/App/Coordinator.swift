import Foundation

final class AppCoordinator: Coordinator {
    
    var parentCoordinator: Coordinator?
    
    var childCoordinators: [Coordinator] = []
    
    var navigationController: NavigationController!
    
    func start() { }
    
    func finish() { }
}

protocol Coordinator: AnyObject {
    var childCoordinators: [Coordinator] { get set }
    var navigationController: NavigationController! { get set }
    var parentCoordinator: Coordinator? { get set }

    func start()
    func finish()
    func finish(completion: (() -> Void)?)
    func addChildCoordinator(_ coordinator: Coordinator)

    func removeChildCoordinator(_ coordinator: Coordinator)

    func removeAllChildCoordinatorsWith<T>(type: T.Type)
    
    func removeAllChildCoordinators()
    func didFinish(with: Coordinator)
}

extension Coordinator {
    
    func addChildCoordinator(_ coordinator: Coordinator) {
        childCoordinators.append(coordinator)
    }
    
    func removeChildCoordinator(_ coordinator: Coordinator) {
        
        if let index = childCoordinators.firstIndex(where: { $0 === coordinator }) {
            childCoordinators.remove(at: index)
        } else {
            print("Couldn't remove coordinator: \(coordinator). It's not a child coordinator.")
        }
    }
    
    func removeAllChildCoordinatorsWith<T>(type: T.Type) {
        childCoordinators = childCoordinators.filter { $0 is T  == false }
    }
    
    func removeAllChildCoordinators() {
        childCoordinators.removeAll()
    }
    
    func didFinish(with coordinator: Coordinator) {
        removeChildCoordinator(coordinator)
    }
}

extension Coordinator {
    func finish() {
        finish(completion: nil)
    }
    
    func finish(completion: (() -> Void)?) {
        parentCoordinator?.didFinish(with: self)
    }
}
