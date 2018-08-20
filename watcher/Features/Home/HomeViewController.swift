import UIKit

class HomeViewController: UIViewController {
	
	init(withViewModel viewModel: HomeViewPresentable) {
		super.init(nibName: nil, bundle: nil)
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()

	}
}

