import UIKit
import NetworkPlataform

class HomeViewController: UIViewController {
	
	init(withViewModel viewModel: HomeViewPresentable) {
		super.init(nibName: nil, bundle: nil)
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		APIProvider().makeTokenNetwork().requestUserToken() { [weak self] result in
			print(result)
			
			if let token = result.value?.token {
				let viewModel = LoginWebViewModel(requestToken: token)
				let viewController = TMVDBLoginViewController(viewModel: viewModel)
				self?.navigationController?.pushViewController(viewController, animated: true)
//				self?.present(viewController, animated: true, completion: nil)
			}
		}
	}
}

