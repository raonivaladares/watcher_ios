import UIKit
import SnapKit

final class SearchMoviewHeaderCell: UITableViewHeaderFooterView {
    private let descriptionLabel = UILabel()
    private let logoImageView = UIImageView()
    private let searchTextField = UITextField()
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        
        addViews()
        defineAndActivateConstraints()
        
        descriptionLabel.text = "Wich movie are you looking for?"
        descriptionLabel.font = UIFont(name: "OpenSans-Extrabold", size: 23)
        descriptionLabel.numberOfLines = 3
        logoImageView.image = UIImage(named: "watcher_logo_small")
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension SearchMoviewHeaderCell {
    private func addViews() {
        addSubviews(descriptionLabel,
                    logoImageView,
                    searchTextField
        )
    }
    
    private func defineAndActivateConstraints() {
        descriptionLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview().offset(-20)
            $0.leading.equalToSuperview().offset(25)
//            $0.bottom.equalToSuperview()
            $0.width.equalToSuperview().multipliedBy(0.5)
        }
        
        logoImageView.snp.makeConstraints {
            $0.centerY.equalToSuperview().offset(-20)
            $0.trailing.equalToSuperview().offset(-25)
        }
        searchTextField.backgroundColor = .red
        searchTextField.snp.makeConstraints {
            $0.leading.equalToSuperview()
            $0.bottom.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.height.equalTo(50)
        }
    }
}
