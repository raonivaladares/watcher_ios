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
    
    private let movieSummaryView: MovieSummaryView = {
        let view = MovieSummaryView()
        
        return view
    }()
    
    private let sinopseView: MovieSinopseView = {
        let view = MovieSinopseView()
        
        return view
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
        contentView.addSubview(movieSummaryView)
        contentView.addSubview(sinopseView)
    }
    
    private func defineAndActivateConstraints() {
        scrollView.snp.makeConstraints {
            $0.edges.equalTo(view.safeAreaLayoutGuide.snp.edges)
        }
        
        contentView.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.centerY.equalToSuperview().priority(.low)
            $0.edges.equalToSuperview()
        }
        
        coverImageView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.height.equalTo(400)
        }
        
        movieSummaryView.snp.makeConstraints {
            $0.top.equalTo(coverImageView.snp.bottom)
            $0.leading.equalToSuperview().offset(25)
            $0.trailing.equalToSuperview().offset(-25)
            $0.height.equalTo(100)
        }
        
        sinopseView.snp.makeConstraints {
            $0.top.equalTo(movieSummaryView.snp.bottom)
            $0.leading.equalToSuperview().offset(25)
            $0.bottom.lessThanOrEqualTo(contentView.snp.bottom)
            $0.trailing.equalToSuperview().offset(-25)
        }
    }
}
