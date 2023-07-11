import UIKit

final class ContentDetailViewController: UIViewController, ContentDetailViewProtocol {

    var viewModel: ContentDetailViewModelProtocol?
    
    lazy var backButton: UIButton = {
        let button = UIButton()
            .image(.init(systemName: "arrow.backward")?.withTintColor(.black))
            .onTap { [weak self] in
                self?.popViewController(animated: true)
            }
        return button
    }()
    
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
        view.addSubview(backButton)
        view.addSubview(tableView)
    }
    
    private func setupLayouts() {
        backButton.size(.init(width: 50, height: 50))
        backButton.edgesToSuperview(excluding: [.bottom, .trailing], usingSafeArea: true)
        
        tableView.topToBottom(of: backButton)
        tableView.edgesToSuperview(excluding: .top, usingSafeArea: true)
    }
    
    func reloadData() {
        tableView.reloadData()
    }
    
    private func configureTableView() {
        tableView.register(ContentDetailItemCell.self)
    }
}

// MARK: - UITableViewDelegate
extension ContentDetailViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
}

// MARK: - UITableViewDataSource
extension ContentDetailViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let viewModel = viewModel else { return 0 }
        return viewModel.contentDetail.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: ContentDetailItemCell = tableView.dequeueReusableCell(for: indexPath)
        guard let viewModel = viewModel else { return cell }
        cell.set(viewModel.getContentDetailItemCellModel(indexPath))
        return cell
    }
}
