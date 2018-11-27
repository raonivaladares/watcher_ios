import UIKit
import SnapKit

class WelcomeViewController: UIViewController {
	
	// MARK: Private UI properties
	
	let validationLabel: UILabel = {
		let label = UILabel()
		label.text = "API by"
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
		button.setTitle("Start", for: .normal)
		button.setTitleColor(.red, for: .normal)
		button.backgroundColor = .blue
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
		view.backgroundColor = .white
		addChild(loadingController)
		view.addSubview(loadingController.view)
		loadingController.didMove(toParent: self)
		
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
				let homeViewController = SearchMovieViewController()
				self.present(homeViewController, animated: true)
			}, ifFailure: { viewModelError in
				let alertController = UIAlertController(title: viewModelError.title, message: viewModelError.message, preferredStyle: .alert)
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
		view.addSubviews(validationLabel,
										 tmdLogoImageView,
										 validationButton
		)
	}
	
	private func defineAndActivateConstraints() {
		validationLabel.snp.makeConstraints {
			$0.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(16)
			$0.leading.equalTo(view.safeAreaLayoutGuide.snp.leading).offset(16)
			$0.trailing.equalTo(view.safeAreaLayoutGuide.snp.trailing).offset(-16)
		}
		
		tmdLogoImageView.snp.makeConstraints {
			$0.centerX.equalToSuperview()
			$0.centerY.equalToSuperview()
			$0.width.equalTo(200)
			$0.height.equalTo(200)
		}
		
		validationButton.snp.makeConstraints {
			$0.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(-40)
			$0.centerX.equalToSuperview()
			$0.width.equalTo(200)
			$0.height.equalTo(40)
		}
	}
}
