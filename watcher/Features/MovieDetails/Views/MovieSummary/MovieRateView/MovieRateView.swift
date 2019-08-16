import UIKit

final class RateView: UIView {
    typealias Rate = Decimal
    
    private let rateLabel = UILabel()
    private let circularView = UIView()
    
    init() {
        super.init(frame: .zero)
        
        addViewProperties()
        defineAndActivateConstraints()
        
        layer.masksToBounds = true
        layer.borderWidth = 2
        layer.borderColor = UIColor.black.cgColor
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(withRate rate: Rate) {
        rateLabel.text = rate.description
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = frame.height / 2
    }
}

extension RateView {
    private func addViewProperties() {
        addSubviews(
            circularView,
            rateLabel
        )
    }
    
    private func defineAndActivateConstraints() {
//        circularView.snp.makeConstraints {
//            $0.size.equalTo(rateLabel.)
//        }
        
        rateLabel.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
    }
}
