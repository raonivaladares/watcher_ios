import UIKit
import SnapKit

final class ApplicationSplashViewController: UIViewController {
    
    enum Event {
        case retryButtonTapped
    }
    
    private let logoImageView: UIImageView = {
        let image = UIImage(named: "watcher_logo")
        let imageView = UIImageView(image: image)
        imageView.contentMode = .center
        
        return imageView
    }()
    
    private let retryButton: UIButton = {
        let button = UIButton()
        button.setTitle("retry", for: .normal)
        button.backgroundColor = ApplicationColors.black.value
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(retryButtonHandler(_:)), for: .touchUpInside)
        
        return button
    }()
    
    private var isLoading: Bool = false {
        didSet {
            if isLoading {
                startLoadingAnimated()
            } else {
                stopLoadingAnimated()
            }
        }
    }
    
    // MARK: - Public properties
    
    var viewOutput: ((Event) -> Void)?
    
    
    // MARK: - Initialization
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Public viewController
    
    func bind(_ viewModel: ApplicationSplashViewModel){
        isLoading = viewModel.isLoading
        retryButton.isHidden = viewModel.isRetryButtonHidden
        
        if let viewModelError = viewModel.viewModelError {
            let alertController = UIAlertController(title: viewModelError.title, message: viewModelError.message, preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: .default)
            alertController.addAction(okAction)
            
            present(alertController, animated: true, completion: nil)
        }
    }
}

// MARK: - Life - cycle

extension ApplicationSplashViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.setNavigationBarHidden(true, animated: false)
        view.backgroundColor = ApplicationColors.yellow.value
        addViews()
        defineAndActivateConstraints()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
}

// MARK: - Event handlers

extension ApplicationSplashViewController {
    @objc private func retryButtonHandler(_ sender: UIButton) {
        viewOutput?(.retryButtonTapped)
    }
}

extension ApplicationSplashViewController {
    private func startLoadingAnimated() {
        UIView.animate(
            withDuration: 1,
            delay: 0,
            options: [.autoreverse, .repeat],
            animations: {
                self.logoImageView.transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
            }
        )
    }
    
    private func stopLoadingAnimated() {
        UIView.animate(
            withDuration: 1,
            delay: 0,
            options: .beginFromCurrentState,
            animations: {
                self.logoImageView.transform = CGAffineTransform(scaleX: 1, y: 1)
            }
        )
    }
}

// MARK: - Private methods - UI

extension ApplicationSplashViewController {
    private func addViews() {
        view.addSubviews(
            logoImageView,
            retryButton
        )
    }
    
    private func defineAndActivateConstraints() {
        logoImageView.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
        
        retryButton.snp.makeConstraints {
            $0.leading.equalTo(20)
            $0.bottom.equalTo(-20)
            $0.trailing.equalTo(-20)
        }
    }
}


enum ApplicationColors {
    case yellow
    case black
}

extension ApplicationColors {
    var value: UIColor {
        switch self {
        case .yellow: return UIColor(red: 255/255, green: 205/255, blue: 1/255, alpha: 1)
        case .black: return UIColor(red: 38/255, green: 38/255, blue: 38/255, alpha: 1)
        }
    }
}
