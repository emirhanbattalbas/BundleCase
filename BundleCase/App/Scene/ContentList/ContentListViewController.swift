import UIKit
import TinyConstraints
import DeclarativeLayoutKit

final class ContentListViewController: UIViewController, ContentListViewProtocol {
    
    var viewModel: ContentListViewModelProtocol?
    
    lazy var tableView: UITableView = {
       return UITableView()
            .delegate(self)
            .dataSource(self)
            .separatorStyle(.none)
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        viewModel?.viewDidLoad()
        configureTableView()
        setupViews()
        setupLayouts()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = true
    }
    
    private func setupViews() {
        view.addSubview(tableView)
    }
    
    private func setupLayouts() {
        tableView.edgesToSuperview(usingSafeArea: true)
    }
    
    func reloadData() {
        tableView.reloadData()
    }
    
    private func configureTableView() {
        tableView.register(ContentListItemCell.self)
    }
}

// MARK: - UITableViewDelegate
extension ContentListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel?.navigateContentDetail(indexPath)
    }
}

// MARK: - UITableViewDataSource
extension ContentListViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let viewModel = viewModel else { return 0 }
        return viewModel.contentList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: ContentListItemCell = tableView.dequeueReusableCell(for: indexPath)
        guard let viewModel = viewModel else { return cell }
        cell.set(viewModel.getContentItemCellModel(indexPath))
        return cell
    }
}
