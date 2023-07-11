import UIKit

final class ContentDetailViewModel: ContentDetailViewModelProtocol {
    
    weak var view: ContentDetailViewProtocol?
    var coordinator: ContentDetailCoordinatorProtocol?
    
    let dependencies: Dependencies
    var contentId: Int
    
    var contentDetail: [ContentStoreDetail] = []

    init(dependencies: Dependencies, contentId: Int) {
        self.dependencies = dependencies
        self.contentId = contentId
    }
    
    func viewDidLoad() {
        getContentDetail()
    }
    
    private func getContentDetail() {
        let request = ContentStoreDetailRequest(id: contentId)
        dependencies.service.send(request: request)
            .then { response in
                self.contentDetail = response
                self.view?.reloadData()
            }.catch { error in
                print(error)
            }
    }
    
    func getContentDetailItemCellModel(_ indexPath: IndexPath) -> ContentDetailItemCellModel {
        let contentDetail = contentDetail[indexPath.row]
        return ContentDetailItemCellModel(name: contentDetail.name, isAdded: contentDetail.isAdded)
    }
    
}
