import UIKit
import NetworkPlataform

class HomeViewController: UIViewController {
	
	init(viewModel: HomeViewPresentable) {
		super.init(nibName: nil, bundle: nil)
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		view.backgroundColor = .blue
		
		APIProvider().makeTokenNetwork().requestUserToken() { [weak self] result in
			print(result)
			
			if let token = result.value?.token {
				let viewModel = LoginWebViewModel(requestToken: token)
				let viewController = TMVDBLoginViewController(viewModel: viewModel)
				self?.present(viewController, animated: true, completion: nil)
			}
		}
	}

}

