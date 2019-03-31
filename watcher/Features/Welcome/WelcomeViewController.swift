import UIKit
import SnapKit

class WelcomeViewController: UIViewController {
	let viewControllerBackgroundColor = UIColor(red: 254/255, green: 211/255, blue: 0/255, alpha: 1)
    
	// MARK: Private UI properties
    
	let appLogoImageView = UIImageView()
    
    let welcomeDescriptionLabel: UILabel = {
        let blueSo = UIColor.init(red: 43/255, green: 43/255, blue: 43/255, alpha: 1)
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textColor = blueSo
        label.numberOfLines = 0
        label.adjustsFontSizeToFitWidth = true
        
        return label
    }()
    
    let actionButton: UIButton = {
        let blueSo = UIColor.init(red: 43/255, green: 43/255, blue: 43/255, alpha: 1)
        let button = UIButton()
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = blueSo
        button.layer.cornerRadius = 15
        button.addTarget(self, action: #selector(actionButtonHandler(_:)), for: .touchUpInside)
        
        return button
    }()
    
	let tmdLogoImageView = UIImageView()
	
	let tmdbDescriptionLabel: UILabel = {
        let blueSo = UIColor.init(red: 43/255, green: 43/255, blue: 43/255, alpha: 0.4)
		let label = UILabel()
		label.textAlignment = .left
		label.font = UIFont.boldSystemFont(ofSize: 14)
		label.textColor = blueSo
		label.numberOfLines = 2
        label.adjustsFontSizeToFitWidth = true
		
		return label
	}()
	
    let centerContainerView = UIView()
    
    let bottomContainerStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 20
        
        return stackView
    }()
	
	// MARK: Private properties
	
	private let loadingController = LoadingViewController()
    
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
        viewModel.title.executeIfChanged { welcomeDescriptionLabel.text = $0 }
        viewModel.watcherLogoImageName.executeIfChanged { appLogoImageView.image = UIImage(named: $0) }
        viewModel.buttonTitle.executeIfChanged { actionButton.setTitle($0, for: .normal) }
        viewModel.tmdbLogoImageName.executeIfChanged { tmdLogoImageView.image = UIImage(named: $0) }
        viewModel.tmdbDescription.executeIfChanged {tmdbDescriptionLabel.text = $0}
        
        if viewModel.isLoading.value {
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
        centerContainerView.addSubviews(
            appLogoImageView,
            welcomeDescriptionLabel,
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
//        centerContainerView.backgroundColor = .red
        centerContainerView.snp.makeConstraints {
            $0.centerY.equalToSuperview().offset(-10)
            $0.leading.equalToSuperview().offset(40)
            $0.trailing.equalToSuperview().offset(-40)
            $0.height.equalToSuperview().multipliedBy(0.65)
        }
        
        appLogoImageView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.centerX.equalToSuperview()
        }
        
        welcomeDescriptionLabel.snp.makeConstraints {
            $0.top.equalTo(appLogoImageView.snp.bottom).offset(40)
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
        }
		
		actionButton.snp.makeConstraints {
			$0.centerX.equalToSuperview()
            $0.top.equalTo(welcomeDescriptionLabel.snp.bottom).offset(40)
            $0.leading.equalToSuperview()
            $0.bottom.lessThanOrEqualToSuperview()
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
            $0.height.equalTo(44)
        }
	}
}
