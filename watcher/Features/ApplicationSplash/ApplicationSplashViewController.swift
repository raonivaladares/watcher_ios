import UIKit
import SnapKit

final class ApplicationSplashViewController: UIViewController {
    private let spinner: UIActivityIndicatorView = {
        let spinner = UIActivityIndicatorView(style: .whiteLarge)
        spinner.hidesWhenStopped = true
        spinner.isUserInteractionEnabled = true
        spinner.startAnimating()
        
        return spinner
    }()
    
    // MARK: - Initialization
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
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
        view.addSubviews(spinner)
    }
    
    private func defineAndActivateConstraints() {
        spinner.snp.makeConstraints {
            $0.center.equalToSuperview()
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
