import UIKit

class MovieDetailsViewController: UIViewController {
    typealias ViewOutput = (Action) -> Void
    
    enum Action {}
    
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.backgroundColor = .red
        
        return scrollView
    }()
    
    var viewOutputHandler: ViewOutput?
}

// MARK: - Life cycle

extension MovieDetailsViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.AppColors.yellow
        
        addViewProperties()
        defineAndActivateConstraints()
    }
}

// MARK: - Private methods - UI

extension MovieDetailsViewController {
    private func addViewProperties() {
        view.addSubview(scrollView)
    }
    
    private func defineAndActivateConstraints() {
        scrollView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}
