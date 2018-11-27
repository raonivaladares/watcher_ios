import UIKit
import Domain

struct AppCoordinator {
	var window: UIWindow
	let useCasesFactory = UseCasesFactory()
	
	init(window: UIWindow) {
			self.window = window
	}
	
	func start() {
		let viewModel = WelcomeViewModel(sessionUseCases: useCasesFactory.session)
		let controller = WelcomeViewController(viewModel: viewModel)
		let navigationController = UINavigationController(rootViewController: controller)
		
		window.rootViewController = navigationController
		window.makeKeyAndVisible()
	}
}

extension UIColor {
//	class var primaryAppColor: UIColor { return .black }
//	class var secundaryAppColor: UIColor { return UIColor(displayP3Red: 41/255, green: 46/255, blue: 52/255, alpha: 1) }
//	class var textColor: UIColor { return .white }
}
