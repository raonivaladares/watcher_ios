import UIKit

class HomeViewController: UITabBarController, UITabBarControllerDelegate {
	
	// MARK: Private UI properties
//	private let tabBar: UITabBarController = {
//		let tabBar = UITabBarController()
//		let foo = SearchMovieViewController()
//		foo.tabBarItem = UITabBarItem(tabBarSystemItem: .search, tag: 0)
//		tabBar.viewControllers = [foo]
//		return tabBar
//	}()
//	private let buttonSearchMovie: UIButton = {
//		let button = UIButton()
//		button.setTitle("Search moview", for: .normal)
//		button.addTarget(self, action: #selector(buttonClicked), for: .touchUpInside)
//		button.translatesAutoresizingMaskIntoConstraints = false
//
//		return button
//	}()
	
	// MARK: Initialization
	
	init(withViewModel viewModel: HomeViewPresentable) {
		super.init(nibName: nil, bundle: nil)
	}
	
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	@objc private func buttonClicked(sender: UIButton) {
		let viewController = SearchMovieViewController()
		navigationController?.pushViewController(viewController, animated: true)
	}
}

// MARK: ViewController life-cycle

extension HomeViewController {
	override func viewDidLoad() {
		super.viewDidLoad()
		view.backgroundColor = .black
		
		addViews()
		defineAndActivateConstraints()
		delegate = self
	}
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		
		let controntoller = SearchMovieViewController()
		let navigation = UINavigationController(rootViewController: controntoller)
		let tabBarItem = UITabBarItem(tabBarSystemItem: .search, tag: 0)
		controntoller.tabBarItem = tabBarItem
		
		viewControllers = [navigation]
	}
	
	func tabBarController(_ tabBarController: UITabBarController, didSelectViewController viewController: UIViewController) {
		print("Selected \(viewController.title!)")
	}
}

// MARK: - Private methods - UI

extension HomeViewController {
	private func addViews() {
//		view.addSubview(buttonSearchMovie)
	}
	
	private func defineAndActivateConstraints() {
		NSLayoutConstraint.activate([
//			buttonSearchMovie.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//			buttonSearchMovie.centerYAnchor.constraint(equalTo: view.centerYAnchor)
		])
	}
}
