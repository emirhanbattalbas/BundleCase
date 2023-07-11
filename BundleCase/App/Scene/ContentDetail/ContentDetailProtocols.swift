import Foundation

// MARK: View
protocol ContentDetailViewProtocol: AppView {
    func reloadData()
}

// MARK: ViewModel
protocol ContentDetailViewModelProtocol: AnyObject {
    var view: ContentDetailViewProtocol? { get set }
    var coordinator: ContentDetailCoordinatorProtocol? { get set }
    func viewDidLoad()
    
    var contentDetail: [ContentStoreDetail] { get set }
    func getContentDetailItemCellModel(_ indexPath: IndexPath) -> ContentDetailItemCellModel
}

// MARK: Coordinator
protocol ContentDetailCoordinatorProtocol: AnyObject {

}
