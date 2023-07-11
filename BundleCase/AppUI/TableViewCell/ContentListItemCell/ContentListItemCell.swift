import UIKit
import TinyConstraints
import DeclarativeLayoutKit
import Kingfisher

class ContentListItemCell: BaseTableViewCell {

    lazy var containerView: UIView = {
       let view = UIView()
            .shadowColor(.black.withAlphaComponent(0.3))
            .shadowOpacity(0.5)
            .shadowRadius(4)
            .shadowOffset(.zero)
            .cornerRadius(16)
            .clipsToBounds(true)
            .backgroundColor(.white)
        view.layer.masksToBounds = false
        return view
    }()
    
    lazy var stackView: UIStackView = {
       return UIStackView()
            .axis(.horizontal)
            .alignment(.fill)
            .distribution(.fill)
            .spacing(8)
    }()
    
    lazy var nameLabel: UILabel = {
       let label = UILabel()
            .font(.systemFont(ofSize: 13, weight: .semibold))
            .textColor(.black)
            .numberOfLines(0)
        return label
    }()
    
    lazy var thumbnailImageView: UIImageView = {
       let imageView = UIImageView()
            .contentMode(.scaleAspectFill)
            .clipsToBounds(true)
            .cornerRadius(8)
        return imageView
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
        stackView.addArrangedSubview(thumbnailImageView)
        stackView.addArrangedSubview(nameLabel)
        stackView.addArrangedSubview(checkBoxImageView)
        
        containerView.addSubview(stackView)
        contentView.addSubview(containerView)
    }
    
    override func setupLayout() {
        super.setupLayout()
        containerView.edgesToSuperview(insets: .init(top: 8,
                                                     left: 16,
                                                     bottom: 8,
                                                     right: 16))
        
        stackView.edgesToSuperview(insets: .init(top: 8,
                                                 left: 8,
                                                 bottom: 8,
                                                 right: 8))
        thumbnailImageView.size(.init(width: 100, height: 100))
        checkBoxImageView.width(24)
    }
    
    func set(_ cellModel: ContentListItemCellModel) {
        nameLabel.text(cellModel.name)
        thumbnailImageView.kf.setImage(with: cellModel.imageURL)
        checkBoxImageView.image = cellModel.isAdded ? UIImage(systemName: "checkmark")?.withTintColor(.black) : nil
    }
}
