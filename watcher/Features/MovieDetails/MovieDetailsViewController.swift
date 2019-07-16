import UIKit

class MovieDetailsViewController: UIViewController {
    typealias ViewOutput = (Action) -> Void
    
    enum Action {}
    
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        
        return scrollView
    }()
    
    private let contentView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.AppColors.yellow
        
        return view
    }()
    
    private let coverImageView: CoverImageView = {
        let coverImageView = CoverImageView()
        
        return coverImageView
    }()
    
    var viewOutputHandler: ViewOutput?
}

// MARK: - Life cycle

extension MovieDetailsViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addViewProperties()
        defineAndActivateConstraints()
    }
}

// MARK: - Private methods - UI

extension MovieDetailsViewController {
    private func addViewProperties() {
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubviews(coverImageView)
    }
    
    private func defineAndActivateConstraints() {
        scrollView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        contentView.snp.makeConstraints {
            $0.width.equalToSuperview()
            $0.height.equalToSuperview()
            $0.edges.equalToSuperview()
        }
        
        coverImageView.snp.makeConstraints {
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.height.equalTo(100)
        }
    }
}
