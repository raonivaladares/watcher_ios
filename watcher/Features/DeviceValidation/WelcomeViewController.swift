import UIKit
import NetworkPlataform

class WelcomeViewController: UIViewController {
	let validationLabel: UILabel = {
		let label = UILabel()
		label.text = "We use this app you need to validate your device at:"
		label.font = UIFont.boldSystemFont(ofSize: 22)
		label.textColor = .red
		label.numberOfLines = 0
		label.translatesAutoresizingMaskIntoConstraints = false
		
		return label
	}()
	
	let tmdLogoImageView: UIImageView = {
		let imageView = UIImageView()
		imageView.image = UIImage(named: "tmdb_logo")
		
		imageView.translatesAutoresizingMaskIntoConstraints = false
		
		return imageView
	}()
	
	let validationButton: UIButton = {
		let button = UIButton()
		button.setTitle("Validate", for: .normal)
		button.setTitleColor(.red, for: .normal)
		button.backgroundColor = .white
		button.layer.cornerRadius = 20
		button.addTarget(self, action: #selector(validationButtonHandler(_:)), for: .touchUpInside)
		button.translatesAutoresizingMaskIntoConstraints = false
		
		return button
	}()
	
	private let viewModel: WelcomeViewModel = WelcomeViewModel()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		view.backgroundColor = .blue
		addViews()
		defineAndActivateConstraints()
		
		viewModel.requestUserToken()
	}
	
	@objc private func validationButtonHandler(_ sender: UIButton) {
		//TODO: refactor
		guard let userToken = viewModel.userToken else { return }

		let loginViewModel = TMVDBLoginViewModel(requestToken: userToken)
		let viewController = TMVDBLoginViewController(viewModel: loginViewModel)
		present(viewController, animated: true)
	}
	
	override func viewWillAppear(_ animated: Bool) {
		//TODO: refactor
		guard let _ = viewModel.userToken else { return }
		
		viewModel.requestNewSession()
	}
}

// MARK: - UI methods
extension WelcomeViewController {
	private func addViews() {
		view.addSubview(validationLabel)
		view.addSubview(tmdLogoImageView)
		view.addSubview(validationButton)
	}
	
	private func defineAndActivateConstraints() {
		NSLayoutConstraint.activate([
			validationLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
			validationLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
			validationLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
			
			tmdLogoImageView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
			tmdLogoImageView.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor),
			tmdLogoImageView.widthAnchor.constraint(equalToConstant: 300),
			tmdLogoImageView.heightAnchor.constraint(equalToConstant: 300),
			
			validationButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -40),
			validationButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
			validationButton.widthAnchor.constraint(equalToConstant: 200),
			validationButton.heightAnchor.constraint(equalToConstant: 40),
			])
	}
}
