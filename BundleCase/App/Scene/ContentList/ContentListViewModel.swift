import UIKit

final class ContentListViewModel: ContentListViewModelProtocol {
    
    weak var view: ContentListViewProtocol?
    var coordinator: ContentListCoordinatorProtocol?
    let dependencies: Dependencies
    
    var contentList: [ContentStoreItem] = []
    
    init(dependencies: Dependencies) {
        self.dependencies = dependencies
    }
    
    func viewDidLoad() {
        getContentList()
    }
    
    private func getContentList() {
        let request = ContentStoreListRequest()
        dependencies.service.send(request: request)
            .then { response in
                self.contentList = response.data
                self.view?.reloadData()
            }.catch { error in
                print(error)
            }
    }
    
    func getContentItemCellModel(_ indexPath: IndexPath) -> ContentListItemCellModel {
        let content = contentList[indexPath.row]
        return ContentListItemCellModel(id: content.id,
                                        name: content.name,
                                        imageURL: content.image,
                                        isAdded: content.isAdded)
    }
    
    func navigateContentDetail(_ indexPath: IndexPath) {
        let contentId = contentList[indexPath.row].id
        coordinator?.navigateContentDetail(contentId)
    }
}
