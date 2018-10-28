import UIKit
import NetworkPlataform

class WelcomeViewController: UIViewController {
	
	// MARK: Private UI properties
	
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
	
	// MARK: Private properties
	
	private let viewModel: WelcomeViewModel
	private let loadingController = LoadingViewController()
	
	init(viewModel: WelcomeViewModel) {
		self.viewModel = viewModel
		
		super.init(nibName: nil, bundle: nil)
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}

// MARK: ViewController life-cycle

extension WelcomeViewController {
	override func viewDidLoad() {
		super.viewDidLoad()
		
		addChild(loadingController)
		view.addSubview(loadingController.view)
		loadingController.didMove(toParent: self)
		
		view.backgroundColor = .black
		addViews()
		defineAndActivateConstraints()
	}
}

// MARK: Action Handlers

extension WelcomeViewController {
	@objc private func validationButtonHandler(_ sender: UIButton) {
		//TODO: refactor
		loadingController.showLoading()
		viewModel.requestGuestNewSession { result in
			self.loadingController.hideLoading()
			result.analysis(ifSuccess: {
				let viewModel = HomeViewModel()
				let homeViewController = HomeViewController(withViewModel: viewModel)
				let navigationController = UINavigationController(rootViewController: homeViewController)
				self.present(navigationController, animated: true)
			}, ifFailure: { error in
				print(error)
				let alertController = UIAlertController(title: "a", message: "aa", preferredStyle: .alert)
				let okAction = UIAlertAction(title: "OK", style: .default)
				
				alertController.addAction(okAction)
				self.present(alertController, animated: true, completion: nil)
			})
		}
	}
}

// MARK: - Private methods - UI

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
