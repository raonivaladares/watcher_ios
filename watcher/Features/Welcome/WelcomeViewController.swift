import UIKit
import SnapKit

class WelcomeViewController: UIViewController {
	
	// MARK: Private UI properties
	let appLogoImageView: UIImageView = {
		let imageView = UIImageView()
		imageView.image = UIImage(named: "tmdb_logo")
		
		return imageView
	}()
	
	let subTitleLabel: UILabel = {
		let label = UILabel()
		label.text = "Welcome to the\n Watcher"
		label.textAlignment = .center
		label.font = UIFont.boldSystemFont(ofSize: 22)
		label.textColor = .red
		label.numberOfLines = 2
		
		return label
	}()
	
	let bodyLabel: UILabel = {
		let label = UILabel()
		label.text = "A place to see movies, bla bla bla.... bla bla bla... bla bla bla"
		label.textAlignment = .center
		label.font = UIFont.boldSystemFont(ofSize: 15)
		label.textColor = .red
		label.numberOfLines = 0
		
		return label
	}()
	
	let tmdLogoImageView: UIImageView = {
		let imageView = UIImageView()
		imageView.image = UIImage(named: "tmdb_logo")
		
		return imageView
	}()
	
	let tmdbDescriptionLabel: UILabel = {
		let label = UILabel()
		label.text = "Thanks The movie DB for the content"
		label.textAlignment = .center
		label.font = UIFont.boldSystemFont(ofSize: 12)
		label.textColor = .red
		label.numberOfLines = 0
		
		return label
	}()
	
	let actionButton: UIButton = {
		let button = UIButton()
		button.setTitle("Start", for: .normal)
		button.setTitleColor(.red, for: .normal)
		button.backgroundColor = .blue
		button.layer.cornerRadius = 10
		button.addTarget(self, action: #selector(actionButtonHandler(_:)), for: .touchUpInside)
		
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
	@objc private func actionButtonHandler(_ sender: UIButton) {
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
		view.addSubviews(
			appLogoImageView,
			subTitleLabel,
			bodyLabel,
			tmdLogoImageView,
			tmdbDescriptionLabel,
			actionButton
		)
	}
	
	private func defineAndActivateConstraints() {
		let topOrBottomMargins: CGFloat = 20
		let sideMargins: CGFloat = 16
		
		appLogoImageView.snp.makeConstraints {
			$0.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(20)
			$0.centerX.equalToSuperview()
			$0.width.equalTo(80)
			$0.height.equalTo(80)
		}
		
		subTitleLabel.snp.makeConstraints {
			$0.top.equalTo(appLogoImageView.snp.bottom).offset(topOrBottomMargins)
			$0.leading.equalTo(view.safeAreaLayoutGuide.snp.leading).offset(sideMargins)
			$0.trailing.equalTo(view.safeAreaLayoutGuide.snp.trailing).offset(-sideMargins)
		}
		
		bodyLabel.snp.makeConstraints {
			$0.top.equalTo(subTitleLabel.snp.bottom).offset(topOrBottomMargins)
			$0.leading.equalTo(view.safeAreaLayoutGuide.snp.leading).offset(sideMargins)
			$0.trailing.equalTo(view.safeAreaLayoutGuide.snp.trailing).offset(-sideMargins)
		}
		
		tmdLogoImageView.snp.makeConstraints {
			$0.bottom.equalTo(tmdbDescriptionLabel.snp.top).offset(-topOrBottomMargins)
			$0.centerX.equalToSuperview()
			$0.width.equalTo(50)
			$0.height.equalTo(50)
		}
		
		tmdbDescriptionLabel.snp.makeConstraints {
			$0.bottom.equalTo(actionButton.snp.top).offset(-topOrBottomMargins)
			$0.leading.equalTo(view.safeAreaLayoutGuide.snp.leading).offset(sideMargins)
			$0.trailing.equalTo(view.safeAreaLayoutGuide.snp.trailing).offset(-sideMargins)
		}
		
		actionButton.snp.makeConstraints {
			$0.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(-40)
			$0.centerX.equalToSuperview()
			$0.width.equalTo(200)
			$0.height.equalTo(40)
		}
	}
}
