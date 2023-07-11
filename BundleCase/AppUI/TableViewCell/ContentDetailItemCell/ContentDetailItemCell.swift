import UIKit
import TinyConstraints
import DeclarativeLayoutKit

class ContentDetailItemCell: BaseTableViewCell {

    lazy var containerView: UIView = {
       let view = UIView()
            .clipsToBounds(true)
            .backgroundColor(.white)
        return view
    }()
    
    lazy var separatorView: UIView = {
        let view = UIView()
             .clipsToBounds(true)
             .backgroundColor(.lightGray.withAlphaComponent(0.5))
         return view
    }()
    
    lazy var nameLabel: UILabel = {
       let label = UILabel()
            .font(.systemFont(ofSize: 13, weight: .semibold))
            .textColor(.black)
            .numberOfLines(0)
        return label
    }()
    
    lazy var checkBoxImageView: UIImageView = {
        let imageView = UIImageView()
             .contentMode(.center)
             .clipsToBounds(true)
         return imageView
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    override func setupViews() {
        super.setupViews()
        
        containerView.addSubview(nameLabel)
        containerView.addSubview(checkBoxImageView)
        containerView.addSubview(separatorView)
        
        contentView.addSubview(containerView)
    }
    
    override func setupLayout() {
        super.setupLayout()
        containerView.edgesToSuperview(insets: .init(top: 8,
                                                     left: 16,
                                                     bottom: 8,
                                                     right: 16))
        
        nameLabel.edgesToSuperview(excluding: .trailing)
        
        checkBoxImageView.size(.init(width: 24, height: 24))
        checkBoxImageView.centerYToSuperview()
        checkBoxImageView.trailingToSuperview()
        
        separatorView.edgesToSuperview(excluding: .top)
        separatorView.height(1)
    }
    
    func set(_ cellModel: ContentDetailItemCellModel) {
        nameLabel.text(cellModel.name)
        checkBoxImageView.image = cellModel.isAdded ? UIImage(systemName: "checkmark")?.withTintColor(.black) : nil
    }
}
