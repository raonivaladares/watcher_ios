import UIKit
import SnapKit

class WelcomeViewController: UIViewController {
	let viewControllerBackgroundColor = UIColor(red: 43/255, green: 43/255, blue: 43/255, alpha: 1)
    
	// MARK: Private UI properties
    let titleLabel: UILabel = {
        let blueSo = UIColor.init(red: 109/255, green: 206/255, blue: 186/255, alpha: 1)
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 40)
        label.textColor = blueSo
        label.numberOfLines = 2
        label.adjustsFontSizeToFitWidth = true
        
        return label
    }()
    
	let appLogoImageView = UIImageView()
	let tmdLogoImageView = UIImageView()
	
	let tmdbDescriptionLabel: UILabel = {
        let blueSo = UIColor.init(red: 109/255, green: 206/255, blue: 186/255, alpha: 1)
		let label = UILabel()
		label.textAlignment = .left
		label.font = UIFont.boldSystemFont(ofSize: 18)
		label.textColor = blueSo
		label.numberOfLines = 2
        label.adjustsFontSizeToFitWidth = true
		
		return label
	}()
	
	let actionButton: UIButton = {
        let blueSo = UIColor.init(red: 109/255, green: 206/255, blue: 186/255, alpha: 1)
		let button = UIButton()
		button.setTitleColor(blueSo, for: .normal)
		button.backgroundColor = .clear
		button.layer.cornerRadius = 3
        button.layer.borderWidth = 3
        button.layer.borderColor = blueSo.cgColor
		button.addTarget(self, action: #selector(actionButtonHandler(_:)), for: .touchUpInside)
		
		return button
	}()
    
    let logoContainer = UIView()
    let centerContainerView = UIView()
    
    let bottomContainerStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 20
        
        return stackView
    }()
	
	// MARK: Private properties
	
	private let loadingController = LoadingViewController()
    
    enum States {
        case loading
        case show
        case error(ViewModelError)
    }
    
    enum ViewActions {
        case confirmed
    }
    
    var viewActionsHandler: ((ViewActions) -> Void)?
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
}

// MARK: ViewController life-cycle

extension WelcomeViewController {
	override func viewDidLoad() {
		super.viewDidLoad()
		view.backgroundColor = viewControllerBackgroundColor
		addChild(loadingController)
		view.addSubview(loadingController.view)
		loadingController.didMove(toParent: self)
		
		addViews()
		defineAndActivateConstraints()
        self.navigationController?.isNavigationBarHidden = true
	}
}

// MARK: - Public methods

extension WelcomeViewController {
    func bind(_ viewModel: WelcomeViewModel) {
        titleLabel.text = viewModel.title
        appLogoImageView.image = UIImage.init(named: viewModel.watcherLogoImageName)
        actionButton.setTitle(viewModel.buttonTitle, for: .normal)
        tmdLogoImageView.image = UIImage.init(named: viewModel.tmdbLogoImageName)
        tmdbDescriptionLabel.text = viewModel.tmdbDescription
        
        if viewModel.isLoading {
            loadingController.showLoading()
        } else {
            loadingController.hideLoading()
        }
        
        if let error = viewModel.viewModelError {
            let alertController = UIAlertController(title: error.title, message: error.message, preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: .default)
            alertController.addAction(okAction)
            
            self.present(alertController, animated: true, completion: nil)
        }
    }
}

// MARK: Action Handlers

extension WelcomeViewController {
	@objc private func actionButtonHandler(_ sender: UIButton) {
        viewActionsHandler?(.confirmed)
	}
}

// MARK: - Private methods - UI

extension WelcomeViewController {
	private func addViews() {
        logoContainer.addSubviews(titleLabel, appLogoImageView)
        centerContainerView.addSubviews(
            logoContainer,
            actionButton
        )
        bottomContainerStackView.addArrangedSubview(tmdLogoImageView)
        bottomContainerStackView.addArrangedSubview(tmdbDescriptionLabel)
        
        view.addSubviews(
			centerContainerView,
            bottomContainerStackView
		)
	}
	
	private func defineAndActivateConstraints() {
        centerContainerView.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().offset(40)
            $0.trailing.equalToSuperview().offset(-40)
            $0.height.equalToSuperview().multipliedBy(0.6)
        }
        
        logoContainer.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.height.equalToSuperview().multipliedBy(0.4)
        }
        
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
        }
        
		appLogoImageView.snp.makeConstraints {
			$0.top.equalTo(titleLabel.snp.bottom).offset(10)
            $0.bottom.equalToSuperview()
            $0.centerX.equalToSuperview()
            $0.width.equalTo(logoContainer.snp.height).multipliedBy(0.5)
            $0.height.equalToSuperview().multipliedBy(0.5)
		}
		
		actionButton.snp.makeConstraints {
			$0.centerX.equalToSuperview()
            $0.leading.equalToSuperview()
            $0.bottom.equalToSuperview()
			$0.trailing.equalToSuperview()
			$0.height.equalTo(60)
		}
        
        bottomContainerStackView.snp.makeConstraints {
            $0.leading.equalTo(view.safeAreaLayoutGuide.snp.leading).offset(60)
            $0.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(-20)
            $0.trailing.equalTo(view.safeAreaLayoutGuide.snp.trailing).offset(-60)
        }
        
        tmdLogoImageView.snp.makeConstraints {
            $0.width.equalTo(50)
            $0.height.equalTo(50)
        }
	}
}
