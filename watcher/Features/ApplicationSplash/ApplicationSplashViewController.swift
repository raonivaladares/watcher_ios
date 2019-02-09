import UIKit
import SnapKit

final class ApplicationSplashViewController: UIViewController {
    private let spinnerContainerView: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        view.alpha = 0
        
        return view
    }()
    
    private let spinner: UIActivityIndicatorView = {
        let spinner = UIActivityIndicatorView(style: .whiteLarge)
        spinner.hidesWhenStopped = true
        spinner.isUserInteractionEnabled = true
        
        return spinner
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
    
    private func startLoadingAnimated() {
        UIView.transition(with: view, duration: 1, options: .transitionCrossDissolve, animations: {
            self.spinnerContainerView.alpha = 1
            self.spinner.startAnimating()
        })
    }
    
    private func stopLoadingAnimated() {
        UIView.transition(with: view, duration: 1, options: .transitionCrossDissolve, animations: {
            self.spinnerContainerView.alpha = 0
            self.spinner.stopAnimating()
        })
    }
    
    var viewOutput: ((Event) -> Void)?
    
    enum Event {
        case retry
    }
    
    @objc private func retryButtonHandler(_ sender: UIButton) {
        
    }
    
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
        if let viewModelError = viewModel.viewModelError {
            let alertController = UIAlertController(title: viewModelError.title, message: viewModelError.message, preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: .default)
            alertController.addAction(okAction)
            
            self.present(alertController, animated: true, completion: nil)
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

// MARK: - Private methods - UI

extension ApplicationSplashViewController {
    private func addViews() {
        spinnerContainerView.addSubview(spinner)
        view.addSubviews(
            spinnerContainerView,
            retryButton
            )
    }
    
    private func defineAndActivateConstraints() {
        spinnerContainerView.snp.makeConstraints {
            $0.center.equalToSuperview()
            $0.width.equalTo(100)
            $0.height.equalTo(100)
        }
        
        spinner.snp.makeConstraints {
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
