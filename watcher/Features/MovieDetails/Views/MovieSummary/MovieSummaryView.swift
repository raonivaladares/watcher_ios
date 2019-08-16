import UIKit

final class MovieSummaryView: UIView {
    private let rateView = RateView()
    
    // MARK: - Inits
    
    init() {
        super.init(frame: .zero)
        
        backgroundColor = .green
        addViewProperties()
        defineAndActivateConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(rate: Decimal) {
        rateView.configure(withRate: rate)
    }
}

// MARK: - Private methods - UI

extension MovieSummaryView {
    private func addViewProperties() {
        addSubview(rateView)
    }
    
    private func defineAndActivateConstraints() {
        rateView.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
    }
}
