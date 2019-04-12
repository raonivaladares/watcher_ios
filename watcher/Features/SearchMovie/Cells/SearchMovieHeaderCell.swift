import UIKit
import SnapKit

final class SearchMoviewHeaderCell: UITableViewHeaderFooterView, UITextFieldDelegate {
    private let descriptionLabel = UILabel()
    private let logoImageView = UIImageView()
    private let searchTextField = UITextField()
    var textFieldEditingDidChangeHandler: ((String?) -> Void)?
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        
        addViews()
        defineAndActivateConstraints()
        
        descriptionLabel.text = "Wich movie are you looking for?"
        descriptionLabel.font = UIFont(name: "OpenSans-Extrabold", size: 23)
        descriptionLabel.numberOfLines = 3
        
        logoImageView.image = UIImage(named: "watcher_logo_small")
        
        searchTextField.backgroundColor = .white
        searchTextField.placeholder = "Type any movie here!"
        searchTextField.font = UIFont(name: "OpenSans-Semibold", size: 15)
        searchTextField.setSidePaddingPoints(5)
        searchTextField.addTarget(self, action: #selector(textFieldEditingDidChange(_:)), for: .editingChanged)
        
        searchTextField.delegate = self
    }
    
    @objc func textFieldEditingDidChange(_ sender: UITextField) {
        textFieldEditingDidChangeHandler?(sender.text)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        searchTextField.resignFirstResponder()
        //or
        //self.view.endEditing(true)
        return true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension SearchMoviewHeaderCell {
    private func addViews() {
       contentView.addSubviews(descriptionLabel,
                    logoImageView,
                    searchTextField
        )
    }
    
    private func defineAndActivateConstraints() {
        descriptionLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview().offset(-20)
            $0.leading.equalToSuperview().offset(25)
            $0.width.equalToSuperview().multipliedBy(0.5)
        }
        
        logoImageView.snp.makeConstraints {
            $0.centerY.equalToSuperview().offset(-20)
            $0.trailing.equalToSuperview().offset(-25)
        }
        
        searchTextField.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(20)
            $0.bottom.equalToSuperview()
            $0.trailing.equalToSuperview().offset(-20)
            $0.height.equalTo(50)
        }
    }
}

extension UITextField {
    func setSidePaddingPoints(_ amount: CGFloat){
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.leftView = paddingView
        self.leftViewMode = .always
    }
}
