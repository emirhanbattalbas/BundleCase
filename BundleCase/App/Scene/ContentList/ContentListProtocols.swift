import Foundation

// MARK: View
protocol ContentListViewProtocol: AppView {
    func reloadData()
}

// MARK: ViewModel
protocol ContentListViewModelProtocol: AnyObject {
    var view: ContentListViewProtocol? { get set }
    var coordinator: ContentListCoordinatorProtocol? { get set }
    func viewDidLoad()
    
    var contentList: [ContentStoreItem] { get set }
    func getContentItemCellModel(_ indexPath: IndexPath) -> ContentListItemCellModel
    
    func navigateContentDetail(_ indexPath: IndexPath)
}

// MARK: Coordinator
protocol ContentListCoordinatorProtocol: AnyObject {
    func navigateContentDetail(_ contentId: Int)
}
