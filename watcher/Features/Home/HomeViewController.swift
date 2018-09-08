import UIKit

class HomeViewController: UIViewController {
	
	// MARK: Private UI properties
	
	private let buttonSearchMovie: UIButton = {
		let button = UIButton()
		button.setTitle("Search moview", for: .normal)
		button.translatesAutoresizingMaskIntoConstraints = false
		
		return button
	}()
	
	// MARK: Initialization
	
	init(withViewModel viewModel: HomeViewPresentable) {
		super.init(nibName: nil, bundle: nil)
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}

// MARK: ViewController life-cycle

extension HomeViewController {
	override func viewDidLoad() {
		super.viewDidLoad()
		view.backgroundColor = .blue
		
	}
}

// MARK: - Private methods - UI

extension HomeViewController {
	private func addViews() {
		view.addSubview(buttonSearchMovie)
	}
	
	private func defineAndActivateConstraints() {
		NSLayoutConstraint.activate([
			buttonSearchMovie.centerXAnchor.constraint(equalTo: view.centerXAnchor),
			buttonSearchMovie.centerYAnchor.constraint(equalTo: view.centerYAnchor)
		])
	}
}
