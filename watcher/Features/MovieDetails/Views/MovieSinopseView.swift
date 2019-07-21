import UIKit

final class MovieSinopseView: UIView {
    private let sinopseLabel: UILabel = {
        let label = UILabel()
        label.text = """
        Joel Barish, heartbroken that his girlfriend underwent a procedure to erase him from her memory, decides to do the same. However, as he watches his memories of her fade away, he realises that he still loves her, and may be too late to correct his mistake.
        """
        label.numberOfLines = 0
        label.font = UIFont.init(name: "OpenSans-Regular", size: 15)
        label.textColor = UIColor.AppColors.black
        
        return label
    }()
    
    init() {
        super.init(frame: .zero)
        
        backgroundColor = UIColor.AppColors.white
        addViewProperties()
        defineAndActivateConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Private methods - UI

extension MovieSinopseView {
    private func addViewProperties() {
        addSubview(sinopseLabel)
    }
    
    private func defineAndActivateConstraints() {
        sinopseLabel.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}
