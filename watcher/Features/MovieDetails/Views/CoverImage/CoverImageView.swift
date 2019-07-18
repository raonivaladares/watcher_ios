import UIKit

final class CoverImageView: UIView {
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .purple
        
        return imageView
    }()
    
    init() {
        super.init(frame: .zero)
        
        addViewProperties()
        defineAndActivateConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


// MARK: - Private methods - UI

extension CoverImageView {
    private func addViewProperties() {
        addSubview(imageView)
    }
    
    private func defineAndActivateConstraints() {
        imageView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}
