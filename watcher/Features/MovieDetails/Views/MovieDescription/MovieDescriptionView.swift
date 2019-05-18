import UIKit
import SnapKit

final class MovieDescriptionView: UIViewController {
    private let coverImageView = UIImageView()
    private let rateView = MovieRateView()
    private let nameLabel = UILabel()
    private let yearAndDurationLabel = UILabel()
    private let descriptionLabel = UILabel()
    
    init() {
        super.init(nibName: nil, bundle: nil)
        
        addViewProperties()
        defineAndActivateConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Private methods - UI

extension MovieDescriptionView {
    private func configureUIElements() {
            coverImageView.backgroundColor = .red
    }
    
    private func addViewProperties() {
        view.addSubviews(
            coverImageView
        )
    }
    
    private func defineAndActivateConstraints() {
        
    }
}
