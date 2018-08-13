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
		APIProvider().makeTokenNetwork().requestAPIToken()
	}

}

