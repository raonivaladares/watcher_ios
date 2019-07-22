import UIKit

final class CoverImageView: UIView {
    private let imageView = UIImageView()
    private let gradientView = GradientBackgroundView()
    
    // MARK: - Inits
    
    init() {
        super.init(frame: .zero)
        
        addViewProperties()
        defineAndActivateConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(coverURL: URL) {
        imageView.load(fromURL: coverURL)
    }
}


// MARK: - Private methods - UI

extension CoverImageView {
    private func addViewProperties() {
        addSubview(imageView)
        addSubview(gradientView)
    }
    
    private func defineAndActivateConstraints() {
        imageView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        gradientView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}

final class GradientBackgroundView: UIView {
    private let gradientLayer: CAGradientLayer = {
        let colorForTop = UIColor.clear.cgColor
        let colorForBottom = UIColor.AppColors.white.cgColor
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [colorForBottom, colorForTop]
        gradientLayer.locations = [0, 0.3]
        gradientLayer.startPoint = CGPoint(x: 1, y: 1)
        gradientLayer.endPoint = CGPoint(x: 1, y: 0)
        
        return gradientLayer
    }()
    
    init() {
        super.init(frame: .zero)
        
        layer.insertSublayer(gradientLayer, at: 0)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        gradientLayer.frame = bounds
    }
}
