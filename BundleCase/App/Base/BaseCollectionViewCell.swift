import UIKit

open class BaseCollectionViewCell: UICollectionViewCell {
 
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupLayout()
    }

    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)

        setupViews()
        setupLayout()
    }

    open func setupViews() {
        backgroundColor = .clear
    }
    
    open func setupLayout() {}
    
}

extension BaseCollectionViewCell: Reuse {
    public static var reuseIdentifier: String {
        return String(describing: self)
    }
}
